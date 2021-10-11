Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DBCC433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 18:44:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CC4260E90
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 18:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CC4260E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B23040467;
	Mon, 11 Oct 2021 18:44:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nf4quzvyoRhk; Mon, 11 Oct 2021 18:44:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A86C340455;
	Mon, 11 Oct 2021 18:44:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CA4A1BF989
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 18:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1ACD3402C2
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 18:44:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cYSCrW5pJIUi for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 18:44:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08F75400ED
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 18:44:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 00D1B953ED; Mon, 11 Oct 2021 18:41:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 20:42:43 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 862e79d7cb41764f4fd195ceb789fca07422fa52
X-Git-Newrev: b1e32fa954faae7dce51ebee48981af3ace3c0ba
X-Patchwork-Hint: ignore
Message-Id: <20211011184134.00D1B953ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] Update for 2021.02.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1e32fa954faae7dce51ebee48981af3ace3c0ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 32 ++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 63cb40721e..80382c7f9e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,35 @@
+2021.02.6, released October 11, 2021
+
+	Important / security related fixes.
+
+	gdbinit: Mark the sysroot as a "safe path" before configuring
+	it, so pretty printers work correctly without having to pass
+	-ix to gdb
+
+	Updated/fixed packages: alsa-lib, apache,
+	arm-trusted-firmware, atftp, bind, botan, cryptopp, dash,
+	dc3dd, docker-cli, docker-containerd, docker-engine, dovecot,
+	erlang, fetchmail, gdb, ghostscript, go, gst-omx,
+	gst1-devtools, gst1-interpipe, gst1-libav, gst1-plugins-bad,
+	gst1-plugins-base, gst1-plugins-good, gst1-plugins-ugly,
+	gst1-python, gst1-rtsp-server, gst1-vaapi, gstreamer1,
+	gstreamer1-editing-services, kodi-pvr-octonet, libcurl,
+	libkrb5, libressl, libsndfile, libyang, lxc, lynx, mesa3d,
+	micropython, minicom, mono, mtr, mv-ddr-marvell, net-tools,
+	nmap, nodejs, ntfs-3g, openjdk, openjdk-bin, openldap,
+	openssh, php, python-aioconsole, python-cffi, python-dateutil,
+	python-django, python-pip, python-texttable, python-urllib3,
+	python-webob, qt5location, redis, refpolicy, ripgrep, runc,
+	sispmctl, squid, strongswan, supervisor, syslinux, tinycbor,
+	trace-cmd, uboot-tools, uclibc, wavemon, wireless-regdb, xen,
+	xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14206: Kodi: even when not enabled, forcefully selects libevdev..
+	#14211: libffi-3.3.tar.gz repacked
+	#14221: mv-ddr-marvell fails license validation
+
 2021.02.5, released September 15th, 2021
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 013b29edb7..2b96d5afa8 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.02.5
+export BR2_VERSION := 2021.02.6
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1631718000
+BR2_VERSION_EPOCH = 1633977000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index e1f77efdbd..4092879130 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.02.5'
+RELEASE='2021.02.6'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
