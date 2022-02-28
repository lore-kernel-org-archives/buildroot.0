Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6283C433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 21:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BB6E81BC2;
	Mon, 28 Feb 2022 21:17:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 63VfYR4gBGj8; Mon, 28 Feb 2022 21:17:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A90C81756;
	Mon, 28 Feb 2022 21:17:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B00E1BF2FF
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 21:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 964C581756
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 21:17:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gcw4IZRILVgT for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 21:17:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E577481498
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 21:17:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0E71583850; Mon, 28 Feb 2022 21:09:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 22:14:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 746d00ef9ff3772236b61e6477597a7af84e3e1e
X-Git-Newrev: 526da6145f81e3ac0753d550ec8f3afee66a6c2a
X-Patchwork-Hint: ignore
Message-Id: <20220228210935.0E71583850@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2021.02.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=526da6145f81e3ac0753d550ec8f3afee66a6c2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f1d3b87d3d49a377b6fccc48ddd8531c4d293168)
[Peter: drop Makefile/Vagrantfile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/CHANGES b/CHANGES
index 0a76fec045..7c1f014e13 100644
--- a/CHANGES
+++ b/CHANGES
@@ -736,6 +736,26 @@
 	#13751: libopenssl (static): huge drop in performance in newer ..
 	#13771: package htop has undeclared dependency on host python
 
+2021.02.10, released February 28th, 2022
+
+	Important / security related fixes.
+
+	Defconfigs: Andes ae3xx, Intel galileo: Fix build with host
+	gcc >= 10, ROC-RK3399-PC: Bump rootfs size to fix build issue.
+
+	Add conditional patching logic to fix build issues for older
+	U-Boot / Linux kernel versions when built with a host gcc >=
+	10.
+
+	Updated/fixed packages: casync, cgilua, connman, expat,
+	gauche, gensio, go, gst-omx, gst1-devtools, gst1-libav,
+	gst1-plugins-bad, gst1-plugins-base, gst1-plugins-good,
+	gst1-plugins-ugly, gst1-python, gst1-rtsp-server, gst1-vaapi,
+	gstreamer1, gstreamer1-editing-services,
+	kf5-extra-cmake-modules, kodi, libarchive, linux, lm-sensors,
+	log4cxx, mpd, nfs-utils, pistache, prosody, python-django,
+	python-pyzmq, rtl8723bu, thermald, tiff, util-linux, vim, xen
+
 2021.02.9, released January 29th, 2022
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
