From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  6 Jan 2009 16:10:57 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot/2009.01-rc1
Message-ID: <20090106161057.2654276BFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-06 16:10:56 +0000 (Tue, 06 Jan 2009)
New Revision: 24700

Log:
Fix some CFG/CONFIG related problems for AT91RM9200 configuration of U-Boot

Modified:
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-002-at91rm9200dk.h.patch
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-004-at91rm9200ek.patch


Changeset:
Modified: trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-002-at91rm9200dk.h.patch
===================================================================
--- trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-002-at91rm9200dk.h.patch	2009-01-06 16:09:53 UTC (rev 24699)
+++ trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-002-at91rm9200dk.h.patch	2009-01-06 16:10:56 UTC (rev 24700)
@@ -182,7 +182,7 @@
 +#define CONFIG_SYS_MAX_DATAFLASH_PAGES		16384
 +#define CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0	0xC0000000	/* Logical adress for CS0 */
 +#define CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS3	0xD0000000	/* Logical adress for CS3 */
-+#define	CFG_SUPPORT_BLOCK_ERASE		1
++#define CONFIG__SUPPORT_BLOCK_ERASE		1
 +
 +
 +#define PHYS_FLASH_1			0x10000000

Modified: trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-004-at91rm9200ek.patch
===================================================================
--- trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-004-at91rm9200ek.patch	2009-01-06 16:09:53 UTC (rev 24699)
+++ trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-004-at91rm9200ek.patch	2009-01-06 16:10:56 UTC (rev 24700)
@@ -133,8 +133,8 @@
 +#define CONFIG_DOS_PARTITION		1
 +#define CONFIG_MMC			1
 +#define CONFIG_SUPPORT_VFAT		1
-+#define CFG_MMC_BASE			0xFFFB4000	/* From AT91RM9200.h*/
-+#define CFG_MMC_BLOCKSIZE		512
++#define CONFIG__MMC_BASE			0xFFFB4000	/* From AT91RM9200.h*/
++#define CONFIG__MMC_BLOCKSIZE		512
 +
 +#define CONFIG_NAND_LEGACY
 +
@@ -185,14 +185,14 @@
 +#define DATAFLASH_TCHS	(0x1 << 24)
 +
 +#define CONFIG_HAS_DATAFLASH		1
-+#define BOARD_LATE_INIT			1
++#undef BOARD_LATE_INIT
 +
 +#define CONFIG_SYS_SPI_WRITE_TOUT		(5*CONFIG_SYS_HZ)
 +#define CONFIG_SYS_MAX_DATAFLASH_BANKS		2
 +#define CONFIG_SYS_MAX_DATAFLASH_PAGES		16384
 +#define CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0	0xC0000000	/* Logical adress for CS0 */
 +#define CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS3	0xD0000000	/* Logical adress for CS3 */
-+#define	CFG_SUPPORT_BLOCK_ERASE		1
++#define CONFIG__SUPPORT_BLOCK_ERASE		1
 +
 +#define PHYS_FLASH_1			0x10000000
 +#define PHYS_FLASH_SIZE			0x800000  /* 2 megs main flash */
@@ -447,7 +447,7 @@
 +#define CONFIG_SYS_MAX_DATAFLASH_PAGES		16384
 +#define CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0	0xC0000000	/* Logical adress for CS0 */
 +#define CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS3	0xD0000000	/* Logical adress for CS3 */
-+#define	CFG_SUPPORT_BLOCK_ERASE		1
++#define CONFIG__SUPPORT_BLOCK_ERASE		1
 +
 +#define PHYS_FLASH_1			0x10000000
 +#define PHYS_FLASH_SIZE			0x800000  /* 2 megs main flash */
@@ -462,9 +462,9 @@
 +
 +#ifdef CONFIG_ENV_IS_IN_DATAFLASH
 +#ifdef	CONFIG_NEW_PARTITION		
-+#define CFG_ENV_OFFSET			0x21000
-+#define CFG_ENV_ADDR			(CFG_DATAFLASH_LOGIC_ADDR_CS0 + CFG_ENV_OFFSET)
-+#define CFG_ENV_SIZE			0x2000  /* 8 * 1056 really , but start.s is not OK with this*/
++#define CONFIG__ENV_OFFSET			0x21000
++#define CONFIG__ENV_ADDR			(CONFIG_SYS__DATAFLASH_LOGIC_ADDR_CS0 + CONFIG__ENV_OFFSET)
++#define CONFIG__ENV_SIZE			0x2000  /* 8 * 1056 really , but start.s is not OK with this*/
 +> #else
 +#define CONFIG_ENV_OFFSET		0x20000
 +#define CONFIG_ENV_ADDR			(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
