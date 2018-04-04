From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Apr 2018 17:52:45 +0200
Subject: [Buildroot] [git commit] uboot-tools: bump to version 2018.03
Message-ID: <20180404155401.C81B283E9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f5b0fba991a47077518e3b7dc3fdd6d993bdd57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch 0004 as it is already applied upstream.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...de-U-Boot-libfdt-headers-from-their-actua.patch | 33 ----------------------
 package/uboot-tools/uboot-tools.hash               |  2 +-
 package/uboot-tools/uboot-tools.mk                 |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/package/uboot-tools/0004-tools-Include-U-Boot-libfdt-headers-from-their-actua.patch b/package/uboot-tools/0004-tools-Include-U-Boot-libfdt-headers-from-their-actua.patch
deleted file mode 100644
index 9f18342868..0000000000
--- a/package/uboot-tools/0004-tools-Include-U-Boot-libfdt-headers-from-their-actua.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e0d20dc1521e74b82dbd69be53a048847798a90a Mon Sep 17 00:00:00 2001
-From: Paul Kocialkowski <contact@paulk.fr>
-Date: Fri, 2 Mar 2018 23:13:42 +0100
-Subject: [PATCH] tools: Include U-Boot libfdt headers from their actual path
-
-There are no headers for libfdt in lib/libfdt, as they are instead
-located in scripts/dtc/libfdt. Specifying lib/libfdt for headers
-inclusion in host tools results in using the system libfdt headers,
-which is not what we want. Change this to the proper path.
-
-Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
-[Backport from upstream commit e0d20dc1521e74b82dbd69be53a048847798a90a]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- tools/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/Makefile b/tools/Makefile
-index d3387fad69..f38f68ee47 100644
---- a/tools/Makefile
-+++ b/tools/Makefile
-@@ -244,7 +244,7 @@ endif # !LOGO_BMP
- #
- HOST_EXTRACFLAGS += -include $(srctree)/include/compiler.h \
- 		$(patsubst -I%,-idirafter%, $(filter -I%, $(UBOOTINCLUDE))) \
--		-I$(srctree)/lib/libfdt \
-+		-I$(srctree)/scripts/dtc/libfdt \
- 		-I$(srctree)/tools \
- 		-DUSE_HOSTCC \
- 		-D__KERNEL_STRICT_NAMES \
--- 
-2.14.3
-
diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index 9425df3f17..788c1696f8 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  938f597394b33e82e5af8c98bd5ea1a238f61892aabef36384adbf7ca5b52dda  u-boot-2018.01.tar.bz2
+sha256  7e7477534409d5368eb1371ffde6820f0f79780a1a1f676161c48442cb303dfd  u-boot-2018.03.tar.bz2
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index cc57ce84de..882576d2d5 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2018.01
+UBOOT_TOOLS_VERSION = 2018.03
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPL-2.0+
