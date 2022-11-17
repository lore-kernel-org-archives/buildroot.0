Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC7FC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC31342D60;
	Mon, 20 Feb 2023 21:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC31342D60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-NMMVHVe24R; Mon, 20 Feb 2023 21:22:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B26E42D5E;
	Mon, 20 Feb 2023 21:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B26E42D5E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 160EC1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18EC2610CB
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18EC2610CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S69W9PO5s5hs for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A85C6106F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A85C6106F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3920686494; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Nov 2022 15:15:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bc9b716296f37e0e3e47fd34c8991e92b6baeebd
X-Git-Newrev: 4d46f51064e4611142c723ad080d01ed6095af2a
X-Patchwork-Hint: ignore
Message-Id: <20230220205151.3920686494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Update for 2022.02.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d46f51064e4611142c723ad080d01ed6095af2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d036dc6ec873f50a24e73d8dbdafecb3b4098909)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/CHANGES b/CHANGES
index b856f16179..d08b2500ab 100644
--- a/CHANGES
+++ b/CHANGES
@@ -479,6 +479,41 @@
 	#14731: BR2_PACKAGE_IOSTAT
 	#14751: LVM2 Outdated Link
 
+2022.02.7, released November 17th, 2022
+
+	Important / security related fixes.
+
+	Defconfig: Pine64: Change to mainline ATF to fix build
+	issue, Zynqmp zcu102 / zcu106: Fix pmufw reset issue
+
+	Updated/fixed packages: arm-trusted-firmware, bind, botan,
+	collectd, darkhttpd, dbus, dhcp, dnsmasq, docker-cli,
+	docker-engine, exfatprogs, expat, f2fs-tools, faad2, ffmpeg,
+	freerdp, gnutls, go, gpsd, grub2, gsl, gst-omx, gst1-devtools,
+	gst1-libav, gst1-plugins-bad, gst1-plugins-base,
+	gst1-plugins-good, gst1-plugins-ugly, gst1-python,
+	gst1-rtsp-server, gst1-vaapi, gstreamer1,
+	gstreamer1-editing-services, hdparm, hostapd, imagemagick,
+	iwd, jack2, libbpf, libcurl, libfribi, libidn2, libinput,
+	libmdbx, libopenssl, libosip2, libpng, libtasn1,
+	libtorrent-rasterbar, libuhttpd, libvncserver, libxml2, linux,
+	linux-tools, lldpd, lrzip, lz4, matchbox-startup-monitor,
+	msmtp, multipath-tools, mupdf, musl, mv-ddr-marvell, mxml,
+	nodejs, ntfs-3g, numactl, openvmtools, oracle-mysql,
+	paho-mqtt-c, perl-net-ssleay, php, pixman, poppler, procps-ng,
+	python-django, python3, qdecoder, rpi-userland, rsync,
+	rtl8189es, rtl8189fs, rtl8723bu, rtl8812au-aircrack-ng,
+	rtl8821au, rtl_433, samba4, shapelib, socat, squid, sqlite,
+	squashfs, strongswan, sudo, swupdate, timescaledb, u-boot,
+	uclibc-ng-test, udisks, uftp, uhd, umtprd, vim, wavemon,
+	wireguard-linux-compat, wolfssl, wpa_supplicant, wpewebkit,
+	zlib-ng, zsh
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15026: package/udisks: install to staging
+	#15061: Node.js Package fails to build against musl i386
+
 2022.02.6, released October 2nd, 2022
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
