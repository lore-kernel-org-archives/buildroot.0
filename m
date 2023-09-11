Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F4FEE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F09381EE4;
	Mon, 11 Sep 2023 19:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F09381EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OtaPmyln0aD1; Mon, 11 Sep 2023 19:52:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2404180FF8;
	Mon, 11 Sep 2023 19:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2404180FF8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCAD71BF2BB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4F40402DB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4F40402DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KPqt_GRf8AKF for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:52:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBEDF400EF
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBEDF400EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7C2F86D05; Mon, 11 Sep 2023 19:52:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 21:51:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9318e583ada4c72e7a67f1bfe19f33ae5ec49374
X-Git-Newrev: dc4436245cdd6fc62f476ff072ffed6743cf9400
X-Patchwork-Hint: ignore
Message-Id: <20230911195209.A7C2F86D05@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/speechd: bump version to 0.11.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dc4436245cdd6fc62f476ff072ffed6743cf9400
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- remove 0001-add-disable-doc.patch (upstream applied, see [1])

For details see [2].

[1] https://github.com/brailcom/speechd/commit/1dbc42684dcd3519fbc93da7e4164aa8dba8808f
[2] https://github.com/brailcom/speechd/releases/tag/0.11.5

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                        |  1 -
 package/speechd/0001-add-disable-doc.patch | 78 ------------------------------
 package/speechd/speechd.hash               |  2 +-
 package/speechd/speechd.mk                 |  2 +-
 4 files changed, 2 insertions(+), 81 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index dd29e06113..f34df29bfc 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1373,7 +1373,6 @@ package/sox/0005-configure.ac-fix-static-linking-with-sndfile.patch Upstream
 package/sp-oops-extract/0001-Make-the-Makefile-more-cross-compiler-friendly.patch Upstream
 package/sp-oops-extract/0002-stdint-cleanup.patch Upstream
 package/spandsp/0001-configure.ac-fix-AVX-SSE-and-MMX-options.patch Upstream
-package/speechd/0001-add-disable-doc.patch Upstream
 package/speex/0001-thumb2-support.patch Upstream
 package/squid/S97squid Indent Shellcheck Variables
 package/sredird/0001-termio.patch Upstream
diff --git a/package/speechd/0001-add-disable-doc.patch b/package/speechd/0001-add-disable-doc.patch
deleted file mode 100644
index dd17b10e4f..0000000000
--- a/package/speechd/0001-add-disable-doc.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From d88557d3c29c33f76af20cb7a6eb798f6f598c23 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 19 Feb 2023 15:18:35 +0100
-Subject: [PATCH] add --disable-doc
-
-Allow the user to disable documentation through --disable-doc to avoid
-the following build failure without makeinfo:
-
-make[3]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/speechd-0.11.4/doc'
-  MAKEINFO ssip.info
-  MAKEINFO spd-say.info
-/home/buildroot/autobuild/instance-2/output-1/build/speechd-0.11.4/missing: line 81: makeinfo: command not found
-/home/buildroot/autobuild/instance-2/output-1/build/speechd-0.11.4/missing: line 81: makeinfo: command not found
-WARNING: 'makeinfo' is missing on your system.
-         You should only need it if you modified a '.texi' file, or
-         any other file indirectly affecting the aspect of the manual.
-         You might want to install the Texinfo package:
-         <https://www.gnu.org/software/texinfo/>
-         The spurious makeinfo call might also be the consequence of
-         using a buggy 'make' (AIX, DU, IRIX), in which case you might
-         want to install GNU make:
-         <https://www.gnu.org/software/make/>
-WARNING: 'makeinfo' is missing on your system.
-         You should only need it if you modified a '.texi' file, or
-         any other file indirectly affecting the aspect of the manual.
-         You might want to install the Texinfo package:
-         <https://www.gnu.org/software/texinfo/>
-         The spurious makeinfo call might also be the consequence of
-         using a buggy 'make' (AIX, DU, IRIX), in which case you might
-         want to install GNU make:
-         <https://www.gnu.org/software/make/>
-make[3]: *** [Makefile:492: ssip.info] Error 127
-
-Fixes:
- - http://autobuild.buildroot.org/results/d4f193545eb31864a9bac5a9d05bba39d3c7ff3e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/brailcom/speechd/pull/810]
----
- Makefile.am  | 6 +++++-
- configure.ac | 4 ++++
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 26617c78..480eb50e 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -22,7 +22,11 @@ pkgconfig_DATA = speech-dispatcher.pc
- 
- BUILT_SOURCES = $(top_srcdir)/.version
- 
--SUBDIRS= include locale src config doc po
-+SUBDIRS= include locale src config po
-+
-+if ENABLE_DOC
-+SUBDIRS += doc
-+endif
- 
- EXTRA_DIST= config.rpath COPYING.LGPL COPYING.GPL-2 COPYING.GPL-3 ANNOUNCE BUGS FAQ README.md README.packagers README.translators README.overview.md README.style.md build.sh speech-dispatcherd.service.in speech-dispatcher.socket speech-dispatcher.service.in po/Makevars.in po/README
- 
-diff --git a/configure.ac b/configure.ac
-index faaa8629..4f2af908 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -168,6 +168,10 @@ AC_SUBST([EXTRA_SOCKET_LIBS])
- AC_SUBST([ERROR_CFLAGS])
- AC_SUBST([RDYNAMIC])
- 
-+AC_ARG_ENABLE([doc],
-+              [AC_HELP_STRING([--disable-doc], [turn off documentation])])
-+AM_CONDITIONAL(ENABLE_DOC, test "$enable_doc" != "no")
-+
- # Check for python support.
- # Python 3 or greater required
- AC_ARG_ENABLE([python],
--- 
-2.39.0
-
diff --git a/package/speechd/speechd.hash b/package/speechd/speechd.hash
index 4eb4cd09d2..0b02a35792 100644
--- a/package/speechd/speechd.hash
+++ b/package/speechd/speechd.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  628d4446894b47f0df099123924c1070180b5b5b09c5b637ebe80d8578fba92f  speechd-0.11.4.tar.gz
+sha256  cc4b388fce40681eaff3545e9cc0642216c13c420d5676a4d28c957ddcb916de  speechd-0.11.5.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPL-3
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
index ae777c6d30..c68d466116 100644
--- a/package/speechd/speechd.mk
+++ b/package/speechd/speechd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPEECHD_VERSION = 0.11.4
+SPEECHD_VERSION = 0.11.5
 SPEECHD_SITE = $(call github,brailcom,speechd,$(SPEECHD_VERSION))
 SPEECHD_LICENSE = GPL-2.0+, GPL-3.0+ (buildsystem), LGPL-2.1+
 SPEECHD_LICENSE_FILES = COPYING.GPL-2 COPYING.GPL-3 COPYING.LGPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
