Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F58C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 12:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70A7E812ED;
	Thu, 30 Dec 2021 12:29:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 40QWpNR7QEP0; Thu, 30 Dec 2021 12:29:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 604B582893;
	Thu, 30 Dec 2021 12:29:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D65561BF3EF
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C16F3410DC
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:26:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kc-44RWPVuJK for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 12:26:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D428C410D4
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 12:26:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1082782DAD; Thu, 30 Dec 2021 12:20:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 13:21:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d4a588a504a6446dd0a29a353d94c6e86cfd879
X-Git-Newrev: 5084994d3f6dce350de091cd813047e658b9363d
X-Patchwork-Hint: ignore
Message-Id: <20211230122038.1082782DAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgis: bump version to 3.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5084994d3f6dce350de091cd813047e658b9363d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches.
Release-notes: https://git.osgeo.org/gitea/postgis/postgis/raw/tag/3.2.0/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...dd-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch | 32 -----------------
 ...sable-forced-static-linking-of-liblwgeom.patch} |  0
 ...OSTGIS_DEBUG_LEVEL-define-to-configure.ac.patch | 29 ---------------
 ...g-config-to-get-PROJ-version-if-available.patch | 42 ----------------------
 ....ac-fix-cross-compilation-with-protobuf-c.patch | 42 ----------------------
 package/postgis/postgis.hash                       |  2 +-
 package/postgis/postgis.mk                         |  2 +-
 7 files changed, 2 insertions(+), 147 deletions(-)

