Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34B5C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 06:13:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1A6060ED4
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 06:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1A6060ED4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69CFD608B1;
	Tue, 12 Oct 2021 06:13:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MaMmqiBUO4n5; Tue, 12 Oct 2021 06:13:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF92E607F1;
	Tue, 12 Oct 2021 06:13:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC6F11BF318
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 06:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC43D80F29
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 06:13:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CuBiby4x69Ne for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 06:13:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA54A80E62
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 06:13:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A8FEF9548A; Tue, 12 Oct 2021 06:10:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 08:08:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08a60f1a1b72ca73c53df34a41c30370be3577cd
X-Git-Newrev: cfba9b0c0d70a20d0201017798f5f26786bba133
X-Patchwork-Hint: ignore
Message-Id: <20211012061029.A8FEF9548A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2021.05.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=cfba9b0c0d70a20d0201017798f5f26786bba133
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0d4c604da8e202f3a354080ea9f010abf3d0b240)
[Peter: drop Makefile change
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/CHANGES b/CHANGES
index 88abe57b69..f406b0f07b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -163,6 +163,39 @@
 	#13846: BR2_PACKAGE_LVM2_STANDARD_INSTALL should be default to
 	        y as before
 
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
