Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C4AC4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 16:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E2AA40914;
	Sun,  3 Dec 2023 16:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E2AA40914
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H_mYiSD5eLOn; Sun,  3 Dec 2023 16:46:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB18241583;
	Sun,  3 Dec 2023 16:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB18241583
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED3B81BF471
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A588B60B78
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A588B60B78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yMzC6eeqjYPf for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 16:46:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 661DB605BE
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 16:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 661DB605BE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56135877AC; Sun,  3 Dec 2023 16:46:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 17:44:16 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7ceebff5b94f6a179e8ef77d467b1af0cc1bc477
X-Git-Newrev: af2cd694e3903131d6e2f00646adfa83a89a23e2
X-Patchwork-Hint: ignore
Message-Id: <20231203164609.56135877AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/duma: bump to version
 2.5.21
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5342301067075364754=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5342301067075364754==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=af2cd694e3903131d6e2f00646adfa83a89a23e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Switch site to get latest release
- Drop all patches (already in version)
- Update hash of COPYING-LGPL, empty lines removed with
  https://github.com/johnsonjh/duma/commit/cceb1b2d808c36f02dfbfd774bcee0967fcc9392
- Pass $(TARGET_CONFIGURE_OPTS) to install targets to avoid using wrong
  values since
  https://github.com/johnsonjh/duma/commit/abdf4074c3dc506308283f5d463b17b4f58521f1

https://github.com/johnsonjh/duma/blob/VERSION_2_5_21/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  4 --
 package/duma/0001-fix-cross-compilation.patch      | 37 ------------
 package/duma/0002-no-tests.patch                   | 19 -------
 package/duma/0003-fix-C++14.patch                  | 65 ----------------------
 .../duma/0004-Fix-build-with-latest-glibc.patch    | 22 --------
 package/duma/Config.in                             |  2 +-
 package/duma/duma.hash                             |  4 +-
 package/duma/duma.mk                               | 11 ++--
 8 files changed, 9 insertions(+), 155 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e9fdf9f01c..8c0190e3b3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -338,10 +338,6 @@ package/dropbear/S50dropbear Indent Shellcheck Variables
 package/dt/0001-adjust-os-symlink.patch Upstream
 package/dt/0002-dt-default-source-define.patch Upstream
 package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch Upstream
-package/duma/0001-fix-cross-compilation.patch Upstream
-package/duma/0002-no-tests.patch Upstream
-package/duma/0003-fix-C++14.patch Upstream
-package/duma/0004-Fix-build-with-latest-glibc.patch Upstream
 package/dvb-apps/0001-Fix-generate-keynames.patch Upstream
 package/dvb-apps/0002-Fix-compiler-warning-flags.patch Upstream
 package/dvb-apps/0003-handle-static-shared-only-build.patch Upstream
