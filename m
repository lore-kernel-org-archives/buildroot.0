Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5D4C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 06:18:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F360660ED4
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 06:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F360660ED4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE7F440163;
	Tue, 12 Oct 2021 06:18:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gQxBHdqPHVNY; Tue, 12 Oct 2021 06:18:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2515A40128;
	Tue, 12 Oct 2021 06:18:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 91BB71BF318
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 06:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 893F640257
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 06:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wGJE9pvFwYWr for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 06:18:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DE14401B2
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 06:18:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 77E41954A9; Tue, 12 Oct 2021 06:15:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 08:15:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f81fc437020e8a9f62ac42fbdc7fe9e66611116
X-Git-Newrev: 28af41c3d9df892d8ff5579c916450c9dfab0b4b
X-Patchwork-Hint: ignore
Message-Id: <20211012061542.77E41954A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2021.02.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=28af41c3d9df892d8ff5579c916450c9dfab0b4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b1e32fa954faae7dce51ebee48981af3ace3c0ba)
[Peter: drop Makefile/Vagrantfile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/CHANGES b/CHANGES
index f406b0f07b..591ae21e6a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -417,6 +417,38 @@
 	#13751: libopenssl (static): huge drop in performance in newer ..
 	#13771: package htop has undeclared dependency on host python
 
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
