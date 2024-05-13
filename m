Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893CBC25B74
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 19:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5594B606C4;
	Mon, 13 May 2024 19:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ODNRodm2qqd; Mon, 13 May 2024 19:46:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41FED607A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41FED607A8;
	Mon, 13 May 2024 19:46:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5FFB31BF2CA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A679607A8
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcEMrM-dfckB for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 19:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A7A4606C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A7A4606C4
 for <buildroot@buildroot.org>; Mon, 13 May 2024 19:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC3438711C; Mon, 13 May 2024 19:46:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 21:38:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd4efc86c90b85fbd5825f6b2eab49790e09f601
X-Git-Newrev: 5f11ce4aeaba99917778c384b236d267e78a7b29
X-Patchwork-Hint: ignore
Message-Id: <20240513194643.EC3438711C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuplot: bump version to 6.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f11ce4aeaba99917778c384b236d267e78a7b29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

0001-configure-add-without-demo-option: adapt patch to 6.0.0 version

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-configure-add-without-demo-option.patch   | 42 +++++++++-------------
 package/gnuplot/gnuplot.hash                       |  8 ++---
 package/gnuplot/gnuplot.mk                         |  2 +-
 3 files changed, 21 insertions(+), 31 deletions(-)

diff --git a/package/gnuplot/0001-configure-add-without-demo-option.patch b/package/gnuplot/0001-configure-add-without-demo-option.patch
index a557e279bc..4eb9833fe7 100644
--- a/package/gnuplot/0001-configure-add-without-demo-option.patch
+++ b/package/gnuplot/0001-configure-add-without-demo-option.patch
@@ -8,32 +8,19 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 [Michael: adapt patch to 5.4.0 version]
 Signed-off-by: Michael Fischer <mf@go-sys.de>
+[Michael: adapt patch to 6.0.0 version]
+Signed-off-by: Michael Fischer <mf@go-sys.de>
 
-diff -Naur a/configure.ac b/configure.ac
---- a/configure.ac	2020-07-12 02:29:47.000000000 +0200
-+++ b/configure.ac	2020-08-06 14:21:17.918756893 +0200
-@@ -713,6 +713,17 @@
-                [ Define if you want to read .gnuplot from current directory (SECURITY RISK!).])
- fi
+--- a/configure.ac	2023-12-19 00:28:58.000000000 +0100
++++ b/configure.ac	2024-05-13 15:41:18.313920528 +0200
+@@ -715,6 +715,32 @@
+ 
+ dnl Process rest of with and enable options
  
 +dnl Whether we want to build the doc files
 +dnl Does nothing here, is passed on to the doc subdir
 +AC_ARG_ENABLE(doc,dnl
 +[  --disable-doc    do not build doc files])
-+
-+dnl Whether we want to build the demo files
-+dnl Does nothing here, is passed on to the demo subdir
-+AC_ARG_ENABLE(demo,dnl
-+[  --disable-demo    do not build demo files])
-+
-+
- dnl Sort help/subtopic tables by row or column
- AC_ARG_WITH(row-help,dnl
- [  --with-row-help         format help and subtopic tables by row (default)
-@@ -1095,6 +1106,24 @@
-   AC_DEFINE_UNQUOTED([DIST_CONTACT],["$DIST_CONTACT"],[Contact address for modified and binary distributed gnuplot versions])
- fi
- 
 +dnl build doc files
 +if test "$enable_doc" != no; then
 +  AC_CONFIG_SUBDIRS(docs)
@@ -43,6 +30,10 @@ diff -Naur a/configure.ac b/configure.ac
 +fi
 +AC_SUBST(DOCSUBDIR)
 +
++dnl Whether we want to build the demo files
++dnl Does nothing here, is passed on to the demo subdir
++AC_ARG_ENABLE(demo,dnl
++[  --disable-demo    do not build demo files])
 +dnl build demo files
 +if test "$enable_demo" != no; then
 +  AC_CONFIG_SUBDIRS(demo)
@@ -52,12 +43,11 @@ diff -Naur a/configure.ac b/configure.ac
 +fi
 +AC_SUBST(DEMOSUBDIR)
 +
- dnl Substitute variables
- AC_SUBST(PACKAGE)
- AC_SUBST(VERSION_MAJOR)
-diff -Naur a/Makefile.am b/Makefile.am
---- a/Makefile.am	2020-03-31 19:28:16.000000000 +0200
-+++ b/Makefile.am	2020-08-06 14:34:12.995097799 +0200
+ dnl without-extra-coordinate may leave a hole in "struct coordinate"
+ AC_ARG_WITH(extra-coordinate,dnl
+ [  --without-extra-coordinate    leave possible hole in struct coordinate],,)
+--- a/Makefile.am	2023-12-19 00:28:58.000000000 +0100
++++ b/Makefile.am	2024-05-13 15:54:21.189906680 +0200
 @@ -1,7 +1,7 @@
  ## Process this file with automake to produce Makefile.in -*-Makefile-*-
  AUTOMAKE_OPTIONS = foreign
diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index 39dacd50a4..dd587a8220 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.10/
-md5  334851e63450362bdb95e67fa8a23665  gnuplot-5.4.10.tar.gz
-sha1  9981e5b0111c07d376deef571ccc75ce4b4ebbd2  gnuplot-5.4.10.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.0/
+md5  10246eb96bbf3a151d6eb9bbcc223e4e  gnuplot-6.0.0.tar.gz
+sha1  3abea0cccad89b0c8fb6619ad51b83a971ee24b9  gnuplot-6.0.0.tar.gz
 # Locally computed
-sha256  975d8c1cc2c41c7cedc4e323aff035d977feb9a97f0296dd2a8a66d197a5b27c  gnuplot-5.4.10.tar.gz
+sha256  635a28f0993f6ab0d1179e072ad39b8139d07f51237f841d93c6c2ff4b1758ec  gnuplot-6.0.0.tar.gz
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 91e9bfb9bf..26b2daaf24 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 5.4.10
+GNUPLOT_VERSION = 6.0.0
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
