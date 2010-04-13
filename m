From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 17:05:22 +0200
Subject: [Buildroot] [PATCH 10/35] u-boot: remove reference to old
	1.2.0-atmel version
In-Reply-To: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
Message-ID: <878f9364f36d7d9b58cf1091c28b70871377b7a1.1271170913.git.thomas.petazzoni@free-electrons.com>
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
1.6.3.3
