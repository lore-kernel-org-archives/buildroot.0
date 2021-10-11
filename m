Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F7EC433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 09:47:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7847160D07
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 09:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7847160D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E34A400A4;
	Mon, 11 Oct 2021 09:47:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mJOtMba3IbDM; Mon, 11 Oct 2021 09:47:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 145DD4020B;
	Mon, 11 Oct 2021 09:47:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D3471BF3F3
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 09:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A22040411
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 09:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yjv5XQGPa3AZ for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 09:47:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B014F4040D
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 09:47:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 813A8952C4; Mon, 11 Oct 2021 09:44:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 11:46:43 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: aa9017a81a514d7e34f57b3a3cf99748c5709c32
X-Git-Newrev: 516b837002e21db6730928e8cad60b75146e099b
X-Patchwork-Hint: ignore
Message-Id: <20211011094426.813A8952C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] Update for 2021.08.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=516b837002e21db6730928e8cad60b75146e099b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 41 +++++++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 78ca4446e0..e1765f2c68 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,44 @@
+2021.08.1, released October 11, 2021
+
+	Important / security related fixes.
+
+	gdbinit: Mark the sysroot as a "safe path" before configuring
+	it, so pretty printers work correctly without having to pass
+	-ix to gdb
+
+	Updated/fixed packages: alsa-lib, apache,
+	arm-trusted-firmware, atftp, bind, botan, cog, containerd,
+	cryptopp, docker-cli, dash, dc3dd, docker-engine, dovecot,
+	environment-setup, erlang, fetchmail, ffmpeg, fio, gcc, gd,
+	gdb, ghostscript, gnuradio, gnutils, go,
+	gobject-introspection, google-breakpad, gst-omx,
+	gst1-devtools, gst1-interpipe, gst1-libav, gst1-plugins-bad,
+	gst1-plugins-base, gst1-plugins-good, gst1-plugins-ugly,
+	gst1-python, gst1-rtsp-server, gst1-vaapi, gstreamer1,
+	gstreamer1-editing-services, gupnp, haproxy, imlib2, kodi,
+	kodi-pvr-octonet, kodi-visualisation-fishbmc, libcurl,
+	libexif, libgcrypt, libglib2, libkrb5, libressl, librsvg,
+	libsndfile, libssh, libvirt, libxcrypt, libyang, links, lvm2,
+	lynx, lxc, mc, mesa3d, micropython, minicom, mono, mosquitto,
+	mtr, mupdf, mv-ddr-marvell, net-tools, nginx-dav-ext, nmap,
+	nodejs, ntfs-3g, openjdk, openjdk-bin, openldap, openssh,
+	pcre2, php, php-gnupg, pipewire, postgis, python-aioconsole,
+	python-cbor2, python-cffi, python-cython, python-dateutil,
+	python-django, python-pillow, python-pip, python-texttable,
+	python-urllib3, python-webob, qemu, qt5location, redis,
+	refpolicy, ripgrep, ruby, runc, sispmctl, sox, squid,
+	strongswan, supervisor, swupdate, syslinux, systemd, tinycbor,
+	trace-cmd, uboot-tools, uclibc, udisks, uhd, vim, vsftpd,
+	wavemon, webkitgtk, wget, wireless-regdb, wpewebkit,
+	xapp_xrdb, xapp_xwd, xen, xlib_libXfont2, xlib_libXft,
+	xserver_xorg-server, zip
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14206: Kodi: even when not enabled, forcefully selects libevdev..
+	#14211: libffi-3.3.tar.gz repacked
+	#14221: mv-ddr-marvell fails license validation
+
 2021.08, released September 4th, 2021
 
 	Various fixes.
diff --git a/Makefile b/Makefile
index 2aef644498..eb4fde4ea1 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.08
+export BR2_VERSION := 2021.08.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1630749000
+BR2_VERSION_EPOCH = 1633945000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index aa6418d429..6bc64e829a 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.08'
+RELEASE='2021.08.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
