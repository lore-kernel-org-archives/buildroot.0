Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC11AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 06:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9108060E28;
	Fri, 22 Jul 2022 06:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9108060E28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8U-BIU6ciXDc; Fri, 22 Jul 2022 06:38:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8442460ED4;
	Fri, 22 Jul 2022 06:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8442460ED4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47B7A1C11A9
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD2C1847C2
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD2C1847C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7zTzv-lX_AWF for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 06:34:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7E74847C3
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 06:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7E74847C3
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E4E17840F1; Fri, 22 Jul 2022 06:20:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 08:32:31 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2742cf49b602ad40a4127a92898ad4acabf13e33
X-Git-Newrev: 50110815504b1668a6aff7bba553a7862b48061f
X-Patchwork-Hint: ignore
Message-Id: <20220722062038.E4E17840F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gst1-libav: bump
 version to 1.20.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=50110815504b1668a6aff7bba553a7862b48061f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 88d70d2c2b44e5ac2ff9868639f5bfb3335206cc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...v-fix-build-on-systems-without-C-compiler.patch | 35 ----------------------
 package/gstreamer1/gst1-libav/gst1-libav.hash      |  4 +--
 package/gstreamer1/gst1-libav/gst1-libav.mk        |  2 +-
 3 files changed, 3 insertions(+), 38 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch b/package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch
deleted file mode 100644
index 6b275220f8..0000000000
--- a/package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1477eb1fad92ac07cd057b3ecdb04edeeef9edba Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 4 Apr 2022 23:32:56 +0200
-Subject: [PATCH] gst-libav: fix build on systems without C++ compiler
-
-Fix the following build failure on systems without C++ compiler:
-
-The following exception(s) were encountered:
-Running "/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++'"
-
-Fixes:
- - http://autobuild.buildroot.org/results/8ac0ba5eaaf7571857b4d8cfabf1488d640dc59a
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2112>
-
-[Retrieved (and backported) from:
-https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/1477eb1fad92ac07cd057b3ecdb04edeeef9edba]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- subprojects/gst-libav/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index fbfa3049afe..7da94b80d59 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,4 +1,4 @@
--project('gst-libav', 'c', 'cpp',
-+project('gst-libav', 'c',
-   version : '1.20.1',
-   meson_version : '>= 0.60',
-   default_options : [ 'warning_level=1',
--- 
-GitLab
-
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 3f9c849729..1b86e82b93 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.20.1.tar.xz.sha256sum
-sha256  91a71fb633b75e1bd52e22a457845cb0ba563a2972ba5954ec88448f443a9fc7  gst-libav-1.20.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.20.3.tar.xz.sha256sum
+sha256  3fedd10560fcdfaa1b6462cbf79a38c4e7b57d7f390359393fc0cef6dbf27dfe  gst-libav-1.20.3.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 4e99de45f9..80545fdd4c 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.20.1
+GST1_LIBAV_VERSION = 1.20.3
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