diff --git a/package/duma/0001-fix-cross-compilation.patch b/package/duma/0001-fix-cross-compilation.patch
deleted file mode 100644
index eceaf06bec..0000000000
--- a/package/duma/0001-fix-cross-compilation.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Allow cross compilation. Adapted from crosstool-ng.
-
-Signed-off-by: Baruch Siach <baruch at tkos.co.il>
-
-Index: b/GNUmakefile
-===================================================================
---- a/GNUmakefile
-+++ b/GNUmakefile
-@@ -93,10 +93,6 @@
- # also define 'WIN32'
- 
- # some defaults:
--CC=gcc
--CXX=g++
--AR=ar
--RANLIB=ranlib
- INSTALL=install
- RM=rm
- RMFORCE=rm -f
-@@ -471,7 +467,7 @@
- 
- createconf$(EXEPOSTFIX): createconf.o
- 	- $(RMFORCE) createconf$(EXEPOSTFIX)
--	$(CC) $(CFLAGS) $(DUMA_OPTIONS) createconf.o -o createconf$(EXEPOSTFIX)
-+	$(CC_FOR_BUILD) $(HOST_CFLAGS) $(DUMA_OPTIONS) createconf.o -o createconf$(EXEPOSTFIX)
- 
- tstheap$(EXEPOSTFIX): libduma.a tstheap.o
- 	- $(RMFORCE) tstheap$(EXEPOSTFIX)
-@@ -532,7 +528,7 @@
- # define rules how to build objects for createconf
- #
- createconf.o:
--	$(CC) $(CFLAGS) $(DUMA_OPTIONS) -c createconf.c -o $@
-+	$(CC_FOR_BUILD) $(HOST_CFLAGS) $(DUMA_OPTIONS) -c createconf.c -o $@
- 
- 
- #
diff --git a/package/duma/0002-no-tests.patch b/package/duma/0002-no-tests.patch
deleted file mode 100644
index 6fe76f725f..0000000000
--- a/package/duma/0002-no-tests.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Do not build test programs
-
-Biulding test programs does not work when we want to do a static link,
-because duma.a redefines memcpy and strcpy, so the link fails.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN duma-2.5.15.orig/GNUmakefile duma-2.5.15/GNUmakefile
---- duma-2.5.15.orig/GNUmakefile	2014-11-16 14:47:05.874448560 +0100
-+++ duma-2.5.15/GNUmakefile	2014-11-16 14:54:50.792048921 +0100
-@@ -294,7 +294,7 @@
- SO_OBJECTS=dumapp_so.o duma_so.o sem_inc_so.o print_so.o
- 
- # Make all the top-level targets the makefile knows about.
--all:	libduma.a tstheap$(EXEPOSTFIX) dumatest$(EXEPOSTFIX) thread-test$(EXEPOSTFIX) testmt$(EXEPOSTFIX) dumatestpp$(EXEPOSTFIX) testoperators$(EXEPOSTFIX) $(DUMA_DYN_DEPS)
-+all:	libduma.a $(DUMA_DYN_DEPS)
- 
- # Perform self tests on the program this makefile builds.
- check test:
diff --git a/package/duma/0003-fix-C++14.patch b/package/duma/0003-fix-C++14.patch
deleted file mode 100644
index d19213ca7a..0000000000
--- a/package/duma/0003-fix-C++14.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-dumapp: fix for C++14
-
-With C++14, the way exceptions are specified has changed (somehow, don't
-ask me), thus causing build failures:
-
-    dumapp.cpp: In function ‘void* operator new(std::size_t)’:
-    dumapp.cpp:192:19: error: declaration of ‘void* operator new(std::size_t) throw (std::bad_alloc)’ has a different exception specifier
-     void * DUMA_CDECL operator new( DUMA_SIZE_T size )
-                       ^~~~~~~~
-    In file included from dumapp.cpp:39:0:
-    dumapp.h:91:23: note: from previous declaration ‘void* operator new(std::size_t)’
-     void * DUMA_CDECL operator new(DUMA_SIZE_T) throw(std::bad_alloc);
-                       ^~~~~~~~
-
-This is most evident with gcc-6.x, since the default C++ standard has
-changed from C++11 to C++14, thus exposing these new failures.
-
-Fix that by guarding the exception handling, a bit like was done
-with GRASS GIS (thanks DuckDuckGo):
-
-    https://trac.osgeo.org/grass/changeset?old_path=%2F&old=68817&new_path=%2F&new=68818&sfp_email=&sfph_mail=
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Note: The last commit in DUMA's CVS repo was more than 7 years ago.
-I doubt it is still active, so the patch was not sent upstream. :-/
-
-diff -durN duma-2.5.15.orig/dumapp.cpp duma-2.5.15/dumapp.cpp
---- duma-2.5.15.orig/dumapp.cpp	2008-08-03 22:46:06.000000000 +0200
-+++ duma-2.5.15/dumapp.cpp	2016-07-10 21:55:22.670386099 +0200
-@@ -190,7 +190,9 @@
-  * (11) = (a) ; ASW
-  */
- void * DUMA_CDECL operator new( DUMA_SIZE_T size )
-+#ifdef DUMA_EXCEPTION_SPECS
- throw(std::bad_alloc)
-+#endif
- {
-   return duma_new_operator(size, EFA_NEW_ELEM, true  DUMA_PARAMS_UK);
- }
-@@ -254,7 +256,9 @@
-  * (21) = (a) ; AAW
-  */
- void * DUMA_CDECL operator new[]( DUMA_SIZE_T size )
-+#ifdef DUMA_EXCEPTION_SPECS
- throw(std::bad_alloc)
-+#endif
- {
-   return duma_new_operator(size, EFA_NEW_ARRAY, true  DUMA_PARAMS_UK);
- }
-diff -durN duma-2.5.15.orig/dumapp.h duma-2.5.15/dumapp.h
---- duma-2.5.15.orig/dumapp.h	2009-04-11 14:41:44.000000000 +0200
-+++ duma-2.5.15/dumapp.h	2016-07-10 21:55:22.670386099 +0200
-@@ -35,6 +35,10 @@
- 
- #include "duma.h"
- 
-+#if __cplusplus < 201103L
-+  #define DUMA_EXCEPTION_SPECS 1
-+#endif
-+
- /* remove previous macro definitions */
- #include "noduma.h"
- 
diff --git a/package/duma/0004-Fix-build-with-latest-glibc.patch b/package/duma/0004-Fix-build-with-latest-glibc.patch
deleted file mode 100644
index 2d73d7ae57..0000000000
--- a/package/duma/0004-Fix-build-with-latest-glibc.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Fix build with latest glibc
-
-Fixes:
- - http://autobuild.buildroot.net/results/c7de1a1d01edced2098a804ad87dcb67b5dc6832
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-diff -durN duma_2_5_15.orig/print.c duma_2_5_15/print.c
---- duma_2_5_15.orig/print.c	2019-10-28 10:21:14.080149620 +0100
-+++ duma_2_5_15/print.c	2019-10-28 10:22:01.256151561 +0100
-@@ -326,9 +326,9 @@
-   if(DUMA_OUTPUT_FILE != NULL)
-   {
- #if defined(WIN32) && !defined(__CYGWIN__)
--    fd = _open(DUMA_OUTPUT_FILE, _O_APPEND|_O_CREAT|_O_WRONLY);
-+    fd = _open(DUMA_OUTPUT_FILE, _O_APPEND|_O_CREAT|_O_WRONLY, 0600);
- #else
--    fd = open(DUMA_OUTPUT_FILE, O_APPEND|O_CREAT|O_WRONLY);
-+    fd = open(DUMA_OUTPUT_FILE, O_APPEND|O_CREAT|O_WRONLY, 0600);
- #endif
-     if ( fd >= 0 )
-     {
diff --git a/package/duma/Config.in b/package/duma/Config.in
index b1f55faa73..a891996ad1 100644
--- a/package/duma/Config.in
+++ b/package/duma/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_DUMA
 	  Electric Fence library. Detects buffer overflow and
 	  underflow, and also memory leaks.
 
-	  http://duma.sourceforge.net
+	  https://github.com/johnsonjh/duma
 
 if BR2_PACKAGE_DUMA
 
diff --git a/package/duma/duma.hash b/package/duma/duma.hash
index ccf171a97c..d6c1685bd1 100644
--- a/package/duma/duma.hash
+++ b/package/duma/duma.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  baaf794854e3093ad1bddadbfb8ad4b220a7117d70359ee216bd59e353734e17  duma_2_5_15.tar.gz
+sha256  470aa72e7018f0beadb5fbe3c932a62ba1b0594c29158a744c614bfa42133e59  duma-2.5.21.tar.gz
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING-GPL
-sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING-LGPL
+sha256  76568dd3f7e12b18900ce0e767b99e59f4956a2e709a33de899508693a6425d4  COPYING-LGPL
diff --git a/package/duma/duma.mk b/package/duma/duma.mk
index 906db872d5..6bbdf41f4a 100644
--- a/package/duma/duma.mk
+++ b/package/duma/duma.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-DUMA_VERSION = 2.5.15
-DUMA_SOURCE = duma_$(subst .,_,$(DUMA_VERSION)).tar.gz
-DUMA_SITE = http://downloads.sourceforge.net/project/duma/duma/$(DUMA_VERSION)
+DUMA_VERSION = 2.5.21
+DUMA_SITE = $(call github,johnsonjh,duma,VERSION_$(subst .,_,$(DUMA_VERSION)))
 DUMA_LICENSE = GPL-2.0+, LGPL-2.1+
 DUMA_LICENSE_FILES = COPYING-GPL COPYING-LGPL
 
@@ -25,11 +24,13 @@ define DUMA_BUILD_CMDS
 endef
 
 define DUMA_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) OS=linux prefix=$(STAGING_DIR)/usr install -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		OS=linux prefix=$(STAGING_DIR)/usr install -C $(@D)
 endef
 
 define DUMA_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) OS=linux prefix=$(TARGET_DIR)/usr install -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		OS=linux prefix=$(TARGET_DIR)/usr install -C $(@D)
 endef
 
 $(eval $(generic-package))

--===============5342301067075364754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5342301067075364754==--
