Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C8AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 20:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55B1360F80;
	Sun, 10 Apr 2022 20:03:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iSEEm9oPu_R9; Sun, 10 Apr 2022 20:02:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 490FB60BA4;
	Sun, 10 Apr 2022 20:02:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C36561BF338
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C084A4014A
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:02:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vtiAW833J-jA for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 20:02:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC93940106
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 20:02:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AF02C838CE; Sun, 10 Apr 2022 19:53:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 22:00:54 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7fb40b1468867d158b7aa497abaad5592f267c5c
X-Git-Newrev: dadf1635779577d23a7d6b0b754605febc8beafc
X-Patchwork-Hint: ignore
Message-Id: <20220410195315.AF02C838CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/gstreamer1/gst1-libav: fix build without C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=dadf1635779577d23a7d6b0b754605febc8beafc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure without C++ raised since bump to version
1.18.0 in commit 15dc48ca9becafec6ba11b08af18453bc0e40c9e:

The following exception(s) were encountered:
Running "/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++'"

Fixes:
 - http://autobuild.buildroot.org/results/8ac0ba5eaaf7571857b4d8cfabf1488d640dc59a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 80a9e9057daf587242548aa23f8cd7a8d88bfa1f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...v-fix-build-on-systems-without-C-compiler.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch b/package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch
new file mode 100644
index 0000000000..6b275220f8
--- /dev/null
+++ b/package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch
@@ -0,0 +1,35 @@
+From 1477eb1fad92ac07cd057b3ecdb04edeeef9edba Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 4 Apr 2022 23:32:56 +0200
+Subject: [PATCH] gst-libav: fix build on systems without C++ compiler
+
+Fix the following build failure on systems without C++ compiler:
+
+The following exception(s) were encountered:
+Running "/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++'"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8ac0ba5eaaf7571857b4d8cfabf1488d640dc59a
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2112>
+
+[Retrieved (and backported) from:
+https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/1477eb1fad92ac07cd057b3ecdb04edeeef9edba]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ subprojects/gst-libav/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index fbfa3049afe..7da94b80d59 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,4 +1,4 @@
+-project('gst-libav', 'c', 'cpp',
++project('gst-libav', 'c',
+   version : '1.20.1',
+   meson_version : '>= 0.60',
+   default_options : [ 'warning_level=1',
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
