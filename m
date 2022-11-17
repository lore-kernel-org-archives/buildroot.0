Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53663C433FE
	for <buildroot@archiver.kernel.org>; Thu, 17 Nov 2022 09:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C543641852;
	Thu, 17 Nov 2022 09:45:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C543641852
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r1lvfwTBMTAx; Thu, 17 Nov 2022 09:45:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D9C34186E;
	Thu, 17 Nov 2022 09:45:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D9C34186E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C42C21BF420
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 09:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C93D60D93
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 09:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C93D60D93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8pYl9MxaV2VX for <buildroot@lists.busybox.net>;
 Thu, 17 Nov 2022 09:45:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A5F060B43
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 09:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A5F060B43
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8C2383D9E; Thu, 17 Nov 2022 09:45:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Nov 2022 10:44:53 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 283cba61d15b32739aea8ad0505ddb4cd267fd1e
X-Git-Newrev: d036dc6ec873f50a24e73d8dbdafecb3b4098909
X-Patchwork-Hint: ignore
Message-Id: <20221117094536.E8C2383D9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Update for 2022.02.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=d036dc6ec873f50a24e73d8dbdafecb3b4098909
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 35 +++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 055b262d7a..87d4e7c472 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,38 @@
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
diff --git a/Makefile b/Makefile
index 03f2154f9f..7340b6b607 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.02.6
+export BR2_VERSION := 2022.02.7
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1664739000
+BR2_VERSION_EPOCH = 1668678000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 8ff587100c..6195166cc8 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.02.6'
+RELEASE='2022.02.7'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
