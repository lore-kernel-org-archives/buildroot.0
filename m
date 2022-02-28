Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADC2C433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 20:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BE7E405DF;
	Mon, 28 Feb 2022 20:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yOHkZT4wTndi; Mon, 28 Feb 2022 20:19:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEA40403A5;
	Mon, 28 Feb 2022 20:19:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FCBF1BF255
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 20:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E08E40491
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 20:19:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id stzD1tGziq98 for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 20:19:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56B6740457
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 20:19:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9138E8287C; Mon, 28 Feb 2022 20:11:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 21:18:28 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 49b1a3ef2e4a90bdcb24d08cb542ac9b5958a799
X-Git-Newrev: eeb8c004daf3e09eecdc62af993c74a118e5e5f9
X-Patchwork-Hint: ignore
Message-Id: <20220228201141.9138E8287C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] Update for 2021.11.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=eeb8c004daf3e09eecdc62af993c74a118e5e5f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 23 +++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1e1c060107..29b7f2159a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
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
diff --git a/Makefile b/Makefile
index 45fd44dd62..49551aacc7 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.11.1
+export BR2_VERSION := 2021.11.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1643497000
+BR2_VERSION_EPOCH = 1646080000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
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
