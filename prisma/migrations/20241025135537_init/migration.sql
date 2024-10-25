-- CreateTable
CREATE TABLE `Habit` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `HabitAction` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `habitId` INTEGER NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `HabitResult` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `habitId` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `HabitResultAction` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `habitResultId` INTEGER NOT NULL,
    `habitActionId` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `HabitAction` ADD CONSTRAINT `HabitAction_habitId_fkey` FOREIGN KEY (`habitId`) REFERENCES `Habit`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `HabitResult` ADD CONSTRAINT `HabitResult_habitId_fkey` FOREIGN KEY (`habitId`) REFERENCES `Habit`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `HabitResultAction` ADD CONSTRAINT `HabitResultAction_habitResultId_fkey` FOREIGN KEY (`habitResultId`) REFERENCES `HabitResult`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `HabitResultAction` ADD CONSTRAINT `HabitResultAction_habitActionId_fkey` FOREIGN KEY (`habitActionId`) REFERENCES `HabitAction`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
