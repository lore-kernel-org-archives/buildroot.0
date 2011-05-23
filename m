From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
Date: Mon, 23 May 2011 18:19:30 +0200
Subject: [Buildroot] [PATCH] toolchain: fixed version
Message-ID: <1306167570-14491-1-git-send-email-schwarzkopf@sensortherm.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* fixed: external toolchain CODESOURCERY ARM2009Q1 downloaded version ARM2009Q3
* add CODESOURCERY ARM2009Q1 for ti dvsdk 3.10.

Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 toolchain/toolchain-external/Config.in   |   14 ++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    3 +++
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 079c097..84e8ef8 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -45,6 +45,20 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
              - ARMv4T, little endian, soft-float, glibc
              - ARMv7-A, Thumb 2, little endian, soft-float, glibc
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3
+	bool "CodeSourcery ARM 2009q3"
+	depends on BR2_arm
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Toolchain for the ARM architecture, from CodeSourcery. It
+	  uses gcc 4.4.1, binutils 2.19, glibc 2.10 and gdb 6.8 and
+	  kernel headers 2.6.30. It has support for the following
+	  variants:
+            - ARMv5T, little endian, soft-float, glibc
+            - ARMv4T, little endian, soft-float, glibc
+            - ARMv7-A, Thumb 2, little endian, soft-float, glibc
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q1
 	bool "CodeSourcery ARM 2009q1"
 	depends on BR2_arm
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 6d12ba7..9171e85 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -163,6 +163,9 @@ TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(STAMP_DIR)/ext-toolchain-checked
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q1),y)
+TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/arm/portal/package4571/public/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SOURCE=arm-2009q1-203-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3),y)
 TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/arm/portal/package5383/public/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2009q3-67-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1),y)
-- 
1.7.0.4
