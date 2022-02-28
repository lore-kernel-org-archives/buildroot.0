Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07D0C433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 21:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A5D581BF4;
	Mon, 28 Feb 2022 21:12:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Xqpk-7XoB96; Mon, 28 Feb 2022 21:12:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A0FE815CA;
	Mon, 28 Feb 2022 21:12:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C26D1BF2FF
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 21:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B07F60E6B
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 21:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gaYmomPfnSQo for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 21:12:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C2F060E61
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 21:12:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7E61C83611; Mon, 28 Feb 2022 21:04:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 22:11:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9597d5ec8e9a021f674ccd97828c843977934e51
X-Git-Newrev: 67b160c3e39861ee01726763e2a7f65871abdbb5
X-Patchwork-Hint: ignore
Message-Id: <20220228210416.7E61C83611@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2021.11.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=67b160c3e39861ee01726763e2a7f65871abdbb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit eeb8c004daf3e09eecdc62af993c74a118e5e5f9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 23 +++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 31315cad34..0a76fec045 100644
--- a/CHANGES
+++ b/CHANGES
@@ -87,6 +87,29 @@
 	#14501: lttng-modules v2.11 package fails to build
 	#14531: Package EFL - build error
 
+2021.11.2, released February 28th, 2022
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
+	Updated/fixed packages: apitrace, binutils, casync, cgilua,
+	connman, expat, gauche, gdb, gensio, glibc, go, gst-omx,
+	gst1-devtools, gst1-libav, gst1-plugins-bad,
+	gst1-plugins-base, gst1-plugins-good, gst1-plugins-ugly,
+	gst1-python, gst1-rtsp-server, gst1-vaapi, gstreamer1,
+	gstreamer1-editing-services, kf5-extra-cmake-modules, kodi,
+	libarchive, linux, lm-sensors, localedef, log4cxx, mpd,
+	nfs-utils, php, pistache, pkcs11-helper, prosody,
+	python-django, python-pyzmq, python-regex,
+	python-sqliteschema, resiprocate, rtl8723bu, thermald, tiff,
+	tor, util-linux, vim, xen
+
 2021.11.1, released January 29th, 2022
 
 	Important / security related fixes.
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index eb312081fe..37981d7932 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.11.1'
+RELEASE='2021.11.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
