Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95E2C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2C044EEFA;
	Fri, 28 Feb 2025 16:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhjDY4c4wvO7; Fri, 28 Feb 2025 16:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A61A49FE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A61A49FE3;
	Fri, 28 Feb 2025 16:31:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 543331DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81AC780C21
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FnSHHizxbcVK for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ABE780AB0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ABE780AB0
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 466D782621; Fri, 28 Feb 2025 16:29:36 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Dec 2024 21:48:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6fcdb64599da880fc59c1808271308c2a681d273
X-Git-Newrev: a4b43fee63a26db65a60c93e2657b2a8d3df6c83
X-Patchwork-Hint: ignore
Message-Id: <20250228162936.466D782621@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/giblib: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a4b43fee63a26db65a60c93e2657b2a8d3df6c83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

giblib was introduced as a dependency of a feh package that
no longer depends on it. It was removed in commit:
https://github.com/derf/feh/commit/68037c4d220302a9f7ab250b3a220a5f64217244
included in feh version 2.12.

Besides, it is no longer maintained and the download URL is no
longer accessible.

Fixes:
https://autobuild.buildroot.org/results/983f1d4c01f826877c4b372713bf271412973a42/
https://autobuild.buildroot.org/results/0a124034687d55bd8931fef8ef0f20bb56a631f1/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Julien:
  - remove .checkpackageignore entry
  - remove package/Config.in entry
  - add link to feh commit removing dependency
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                            |   1 -
 Config.in.legacy                               |   7 ++
 DEVELOPERS                                     |   1 -
 package/Config.in                              |   1 -
 package/giblib/0001-fix-imlib2-detection.patch | 127 -------------------------
 package/giblib/Config.in                       |  13 ---
 package/giblib/giblib.hash                     |   3 -
 package/giblib/giblib.mk                       |  19 ----
 8 files changed, 7 insertions(+), 165 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e15281aa2d..2b63d235f3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -540,7 +540,6 @@ package/genpart/0001-fix-return-code.patch lib_patch.Upstream
 package/genromfs/0001-build-system.patch lib_patch.Sob lib_patch.Upstream
 package/gensio/0001-Fix-missing-EVP_PKEY_ED25519-build-error-on-libressl.patch lib_patch.Upstream
 package/gerbera/S99gerbera lib_sysv.Indent
-package/giblib/0001-fix-imlib2-detection.patch lib_patch.Upstream
 package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch lib_patch.Upstream
 package/glorytun/0001-Add-support-for-Apple-silicon.patch lib_patch.Upstream
 package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 2ef1e19516..05ed773f65 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_GIBLIB
+	bool "giblib has been removed"
+	select BR2_LEGACY
+	help
+	  The giblib package was removed as it is not maintained
+	  anymore and the upstream URL is gone.
+
 config BR2_PACKAGE_FCONFIG
 	bool "fconfig has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 646002850f..047dc4a88f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3384,7 +3384,6 @@ F:	package/can-utils/
 F:	package/circus/
 F:	package/dhcpcd/
 F:	package/feh/
-F:	package/giblib/
 F:	package/hostapd/
 F:	package/imlib2/
 F:	package/jquery-datetimepicker/
diff --git a/package/Config.in b/package/Config.in
index 60cdb179a3..7cfcdf2c58 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1705,7 +1705,6 @@ menu "Graphics"
 	source "package/gd/Config.in"
 	source "package/gdk-pixbuf/Config.in"
 	source "package/gdk-pixbuf-xlib/Config.in"
-	source "package/giblib/Config.in"
 	source "package/giflib/Config.in"
 	source "package/granite/Config.in"
 	source "package/graphene/Config.in"
