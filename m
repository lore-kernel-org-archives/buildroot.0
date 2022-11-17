Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E13DC4332F
	for <buildroot@archiver.kernel.org>; Thu, 17 Nov 2022 07:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9019B418D7;
	Thu, 17 Nov 2022 07:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9019B418D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jDRTPRIV1dbu; Thu, 17 Nov 2022 07:30:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6510D4180F;
	Thu, 17 Nov 2022 07:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6510D4180F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE85F1BF239
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 07:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A13F4016B
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 07:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A13F4016B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5h4EpCkWE2fP for <buildroot@lists.busybox.net>;
 Thu, 17 Nov 2022 07:30:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDA7C4012D
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 07:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDA7C4012D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B975C83D7D; Thu, 17 Nov 2022 07:30:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Nov 2022 08:24:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90f2700c09359b5f7627a1632bdcff911a6c5576
X-Git-Newrev: 12a33b54b319437a8636825dd80e8fe88d497930
X-Patchwork-Hint: ignore
Message-Id: <20221117073003.B975C83D7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.08.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=12a33b54b319437a8636825dd80e8fe88d497930
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 25680e6aa823bdeabb51d0768f12cebcd09c6d68)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 40 ++++++++++++++++++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index abee6d9fac..b856f16179 100644
--- a/CHANGES
+++ b/CHANGES
@@ -74,6 +74,46 @@
 	#15061: Node.js Package fails to build against musl  i386
 	#15071: RTL8723BS library is outdated
 
+2022.08.2, released November 16th, 2022
+
+	Important / security related fixes.
+
+	Defconfig: Aspeed ast2600evb: Correct FPU config, Kontron bl
+	imx8mm: Bump U-Boot to fix build issue, Pine64: Change to
+	mainline ATF to fix build issue, Zynqmp zcu102 / zcu106 / kria
+	kv260: Fix pmufw reset issue
+
+	Updated/fixed packages: arm-trusted-firmware, bind, botan,
+	ca-certificates, collectd, darkhttpd, dbus, dbus-broker, dhcp,
+	dnsmasq, docker-cli, docker-engine, exfatprogs, expat,
+	f2fs-tools, faad2, ffmpeg, freerdp, gitlab-runner, glibc,
+	gnutls, go, gpsd, gptfdisk, grub2, gsl, gst-omx,
+	gst1-devtools, gst1-libav, gst1-plugins-bad,
+	gst1-plugins-base, gst1-plugins-good, gst1-plugins-ugly,
+	gst1-python, gst1-rtsp-server, gst1-vaapi, gstreamer1,
+	gstreamer1-editing-services, hdparm, hostapd, imagemagick,
+	iwd, jack2, libbpf, libcurl, libidn2, libinput, libmdbx,
+	libopenssl, libosip2, libpng, libtasn1, libtorrent-rasterbar,
+	libuhttpd, libvncserver, libxml2, linux, linux-tools, lldpd,
+	lrzip, lz4, matchbox-startup-monitor, meson, msmtp,
+	multipath-tools, mupdf, musl, mv-ddr-marvell, mxml, nodejs,
+	ntfs-3g, numactl, openssh, openvmtools, oracle-mysql,
+	paho-mqtt-c, perl-net-ssleay, php, pixman, poppler, procps-ng,
+	python-django, python3, qdecoder, redis, rpi-userland, rsync,
+	rtl8189es, rtl8189fs, rtl8723bu, rtl8723ds,
+	rtl8812au-aircrack-ng, rtl8821au, rtl_433, samba4, shapelib,
+	socat, sqlite, squashfs, squid, strongswan, sudo, swupdate,
+	timescaledb, uclibc-ng-test, udisks, uftp, uhd, umtprd,
+	usbguard, vim, vlc, volk, wavemon, wilc-driver,
+	wireguard-linux-compat, wolfssl, wpa_supplicant, wpewebkit,
+	zlib-ng, zsh
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14936: nodejs does not build
+	#15026: package/udisks: install to staging
+	#15061: Node.js Package fails to build against musl i386
+
 2022.08.1, released October 2nd, 2022
 
 	Important / security related fixes.
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index f558e52ca6..40c7c4e1ce 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.08.1'
+RELEASE='2022.08.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
