Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62092C433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 20:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D464F405EB;
	Mon, 28 Feb 2022 20:54:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D1X-5gSpha01; Mon, 28 Feb 2022 20:54:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8B8D403A5;
	Mon, 28 Feb 2022 20:54:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2726D1BF255
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 20:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 149424092C
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 20:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zPFqeB8EhuMk for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 20:54:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B5E8408B9
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 20:54:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 989B283611; Mon, 28 Feb 2022 20:46:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 21:54:15 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6515cc2894663e345b543eab240180b06de2acfb
X-Git-Newrev: f1d3b87d3d49a377b6fccc48ddd8531c4d293168
X-Patchwork-Hint: ignore
Message-Id: <20220228204634.989B283611@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] Update for 2021.02.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1d3b87d3d49a377b6fccc48ddd8531c4d293168
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 20 ++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index f7d14f636d..ee01f12a3c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,23 @@
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
diff --git a/Makefile b/Makefile
index d1a5d4d71e..a3dfc52f51 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.02.9
+export BR2_VERSION := 2021.02.10
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1643480000
+BR2_VERSION_EPOCH = 1646081600
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index ff793ccba8..85aa167efc 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.02.9'
+RELEASE='2021.02.10'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