diff --git a/package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch b/package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch
deleted file mode 100644
index 3a40afddb2..0000000000
--- a/package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7bf2fc388df10bc1760cd06594f50da0c78ee3a2 Mon Sep 17 00:00:00 2001
-From: fidomax <adobegitler@gmail.com>
-Date: Tue, 26 Jan 2021 07:33:17 +0300
-Subject: [PATCH] Add HAVE_VASPRINTF HAVE_ASPRINTF templates
-
-It fixes autoreconf error:
-autoheader: warning: missing template: HAVE_ASPRINTF
-autoheader: Use AC_DEFINE([HAVE_ASPRINTF], [], [Description])
-autoheader: warning: missing template: HAVE_VASPRINTF
-
-Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
-Fetch from: https://github.com/postgis/postgis/commit/d0ac5df49961d1d1a74b894f9941b973c0695c11.patch
----
- configure.ac | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 9ac7051bb..dddb3aef7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -11,6 +11,8 @@ dnl **********************************************************************
- 
- AC_INIT()
- AC_CONFIG_HEADERS([postgis_config.h])
-+AH_TEMPLATE([HAVE_VASPRINTF])
-+AH_TEMPLATE([HAVE_ASPRINTF])
- AC_CONFIG_MACRO_DIR([macros])
- AC_CONFIG_AUX_DIR([build-aux])
- AC_PROG_INSTALL
--- 
-2.30.0
-
diff --git a/package/postgis/0003-Disable-forced-static-linking-of-liblwgeom.patch b/package/postgis/0001-Disable-forced-static-linking-of-liblwgeom.patch
similarity index 100%
rename from package/postgis/0003-Disable-forced-static-linking-of-liblwgeom.patch
rename to package/postgis/0001-Disable-forced-static-linking-of-liblwgeom.patch
diff --git a/package/postgis/0002-Add-POSTGIS_DEBUG_LEVEL-define-to-configure.ac.patch b/package/postgis/0002-Add-POSTGIS_DEBUG_LEVEL-define-to-configure.ac.patch
deleted file mode 100644
index 71409ca599..0000000000
--- a/package/postgis/0002-Add-POSTGIS_DEBUG_LEVEL-define-to-configure.ac.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 97d0cb4f4a6f3bec50729e3f896d4a84b796c5c6 Mon Sep 17 00:00:00 2001
-From: fidomax <adobegitler@gmail.com>
-Date: Tue, 26 Jan 2021 09:17:17 +0300
-Subject: [PATCH] Add POSTGIS_DEBUG_LEVEL define to configure.ac
-
-In case of using autoreconf "#define POSTGIS_DEBUG_LEVEL 0" is removed from postgis_config.h.in so build failed with undefined POSTGIS_DEBUG_LEVEL.
-
-Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
-Fetch from: https://github.com/postgis/postgis/commit/2b2c2cb159cfcaacb75a4e74f17bd2834d61acd0.patch
----
- configure.ac | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index dddb3aef7..86e1597ee 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1131,6 +1131,8 @@ else
-     CPPFLAGS="-DNDEBUG $CPPFLAGS"
- fi
- 
-+AC_DEFINE([POSTGIS_DEBUG_LEVEL], [0], [Define debug level. Default 0])
-+
- dnl ===========================================================================
- dnl Allow the developer to disable the automatic updates of postgis_revision.h
- dnl with --without-phony-revision
--- 
-2.30.0
-
diff --git a/package/postgis/0004-Use-pkg-config-to-get-PROJ-version-if-available.patch b/package/postgis/0004-Use-pkg-config-to-get-PROJ-version-if-available.patch
deleted file mode 100644
index 1e65b98d3e..0000000000
--- a/package/postgis/0004-Use-pkg-config-to-get-PROJ-version-if-available.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 876a04a795fcb179e0dc802e260353012c4890f9 Mon Sep 17 00:00:00 2001
-From: Maxim Kochetkov <adobegitler@gmail.com>
-Date: Thu, 28 Jan 2021 08:12:57 +0300
-Subject: [PATCH] Use pkg-config to get PROJ version if available
-
-In case of cross-compile AC_PROJ_VERSION([POSTGIS_PROJ_VERSION]) fails.
-So try to get version by pkg-config first
-
-Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
-Fetch from: https://github.com/postgis/postgis/commit/671a878982550e3c590d642620a6621b52c230c7.patch
----
- configure.ac | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 86e1597ee..016f81c7d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -866,6 +866,7 @@ elif test ! -z "$PKG_CONFIG"; then
- 		[
- 			PROJ_CPPFLAGS="$PROJ_CFLAGS"
- 			PROJ_LDFLAGS="$PROJ_LIBS"
-+			POSTGIS_PROJ_VERSION=`$PKG_CONFIG proj --modversion | sed 's/\([[0-9]]\).*\([[0-9]]\).*\([[0-9]]\)/\1\2/'`
- 		],
- 		[
- 			PROJ_LDFLAGS="-lproj"
-@@ -887,8 +888,10 @@ AC_CHECK_HEADER([proj_api.h],
- 		)]
- 	)
- 
--dnl Return the PROJ.4 version number
--AC_PROJ_VERSION([POSTGIS_PROJ_VERSION])
-+dnl Return the PROJ.4 version number if not detected by pkg-config
-+if test "x$POSTGIS_PROJ_VERSION" = "x"; then
-+	AC_PROJ_VERSION([POSTGIS_PROJ_VERSION])
-+fi
- AC_DEFINE_UNQUOTED([POSTGIS_PROJ_VERSION], [$POSTGIS_PROJ_VERSION], [PROJ library version])
- AC_SUBST([POSTGIS_PROJ_VERSION])
- CPPFLAGS="$CPPFLAGS_SAVE"
--- 
-2.30.0
-
diff --git a/package/postgis/0005-configure.ac-fix-cross-compilation-with-protobuf-c.patch b/package/postgis/0005-configure.ac-fix-cross-compilation-with-protobuf-c.patch
deleted file mode 100644
index b415edf0b8..0000000000
--- a/package/postgis/0005-configure.ac-fix-cross-compilation-with-protobuf-c.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 8b80c4bd848ff3d71b998dc8a4bd42627ed72581 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 17 Apr 2021 11:58:19 +0200
-Subject: [PATCH] configure.ac: fix cross-compilation with protobuf-c
-
-Try to retrieve the version from pkg-config to avoid the following
-error:
-
-checking protobuf-c version... configure: error: in `/home/fabrice/buildroot/output/build/postgis-3.1.1':
-configure: error: cannot run test program while cross compiling
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/postgis/postgis/commit/8b80c4bd848ff3d71b998dc8a4bd42627ed72581]
----
- configure.ac | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 48ba070a40..df75fe6601 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1004,6 +1004,7 @@ if test "$CHECK_PROTOBUF" != "no"; then
- 		PKG_CHECK_MODULES([PROTOBUFC], [libprotobuf-c >= 1.1.0], [
- 				PROTOBUF_CPPFLAGS="$PROTOBUFC_CFLAGS";
- 				PROTOBUF_LDFLAGS="$PROTOBUFC_LIBS";
-+				PROTOC_VERSION=`$PKG_CONFIG libprotobuf-c --modversion | sed 's/\([[0-9]]\).*\([[0-9]]\).*\([[0-9]]\)/\100\200\3/'`
- 			], [
- 				AC_MSG_RESULT([libprotobuf-c not found in pkg-config])
- 			])
-@@ -1054,7 +1055,10 @@ if test "$CHECK_PROTOBUF" != "no"; then
- 		[])
- 
- 	AC_MSG_CHECKING([protobuf-c version])
--	AC_PROTOBUFC_VERSION([PROTOC_VERSION])
-+	dnl Return the protobuf-c version number if not detected by pkg-config
-+	if test "x$PROTOC_VERSION" = "x"; then
-+		AC_PROTOBUFC_VERSION([PROTOC_VERSION])
-+	fi
-         if test ! "$PROTOC_VERSION" -ge 1001000; then
-                 AC_MSG_ERROR("Old protobuf-c release found but 1.1.0 is required. You can disable MVT and Geobuf support using --without-protobuf")
-         fi
diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index b1c19f029e..12ca18f84f 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dc8e3fe8bc532e422f5d724c5a7c437f6555511716f6410d4d2db9762e1a3796  postgis-3.1.4.tar.gz
+sha256  7ab9e154c6947c0cffb8fa12d70806add9aa060e62b6c86a2e206f9d4b507cfd  postgis-3.2.0.tar.gz
 sha256  55b69f22e1752830dd565852dc7ff242daf289dbd3a6bfede5db43f90d2e28c9  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 3a340c680e..d9cda64730 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.1.4
+POSTGIS_VERSION = 3.2.0
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
