From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:07:56 +0200
Subject: [Buildroot] [PATCH 10/46] u-boot: remove reference to old
	1.2.0-atmel version
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <bdd072eccd0d654636bd2c8144026d4e85177e2a.1275343447.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/u-boot.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index 466d4a0..4edef12 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -46,11 +46,7 @@ ifeq ($(BR2_TARGET_UBOOT_TOOL_ENV),y)
 U_BOOT_TARGETS+=$(TARGET_DIR)/usr/sbin/fw_printenv
 endif
 
-U_BOOT_CONFIGURE_OPTS :=
-
-ifneq ($(BR2_TARGET_UBOOT_1_2_0_ATMEL),)
 U_BOOT_CONFIGURE_OPTS += CONFIG_NOSOFTFLOAT=1
-endif
 
 # Define a helper function
 define insert_define
-- 
1.7.0.4
