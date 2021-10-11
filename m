Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D96C43217
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 14:13:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 695A160E90
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 14:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 695A160E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 149C96088A;
	Mon, 11 Oct 2021 14:13:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DibW_gd3jKVJ; Mon, 11 Oct 2021 14:13:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 657B360872;
	Mon, 11 Oct 2021 14:13:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 575471BF29D
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 14:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45FEC401D0
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 14:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id upbaEyWIN3KA for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 14:13:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35297400C9
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 14:13:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9696695307; Mon, 11 Oct 2021 14:11:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 16:13:04 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 5a89e46bbdb9db61f1e90adf4e892bba8a800411
X-Git-Newrev: 0d4c604da8e202f3a354080ea9f010abf3d0b240
X-Patchwork-Hint: ignore
Message-Id: <20211011141103.9696695307@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] Update for 2021.05.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d4c604da8e202f3a354080ea9f010abf3d0b240
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 33 +++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index ef8e9b39da..f564b09c35 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,36 @@
+2021.05.3, released October 11, 2021
+
+	Important / security related fixes.
+
+	gdbinit: Mark the sysroot as a "safe path" before configuring
+	it, so pretty printers work correctly without having to pass
+	-ix to gdb
+
+	Updated/fixed packages: alsa-lib, apache,
+	arm-trusted-firmware, atftp, bind, botan, containerd,
+	cryptopp, dash, dc3dd, docker-cli, docker-engine, dovecot,
+	erlang, fetchmail, ffmpeg, gdb, ghostscript, go, gst-omx,
+	gst1-devtools, gst1-interpipe, gst1-libav, gst1-plugins-bad,
+	gst1-plugins-base, gst1-plugins-good, gst1-plugins-ugly,
+	gst1-python, gst1-rtsp-server, gst1-vaapi, gstreamer1,
+	gstreamer1-editing-services, kodi, kodi-pvr-octonet,
+	kodi-visualisation-fishbmc, libcurl, libkrb5, libressl,
+	libsndfile, libxcrypt, libyang, lxc, lynx, mesa3d,
+	micropython, minicom, mono, mtr, mv-ddr-marvell, net-tools,
+	nmap, nodejs, ntfs-3g, openjdk, openjdk-bin, openldap,
+	openssh, pcre2, php, python-aioconsole, python-cffi,
+	python-dateutil, python-django, python-pip, python-texttable,
+	python-urllib, python-webob, qt5location, redis, refpolicy,
+	ripgrep, runc, sispmctl, squid, strongswan, supervisor,
+	syslinux, tinycbor, trace-cmd, uboot-tools, uclibc, wavemon,
+	wget, wireless-regdb, xen, xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14206: Kodi: even when not enabled, forcefully selects libevdev..
+	#14211: libffi-3.3.tar.gz repacked
+	#14221: mv-ddr-marvell fails license validation
+
 2021.05.2, released September 15th, 2021
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 43abe05001..7d10eee1a2 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.05.2
+export BR2_VERSION := 2021.05.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1631716000
+BR2_VERSION_EPOCH = 1633961000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
