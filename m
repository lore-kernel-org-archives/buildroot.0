From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Mar 2012 23:09:41 +0100
Subject: [Buildroot] [git commit] util-linux: bump to version 2.20.1
Message-ID: <20120311222556.E05DA90D4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf6a940a519ea4304b1c8dbde514737ffc837fd4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/util-linux/util-linux-script-libintl.patch |   30 --------------------
 package/util-linux/util-linux.mk                   |    3 +-
 2 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/package/util-linux/util-linux-script-libintl.patch b/package/util-linux/util-linux-script-libintl.patch
deleted file mode 100644
index 0700aa4..0000000
--- a/package/util-linux/util-linux-script-libintl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 075f251b19509f588d828a81d91b40f47e63e3de Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Mon, 5 Sep 2011 21:46:25 +0200
-Subject: [PATCH] script.c: drop libintl.h include
-
-Commit 8fb810ff26 (script: include-what-you-use header check) added a
-<libintl.h> #include, which isn't needed as nls.h includes it (if
-enabled) - But worse, breaks the build for systems without libintl.h
-(like some uClibc configurations).
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- term-utils/script.c |    1 -
- 1 files changed, 0 insertions(+), 1 deletions(-)
-
-diff --git a/term-utils/script.c b/term-utils/script.c
-index d96ca2f..f708e91 100644
---- a/term-utils/script.c
-+++ b/term-utils/script.c
-@@ -55,7 +55,6 @@
- #include <getopt.h>
- #include <unistd.h>
- #include <fcntl.h>
--#include <libintl.h>
- #include <limits.h>
- #include <locale.h>
- #include <stddef.h>
--- 
-1.7.5.4
-
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 86d970f..d8a3ac9 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -3,13 +3,14 @@
 # util-linux
 #
 #############################################################
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
 UTIL_LINUX_VERSION_MAJOR = 2.20
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.bz2
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 UTIL_LINUX_AUTORECONF = YES
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkg-config
+UTIL_LINUX_CONF_ENV = scanf_cv_type_modifier=no
 
 UTIL_LINUX_CONF_OPT += --disable-rpath --disable-makeinstall-chown
 
