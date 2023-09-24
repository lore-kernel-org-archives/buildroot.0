Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F81CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 19:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B737960E4E;
	Sun, 24 Sep 2023 19:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B737960E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lGW38ydTb9Lk; Sun, 24 Sep 2023 19:23:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2CD560F18;
	Sun, 24 Sep 2023 19:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2CD560F18
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EAA5B1BF909
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F02240999
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F02240999
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h4Nkt_eIbb6M for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 19:22:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9FA540294
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 19:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9FA540294
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8BC5875DD; Sun, 24 Sep 2023 19:22:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 21:13:52 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 9599db51f53db925798fd3b55fbc8faf2d653edf
X-Git-Newrev: 1de44f3a0fb8458ee2c629638f9a4a94a0835af2
X-Patchwork-Hint: ignore
Message-Id: <20230924192240.B8BC5875DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/libqb: security
 bump to version 2.0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=1de44f3a0fb8458ee2c629638f9a4a94a0835af2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

- Fix CVE-2023-39976: log_blackbox.c in libqb before 2.0.8 allows a
  buffer overflow via long log messages because the header size is not
  considered.
- Drop patch (already in version) and so autoreconf

https://github.com/ClusterLabs/libqb/compare/v2.0.6...v2.0.8
https://github.com/ClusterLabs/libqb/releases/tag/v2.0.7
https://github.com/ClusterLabs/libqb/releases/tag/v2.0.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c89d7a2dafcc8f622100d50f11e186e377cde7a8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                               |  1 -
 package/libqb/0001-Add-disable-tests-option.patch | 62 -----------------------
 package/libqb/libqb.hash                          |  4 +-
 package/libqb/libqb.mk                            |  4 +-
 4 files changed, 3 insertions(+), 68 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7c07ec9e18..82860b332e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -818,7 +818,6 @@ package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch Upstream
 package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch Upstream
 package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch Upstream
 package/libpthsem/0001-fix-build-on-linux-3.x-host.patch Upstream
-package/libqb/0001-Add-disable-tests-option.patch Upstream
 package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch Upstream
 package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch Upstream
 package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch Upstream
diff --git a/package/libqb/0001-Add-disable-tests-option.patch b/package/libqb/0001-Add-disable-tests-option.patch
deleted file mode 100644
index 1afb05520d..0000000000
--- a/package/libqb/0001-Add-disable-tests-option.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 051d9cfe8f365e30affc6476ed79b9e04a6b15ad Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 4 Nov 2022 00:27:50 +0100
-Subject: [PATCH] Add --disable-tests option
-
-Add --disable-tests to allow the user to disable tests. As a
-side-effect, this will avoid the following build failure when check is
-found:
-
-libstat_wrapper.c:11:10: fatal error: gnu/lib-names.h: No such file or directory
-   11 | #include <gnu/lib-names.h>
-      |          ^~~~~~~~~~~~~~~~~
-
-This build failure is raised since version 2.0.5 and
-https://github.com/ClusterLabs/libqb/commit/78df90b180740712d0c90b6d982b78241cc99d72
-
-Fixes:
- - http://autobuild.buildroot.org/results/450cfc36d4fd6dc71c138bec45f05b5a2d92a08d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/ClusterLabs/libqb/pull/475]
----
- Makefile.am  | 6 +++++-
- configure.ac | 5 +++++
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index a08b1d2..6a710a0 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -39,7 +39,11 @@ ACLOCAL_AMFLAGS		= -I m4
- 
- dist_doc_DATA		= COPYING INSTALL README.markdown
- 
--SUBDIRS			= include lib doxygen2man docs tools tests examples
-+SUBDIRS			= include lib doxygen2man docs tools examples
-+
-+if ENABLE_TESTS
-+SUBDIRS			+= tests
-+endif
- 
- dist-clean-local:
- 	rm -f .snapshot-version autoconf automake autoheader
-diff --git a/configure.ac b/configure.ac
-index ac44b7e..4946008 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -562,6 +562,11 @@ AC_ARG_WITH([force-sockets-config-file],
- 	[ FORCESOCKETSFILE="$withval" ],
- 	[ FORCESOCKETSFILE="$sysconfdir/libqb/force-filesystem-sockets" ])
- 
-+AC_ARG_ENABLE([tests],
-+  [AS_HELP_STRING([--disable-tests],[disable tests])],,
-+  [ enable_tests="yes" ])
-+AM_CONDITIONAL([ENABLE_TESTS], [test x$enable_tests = xyes])
-+
- AC_ARG_ENABLE([install-tests],
-   [AS_HELP_STRING([--enable-install-tests],[install tests])],,
-   [ enable_install_tests="no" ])
--- 
-2.35.1
-
diff --git a/package/libqb/libqb.hash b/package/libqb/libqb.hash
index de247c2660..f7006ff10e 100644
--- a/package/libqb/libqb.hash
+++ b/package/libqb/libqb.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ClusterLabs/libqb/releases/download/v2.0.6/libqb-2.0.6.sha256
-sha256  f1e744208e8f69934804c14e05d9707668f99d4867de9cccf2f7a6bf4d48331c  libqb-2.0.6.tar.xz
+# From https://github.com/ClusterLabs/libqb/releases/download/v2.0.8/libqb-2.0.8.sha256
+sha256  b42531fc20b8ac02f4c6d0a4dc49f7c4a1eef09bdb13af5f6927b7fc49522ee6  libqb-2.0.8.tar.xz
 
 # Locally calculated
 sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/libqb/libqb.mk b/package/libqb/libqb.mk
index 65d68181ee..11b5788b45 100644
--- a/package/libqb/libqb.mk
+++ b/package/libqb/libqb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQB_VERSION = 2.0.6
+LIBQB_VERSION = 2.0.8
 LIBQB_SOURCE = libqb-$(LIBQB_VERSION).tar.xz
 LIBQB_SITE = \
 	https://github.com/ClusterLabs/libqb/releases/download/v$(LIBQB_VERSION)
@@ -12,8 +12,6 @@ LIBQB_LICENSE = LGPL-2.1+
 LIBQB_LICENSE_FILES = COPYING
 LIBQB_CPE_ID_VENDOR = clusterlabs
 LIBQB_INSTALL_STAGING = YES
-# We're patching configure.ac
-LIBQB_AUTORECONF = YES
 LIBQB_CONF_OPTS = --disable-tests
 LIBQB_DEPENDENCIES = libxml2
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
