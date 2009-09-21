From: Anders Darander <anders.darander@gmail.com>
Date: Mon, 21 Sep 2009 10:22:44 +0200
Subject: [Buildroot] [PATCH v2] Updating syslinux to v3.82.
Message-ID: <1253521364-28259-1-git-send-email-anders.darander@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Anders Darander <ad@datarespons.se>

Signed-off-by: Anders Darander <ad@datarespons.se>
---
 target/x86/syslinux/Config.in                    |    3 ++-
 target/x86/syslinux/syslinux-3.61-makefile.patch |   11 -----------
 target/x86/syslinux/syslinux-3.82-makefile.patch |   11 +++++++++++
 target/x86/syslinux/syslinux.mk                  |    4 ++--
 4 files changed, 15 insertions(+), 14 deletions(-)
 delete mode 100644 target/x86/syslinux/syslinux-3.61-makefile.patch
 create mode 100644 target/x86/syslinux/syslinux-3.82-makefile.patch

diff --git a/target/x86/syslinux/Config.in b/target/x86/syslinux/Config.in
index 6a946e4..03191fd 100644
--- a/target/x86/syslinux/Config.in
+++ b/target/x86/syslinux/Config.in
@@ -1,8 +1,9 @@
 config BR2_TARGET_SYSLINUX
-	bool "syslinux"
+	bool "syslinux family"
 	depends on BR2_i386
 	help
 	  The syslinux bootloader for x86 systems.
+          This includes: syslinux, pxelinux, extlinux.
 
 config BR2_TARGET_PXELINUX
 	bool "pxelinux"
diff --git a/target/x86/syslinux/syslinux-3.61-makefile.patch b/target/x86/syslinux/syslinux-3.61-makefile.patch
deleted file mode 100644
index 22859e8..0000000
--- a/target/x86/syslinux/syslinux-3.61-makefile.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/Makefile	2008-02-18 09:39:41.000000000 -0500
-+++ b/Makefile	2008-02-18 09:43:21.000000000 -0500
-@@ -75,7 +75,7 @@ BTARGET  = kwdhash.gen version.gen versi
- 	   ldlinux.bss ldlinux.sys ldlinux.bin \
- 	   pxelinux.0 isolinux.bin isolinux-debug.bin \
- 	   extlinux.bin extlinux.bss extlinux.sys
--BOBJECTS = $(BTARGET) mbr/mbr.bin dos/syslinux.com win32/syslinux.exe \
-+BOBJECTS = $(BTARGET) mbr/mbr.bin dos/syslinux.com  \
- 	memdisk/memdisk memdump/memdump.com
- # BESUBDIRS and IESUBDIRS are "early", i.e. before the root; BSUBDIRS
- # and ISUBDIRS are "late", after the root.
diff --git a/target/x86/syslinux/syslinux-3.82-makefile.patch b/target/x86/syslinux/syslinux-3.82-makefile.patch
new file mode 100644
index 0000000..9e98a78
--- /dev/null
+++ b/target/x86/syslinux/syslinux-3.82-makefile.patch
@@ -0,0 +1,11 @@
+--- syslinux-3.82-org/Makefile	2009-09-17 13:11:23.000000000 +0200
++++ syslinux-3.82/Makefile	2009-09-17 13:13:32.000000000 +0200
+@@ -42,7 +42,7 @@
+ 	mbr/mbr_c.bin mbr/altmbr_c.bin mbr/gptmbr_c.bin \
+ 	mbr/mbr_f.bin mbr/altmbr_f.bin mbr/gptmbr_f.bin \
+ 	core/pxelinux.0 core/isolinux.bin core/isolinux-debug.bin \
+-	gpxe/gpxelinux.0 dos/syslinux.com win32/syslinux.exe \
++	gpxe/gpxelinux.0 dos/syslinux.com \
+ 	$(MODULES)
+ 
+ # BSUBDIRs build the on-target binary components.
diff --git a/target/x86/syslinux/syslinux.mk b/target/x86/syslinux/syslinux.mk
index 27930c7..f45d502 100644
--- a/target/x86/syslinux/syslinux.mk
+++ b/target/x86/syslinux/syslinux.mk
@@ -22,12 +22,12 @@ ifeq ($(SYSLINUX_SUPPORTED_ARCH),y)
 #
 #############################################################
 
-SYSLINUX_VERSION:=3.61
+SYSLINUX_VERSION:=3.82
 SYSLINUX_DIR=$(BUILD_DIR)/syslinux-$(SYSLINUX_VERSION)
 SYSLINUX_DIR2=$(TOOL_BUILD_DIR)/syslinux-$(SYSLINUX_VERSION)
 SYSLINUX_SOURCE=syslinux-$(SYSLINUX_VERSION).tar.bz2
 SYSLINUX_CAT:=$(BZCAT)
-SYSLINUX_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/Old
+SYSLINUX_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/
 SYSLINUX_BIN=$(SYSLINUX_DIR2)/mtools/syslinux
 
 
-- 
1.6.4.3
