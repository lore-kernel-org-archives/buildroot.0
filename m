From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Jan 2013 12:44:14 +0100
Subject: [Buildroot] [git commit] uboot-tools: bump to version 2013.01
Message-ID: <20130118121227.CFD199A27C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef49a1f62762f47cea4459d03a3c49c3e55b8992
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../uboot-tools-drop-configh-from-tools.patch      |   31 --------------------
 package/uboot-tools/uboot-tools.mk                 |    2 +-
 2 files changed, 1 insertions(+), 32 deletions(-)

diff --git a/package/uboot-tools/uboot-tools-drop-configh-from-tools.patch b/package/uboot-tools/uboot-tools-drop-configh-from-tools.patch
deleted file mode 100644
index 2b3a0e5..0000000
--- a/package/uboot-tools/uboot-tools-drop-configh-from-tools.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 39857718f4df9b40a7acf38b73140fd86c628ef0 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Mon, 30 Apr 2012 09:07:38 -0300
-Subject: [PATCH] fw_env: allow it to build without a config
-
-We need to build u-boot tools without a board configuration for the
-target packages.
-fw_env just uses config.h to define the default environment of the
-created image, so it really isn't mandatory.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- tools/env/fw_env.c |    2 --
- 1 files changed, 0 insertions(+), 2 deletions(-)
-
-diff --git a/tools/env/fw_env.c b/tools/env/fw_env.c
-index e292d2b..2bb061a 100644
---- a/tools/env/fw_env.c
-+++ b/tools/env/fw_env.c
-@@ -45,8 +45,6 @@
- 
- #include "fw_env.h"
- 
--#include <config.h>
--
- #define WHITESPACE(c) ((c == '\t') || (c == ' '))
- 
- #define min(x, y) ({				\
--- 
-1.7.3.4
-
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 5957a3d..3470b60 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -3,7 +3,7 @@
 # uboot-tools
 #
 #############################################################
-UBOOT_TOOLS_VERSION = 2012.10
+UBOOT_TOOLS_VERSION = 2013.01
 UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
