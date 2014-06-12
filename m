From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Jun 2014 21:45:31 +0200
Subject: [Buildroot] [git commit] faifa: Bump version
Message-ID: <20140612200404.EBC1E99EBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23a4e7eaa467cf9d34802e45d5850a564186d779
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A tag has been created, so we should uses it.
This bump of version integrates the patch we had so there is no need for
it anymore.

Also, with this tag, faifa changed it's license to BSD-3c.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...aifa-001-Makefile.in-Remove-useless-flags.patch |   31 --------------------
 package/faifa/faifa.mk                             |    4 +-
 2 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/package/faifa/faifa-001-Makefile.in-Remove-useless-flags.patch b/package/faifa/faifa-001-Makefile.in-Remove-useless-flags.patch
deleted file mode 100644
index 027215f..0000000
--- a/package/faifa/faifa-001-Makefile.in-Remove-useless-flags.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 7ad829ab77821f87be9bb26801924aa40936f18f Mon Sep 17 00:00:00 2001
-From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
-Date: Tue, 10 Jun 2014 23:42:17 +0200
-Subject: [PATCH] Makefile.in: Remove useless flags
-
-This flags doesn't hide any warnings and as such doesn't have any
-purposes.
-
-On a plus note, it allow the build with a blackfin toolchain.
-
-Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 3814d5c..ba65bee 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -13,7 +13,7 @@
- 
- CC	= @CC@
- STRIP	?= $(CROSS)strip
--CFLAGS	= @CFLAGS@ -Wno-unused-result
-+CFLAGS	= @CFLAGS@
- INSTALL	= @INSTALL@
- LIBS	= @LIBS@
- 
--- 
-2.0.0.rc2
-
diff --git a/package/faifa/faifa.mk b/package/faifa/faifa.mk
index c83b02a..a2a2a56 100644
--- a/package/faifa/faifa.mk
+++ b/package/faifa/faifa.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-FAIFA_VERSION = aa0b5f90b89a9fd1533137b68ebf85f5437aba53
+FAIFA_VERSION = v0.1
 FAIFA_SITE = $(call github,ffainelli,faifa,$(FAIFA_VERSION))
 FAIFA_INSTALL_STAGING = YES
 FAIFA_DEPENDENCIES = libpcap host-autoconf
-FAIFA_LICENSE = GPLv2+
+FAIFA_LICENSE = BSD-3c
 FAIFA_LICENSE_FILES = COPYING
 
 FAIFA_MAKE_OPT += GIT_REV=$(FAIFA_VERSION)
