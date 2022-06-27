Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA9BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 21:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D7AB84007;
	Mon, 27 Jun 2022 21:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D7AB84007
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lSvtLdg-4JFf; Mon, 27 Jun 2022 21:40:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8937583F47;
	Mon, 27 Jun 2022 21:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8937583F47
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 142D31BF34B
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 21:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 766CF404BB
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 21:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 766CF404BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bMzfVsVuq9zc for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 21:37:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D0EB408C9
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 21:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D0EB408C9
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 051008763B; Mon, 27 Jun 2022 21:25:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Jun 2022 23:37:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9281777a35c2cbab5de04e46fb3873414a60546
X-Git-Newrev: 613a3ac3d05f552662af49dbbb6b56296c629668
X-Patchwork-Hint: ignore
Message-Id: <20220627212514.051008763B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gst1-python: bump version to 1.20.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=613a3ac3d05f552662af49dbbb6b56296c629668
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...n-fix-build-on-systems-without-C-compiler.patch | 35 ----------------------
 package/gstreamer1/gst1-python/gst1-python.hash    |  4 +--
 package/gstreamer1/gst1-python/gst1-python.mk      |  2 +-
 3 files changed, 3 insertions(+), 38 deletions(-)

diff --git a/package/gstreamer1/gst1-python/0001-gst-python-fix-build-on-systems-without-C-compiler.patch b/package/gstreamer1/gst1-python/0001-gst-python-fix-build-on-systems-without-C-compiler.patch
deleted file mode 100644
index 7d3059d61a..0000000000
--- a/package/gstreamer1/gst1-python/0001-gst-python-fix-build-on-systems-without-C-compiler.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 26c2385faed0bb997368daabd4c64207b3fc01ca Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 15 Apr 2022 18:58:49 +0200
-Subject: [PATCH] gst-python: fix build on systems without C++ compiler
-
-Fix the following build failure on systems without C++ compiler:
-
-The following exception(s) were encountered:
-Running "/home/autobuild/autobuild/instance-0/output-1/host/bin/i686-buildroot-linux-gnu-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-0/output-1/host/bin/i686-buildroot-linux-gnu-g++'"
-
-Fixes:
- - http://autobuild.buildroot.org/results/eebf65036f79d21d347714d62afecd0108393308
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2200>
-
-[Retrieved (and backported) from:
-https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/26c2385faed0bb997368daabd4c64207b3fc01ca]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- subprojects/gst-python/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 1462604b297..c28df16192a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,4 +1,4 @@
--project('gst-python', 'c', 'cpp',
-+project('gst-python', 'c',
-   version : '1.20.1',
-   meson_version : '>= 0.60',
-   default_options : [ 'warning_level=1',
--- 
-GitLab
-
diff --git a/package/gstreamer1/gst1-python/gst1-python.hash b/package/gstreamer1/gst1-python/gst1-python.hash
index fe1e2068b1..9501d94a97 100644
--- a/package/gstreamer1/gst1-python/gst1-python.hash
+++ b/package/gstreamer1/gst1-python/gst1-python.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.20.1.tar.xz.sha256sum
-sha256  ba6cd59faa3db3981d8c6982351c239d823c0b8e80b1acf58d2997b050289422  gst-python-1.20.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.20.3.tar.xz.sha256sum
+sha256  db348120eae955b8cc4de3560a7ea06e36d6e1ddbaa99a7ad96b59846601cfdc  gst-python-1.20.3.tar.xz
 sha256  ea3ad127610e5ded2210b3a86a46314f2b3b28e438eccffdae19a4d6fbcdb0c2  COPYING
diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index 3fd8059bee..0fa1f661b8 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PYTHON_VERSION = 1.20.1
+GST1_PYTHON_VERSION = 1.20.3
 GST1_PYTHON_SOURCE = gst-python-$(GST1_PYTHON_VERSION).tar.xz
 GST1_PYTHON_SITE = https://gstreamer.freedesktop.org/src/gst-python
 GST1_PYTHON_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
