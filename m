From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 01 Dec 2017 21:01:04 -0000
Subject: [Buildroot] [git commit] uboot-tools: bump to version 2017.11
Message-ID: <20171201205331.957A97FBCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a515b56c725654b166f0940d9ea61a8b5b23508
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch 0005 as it has already been applied upstream.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-not-attempt-to-use-the-systemwide-libfdt.patch | 56 ----------------------
 package/uboot-tools/uboot-tools.hash               |  2 +-
 package/uboot-tools/uboot-tools.mk                 |  2 +-
 3 files changed, 2 insertions(+), 58 deletions(-)

diff --git a/package/uboot-tools/0005-Do-not-attempt-to-use-the-systemwide-libfdt.patch b/package/uboot-tools/0005-Do-not-attempt-to-use-the-systemwide-libfdt.patch
deleted file mode 100644
index abeef65..0000000
--- a/package/uboot-tools/0005-Do-not-attempt-to-use-the-systemwide-libfdt.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 477ecb8d9ffa7b90d8bec0d8317b7e464e906f7c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
-Date: Fri, 3 Nov 2017 03:06:35 +0100
-Subject: [PATCH] Do not attempt to use the systemwide libfdt
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-U-Boot bundles a patched copy of libfdt, so it's wrong to attempt to
-include it <like/this>. This breaks the build for me when I have dtc
-fully installed in my host -- as happened earlier tonight with
-Buildroot, for example.
-
-There are several other occurrences throughout the code where '<libfdt'
-matches. I'm not modifying these because I have no clue why the
-<systemwide> include style is being used -- IMHO wrongly.
-
-Signed-off-by: Jan Kundr??t <jan.kundrat@cesnet.cz>
----
- include/fdt.h    | 2 +-
- include/libfdt.h | 2 +-
- tools/fdtgrep.c  | 4 ++--
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/include/fdt.h b/include/fdt.h
-index 7ead62e..f40b56c 100644
---- a/include/fdt.h
-+++ b/include/fdt.h
-@@ -1 +1 @@
--#include <../lib/libfdt/fdt.h>
-+#include "../lib/libfdt/fdt.h"
-diff --git a/include/libfdt.h b/include/libfdt.h
-index 10296a2..7ba13e6 100644
---- a/include/libfdt.h
-+++ b/include/libfdt.h
-@@ -1 +1 @@
--#include <../lib/libfdt/libfdt.h>
-+#include "../lib/libfdt/libfdt.h"
-diff --git a/tools/fdtgrep.c b/tools/fdtgrep.c
-index f51f5f1..5897b6d 100644
---- a/tools/fdtgrep.c
-+++ b/tools/fdtgrep.c
-@@ -16,8 +16,8 @@
- #include <string.h>
- #include <unistd.h>
- 
--#include <../include/libfdt.h>
--#include <libfdt_internal.h>
-+#include "../include/libfdt.h"
-+#include "libfdt_internal.h"
- 
- /* Define DEBUG to get some debugging output on stderr */
- #ifdef DEBUG
--- 
-2.14.2
-
diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index 82efc79..db15efb 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  b2d15f2cf5f72e706025cde73d67247c6da8cd35f7e10891eefe7d9095089744  u-boot-2017.09.tar.bz2
+sha256  6a018fd3caf58f3dcfa23ee989a82bd35df03af71872b9dca8c6d758a0d26c05  u-boot-2017.11.tar.bz2
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index c936575..04b5268 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2017.09
+UBOOT_TOOLS_VERSION = 2017.11
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPL-2.0+