diff --git a/package/giblib/0001-fix-imlib2-detection.patch b/package/giblib/0001-fix-imlib2-detection.patch
deleted file mode 100644
index 2323107941..0000000000
--- a/package/giblib/0001-fix-imlib2-detection.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-configure.ac + Makefile.am: fix the imlib2 detection
-
-Although imlib2 is correctly checked for, the variables used to get
-the CFLAGS and LIBS are wrong (perhaps a remnant of the pre-imlib2
-era, when giblib was using imlib).
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff --git a/configure.ac b/configure.ac
-index 6807d86..c8874f0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -18,16 +18,10 @@ AM_MAINTAINER_MODE
- AM_WITH_DMALLOC
- 
- AC_PATH_GENERIC(imlib2, 1.0.0, [
--  AC_SUBST(IMLIB_LIBS)
--  AC_SUBST(IMLIB_CFLAGS) ],
-+  AC_SUBST(IMLIB2_LIBS)
-+  AC_SUBST(IMLIB2_CFLAGS) ],
-   AC_MSG_ERROR(Cannot find imlib2: Is imlib2-config in the path?) )
- 
--dnl the above doesn't work for some reason :/
--IMLIB_LIBS=`imlib2-config --libs`
--IMLIB_CFLAGS=`imlib2-config --cflags`
--AC_SUBST(IMLIB_LIBS)
--AC_SUBST(IMLIB_CFLAGS)
--
- LIBS="$LIBS -lm"
- CFLAGS="$CFLAGS -Wall"
- 
-@@ -48,7 +42,7 @@ $PACKAGE $VERSION
- Configuration:
- --------------
- 
--Imlib2 libs:	$IMLIB_LIBS
--Imlib2 cflags:  $IMLIB_CFLAGS
-+Imlib2 libs:	$IMLIB2_LIBS
-+Imlib2 cflags:  $IMLIB2_CFLAGS
- CFLAGS:			$CFLAGS
- "
-diff --git a/configure.in b/configure.in
-index 432cb16..6999095 100644
---- a/configure.in
-+++ b/configure.in
-@@ -17,16 +17,10 @@ AM_MAINTAINER_MODE
- AM_WITH_DMALLOC
- 
- AC_PATH_GENERIC(imlib2, 1.0.0, [
--  AC_SUBST(IMLIB_LIBS)
--  AC_SUBST(IMLIB_CFLAGS) ],
-+  AC_SUBST(IMLIB2_LIBS)
-+  AC_SUBST(IMLIB2_CFLAGS) ],
-   AC_MSG_ERROR(Cannot find imlib2: Is imlib2-config in the path?) )
- 
--dnl the above doesn't work for some reason :/
--IMLIB_LIBS=`imlib2-config --libs`
--IMLIB_CFLAGS=`imlib2-config --cflags`
--AC_SUBST(IMLIB_LIBS)
--AC_SUBST(IMLIB_CFLAGS)
--
- LIBS="$LIBS -lm"
- CFLAGS="$CFLAGS -Wall"
- 
-@@ -45,7 +39,7 @@ $PACKAGE $VERSION
- Configuration:
- --------------
- 
--Imlib2 libs:	$IMLIB_LIBS
--Imlib2 cflags:  $IMLIB_CFLAGS
-+Imlib2 libs:	$IMLIB2_LIBS
-+Imlib2 cflags:  $IMLIB2_CFLAGS
- CFLAGS:			$CFLAGS
- "
-diff --git a/giblib-config.in b/giblib-config.in
-index f3a7db6..cef1620 100644
---- a/giblib-config.in
-+++ b/giblib-config.in
-@@ -42,11 +42,11 @@ while test $# -gt 0; do
-       if test @includedir@ != /usr/include ; then
-         includes=-I@includedir@
-       fi
--      echo $includes -I$prefix/include/giblib @IMLIB_CFLAGS@
-+      echo $includes -I$prefix/include/giblib @IMLIB2_CFLAGS@
-       ;;
-     --libs)
-       libdirs=-L@libdir@
--      echo $libdirs -lgiblib @LDFLAGS@ @IMLIB_LIBS@
-+      echo $libdirs -lgiblib @LDFLAGS@ @IMLIB2_LIBS@
-       ;;
-     *)
-       echo "${usage}" 1>&2
-diff --git a/giblib.pc.in b/giblib.pc.in
-index df520ae..783e6e1 100644
---- a/giblib.pc.in
-+++ b/giblib.pc.in
-@@ -6,6 +6,6 @@ includedir=@includedir@
- Name: giblib
- Description: wrapper library for imlib2, and other stuff
- Version: @VERSION@
--Libs: -L${libdir} -lgiblib @LDFLAGS@ @IMLIB_LIBS@
--Cflags: -I${includedir} -I${includedir}/giblib @IMLIB_CFLAGS@
-+Libs: -L${libdir} -lgiblib @LDFLAGS@ @IMLIB2_LIBS@
-+Cflags: -I${includedir} -I${includedir}/giblib @IMLIB2_CFLAGS@
- 
-diff --git a/giblib/Makefile.am b/giblib/Makefile.am
-index d1edc09..49d8ac4 100644
---- a/giblib/Makefile.am
-+++ b/giblib/Makefile.am
-@@ -3,7 +3,7 @@ MAINTAINERCLEANFILES = Makefile.in
- 
- INCLUDES = \
- -I. -I$(top_srcdir) \
---DPREFIX=\""$(prefix)"\" @IMLIB_CFLAGS@
-+-DPREFIX=\""$(prefix)"\" @IMLIB2_CFLAGS@
- 
- lib_LTLIBRARIES = libgiblib.la
- 
-@@ -24,7 +24,7 @@ libgiblib_la_SOURCES = \
-     gib_utils.c gib_utils.h \
- 	gib_queue.c gib_queue.h
- 
--libgiblib_la_LIBADD = @IMLIB_LIBS@
-+libgiblib_la_LIBADD = @IMLIB2_LIBS@
- libgiblib_la_DEPENDENCIES = giblib_config.h
- libgiblib_la_LDFLAGS = -version-info 1:6:0
- 
diff --git a/package/giblib/Config.in b/package/giblib/Config.in
deleted file mode 100644
index f50271ac53..0000000000
--- a/package/giblib/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_GIBLIB
-	bool "giblib"
-	depends on BR2_PACKAGE_XORG7
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_IMLIB2
-	select BR2_PACKAGE_IMLIB2_X
-	help
-	  Giblib is a simple library which wraps imlib2.
-
-	  http://linuxbrit.co.uk/giblib/
-
-comment "giblib support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
diff --git a/package/giblib/giblib.hash b/package/giblib/giblib.hash
deleted file mode 100644
index 0c83a55457..0000000000
--- a/package/giblib/giblib.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  176611c4d88d742ea4013991ad54c2f9d2feefbc97a28434c0f48922ebaa8bac  giblib-1.2.4.tar.gz
-sha256  8601e2dacede853fe325f7fd3a11f93b1753d576db60426f1b0ff4e68f41ff07  COPYING
diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
deleted file mode 100644
index b0a962001d..0000000000
--- a/package/giblib/giblib.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# giblib
-#
-################################################################################
-
-GIBLIB_VERSION = 1.2.4
-GIBLIB_SITE = http://linuxbrit.co.uk/downloads
-GIBLIB_INSTALL_STAGING = YES
-GIBLIB_DEPENDENCIES = imlib2
-GIBLIB_AUTORECONF = YES
-GIBLIB_CONF_OPTS = \
-	--with-imlib2-prefix=$(STAGING_DIR)/usr \
-	--with-imlib2-exec-prefix=$(STAGING_DIR)/usr
-GIBLIB_CONFIG_SCRIPTS = giblib-config
-GIBLIB_LICENSE = MIT
-GIBLIB_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
