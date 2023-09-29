Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441B8CE7AF3
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 030176163D;
	Fri, 29 Sep 2023 20:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 030176163D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kLm9R0uXfRgF; Fri, 29 Sep 2023 20:50:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16C4560E70;
	Fri, 29 Sep 2023 20:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16C4560E70
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5649E1BF990
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D95D40193
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D95D40193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OXx84lWcgGJ1 for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:49:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B882040150
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B882040150
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6B5A83725; Fri, 29 Sep 2023 20:49:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:49:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1b2cd5835d0a13bff763cfcf289919519c202ff
X-Git-Newrev: 60e899bfa0249cddbfbeea8c2a2ecd4c165dddb5
X-Patchwork-Hint: ignore
Message-Id: <20230929204956.A6B5A83725@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeipmi: bump to version 1.6.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=60e899bfa0249cddbfbeea8c2a2ecd4c165dddb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version) and so also drop autoreconf

https://lists.gnu.org/archive/html/freeipmi-announce/2023-06/msg00000.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                         |  1 -
 package/freeipmi/0001-add-disable-doc.patch | 72 -----------------------------
 package/freeipmi/freeipmi.hash              |  2 +-
 package/freeipmi/freeipmi.mk                |  4 +-
 4 files changed, 2 insertions(+), 77 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index dba780800f..5d0fc1fa69 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -439,7 +439,6 @@ package/flex/0003-build-make-it-possible-to-disable-the-build-of-the-d.patch Ups
 package/flite/0001-fix-alsa-static.patch Upstream
 package/fltk/0001-disable-tests.patch Upstream
 package/fluxbox/0001-fixes-bug-1138.patch Upstream
-package/freeipmi/0001-add-disable-doc.patch Upstream
 package/freeradius-client/0001-fix-for-nettle.patch Upstream
 package/freerdp/0001-Fix-variable-declaration-in-loop.patch Upstream
 package/freerdp/0002-Fixed-variable-declaration-in-loop.patch Upstream
diff --git a/package/freeipmi/0001-add-disable-doc.patch b/package/freeipmi/0001-add-disable-doc.patch
deleted file mode 100644
index e410d2b52f..0000000000
--- a/package/freeipmi/0001-add-disable-doc.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 5324c88632c021a87251370b03067d857e9a9892 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 2 Nov 2022 19:02:42 +0100
-Subject: [PATCH] add --disable-doc
-
-Allow the user to disable documentation through --disable-doc to avoid
-the following build failure without makeinfo:
-
-/home/buildroot/autobuild/instance-0/output-1/build/freeipmi-1.6.10/config/missing: line 81: makeinfo: command not found
-WARNING: 'makeinfo' is missing on your system.
-         You should only need it if you modified a '.texi' file, or
-         any other file indirectly affecting the aspect of the manual.
-         You might want to install the Texinfo package:
-         <https://www.gnu.org/software/texinfo/>
-         The spurious makeinfo call might also be the consequence of
-         using a buggy 'make' (AIX, DU, IRIX), in which case you might
-         want to install GNU make:
-         <https://www.gnu.org/software/make/>
-Makefile:442: recipe for target 'freeipmi-faq.info' failed
-
-Fixes:
- - http://autobuild.buildroot.org/results/ac6ff1c746a354f885fc1674d10e7bff9e536134
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/chu11/freeipmi-mirror/pull/61]
----
- Makefile.am  | 6 +++++-
- configure.ac | 4 ++++
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index cf757f634..d74952e30 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -3,7 +3,6 @@
- ACLOCAL_AMFLAGS = -I config
- 
- SUBDIRS = \
--	doc \
- 	etc \
- 	common \
- 	libfreeipmi \
-@@ -33,6 +32,11 @@ SUBDIRS = \
- 	rmcpping \
- 	contrib
- 
-+if ENABLE_DOC
-+SUBDIRS += \
-+	doc
-+endif
-+
- PACKAGE = @PACKAGE@
- VERSION = @VERSION@
- 
-diff --git a/configure.ac b/configure.ac
-index 54fdf6367..7a94b958b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -341,6 +341,10 @@ else
- fi
- AC_SUBST(WITH_DEBUG)
- 
-+AC_ARG_ENABLE(doc,
-+              AC_HELP_STRING([--disable-doc], [turn off documentation]))
-+AM_CONDITIONAL(ENABLE_DOC, test "$enable_doc" != "no")
-+
- dnl Allow advanced developers to compile with raw dumping
- AC_ARG_ENABLE(rawdumps,
-    AC_HELP_STRING([--enable-rawdumps], [output raw packet dumps when debugging]))
--- 
-2.35.1
-
diff --git a/package/freeipmi/freeipmi.hash b/package/freeipmi/freeipmi.hash
index bc22d2ff6b..ac24b7c64e 100644
--- a/package/freeipmi/freeipmi.hash
+++ b/package/freeipmi/freeipmi.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  fce4a1e401b6189c103d2b1203261d0bfbf45985c6f3fa44c51b186b13fe7a7d  freeipmi-1.6.10.tar.gz
+sha256  65fbd6910fc010457748695414f27c5755b4e8d75734221221f3858c6230a897  freeipmi-1.6.11.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.bmc-watchdog
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmiconsole
diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
index 3e0ac0ffa9..ecff6f9925 100644
--- a/package/freeipmi/freeipmi.mk
+++ b/package/freeipmi/freeipmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREEIPMI_VERSION = 1.6.10
+FREEIPMI_VERSION = 1.6.11
 FREEIPMI_SITE = https://ftp.gnu.org/gnu/freeipmi
 FREEIPMI_LICENSE = GPL-3.0+, BSD-like (sunbmc)
 FREEIPMI_LICENSE_FILES = \
@@ -12,8 +12,6 @@ FREEIPMI_LICENSE_FILES = \
 	COPYING.ipmidetect COPYING.ipmi-fru COPYING.ipmimonitoring \
 	COPYING.ipmiping COPYING.ipmipower COPYING.ipmiseld COPYING.pstdout \
 	COPYING.sunbmc COPYING.ZRESEARCH
-# We're patching configure.ac
-FREEIPMI_AUTORECONF = YES
 FREEIPMI_DEPENDENCIES = host-pkgconf
 FREEIPMI_INSTALL_STAGING = YES
 # Disable checking for /dev/urandom and /dev/random through AC_CHECK_FILE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
