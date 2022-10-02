Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EBDC433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 16:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2513408CF;
	Sun,  2 Oct 2022 16:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2513408CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NOVusbc78VKM; Sun,  2 Oct 2022 16:45:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 627A2408C6;
	Sun,  2 Oct 2022 16:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 627A2408C6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BABBA1BF419
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 16:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9618382496
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 16:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9618382496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6QscUBzT_Zoj for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 16:45:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8686080B55
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 16:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8686080B55
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72F0586795; Sun,  2 Oct 2022 16:45:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 2 Oct 2022 16:18:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebc9beaa6af0bc27da8b9def4da758ac1bfbbf70
X-Git-Newrev: 446c584c96613d0d0cd32ed20858b191d96310d9
X-Patchwork-Hint: ignore
Message-Id: <20221002164535.72F0586795@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.05.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=446c584c96613d0d0cd32ed20858b191d96310d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

(cherry picked from commit 4dc1fffca00d07462f59d195a8a8b73b1a885110)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/CHANGES b/CHANGES
index 03c859ceb6..3fc00b44d7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -134,6 +134,57 @@
 	#14881: Watchdogd Package missing INSTALL_STAGING
 	#14876: arm-trusted-firmware can no longer be  compiled with fPIE
 
+2022.05.3, released October 2nd, 2022
+
+	Important / security related fixes.
+
+	Fixed compatibility issue with make 4.3 and the 'printvars' /
+	'show-vars' commands.
+
+	Dependencies: Ensure 'find' and 'xargs' are available on the
+	build host.
+
+	A large number of typo fixes.
+
+	Defconfigs: Galileo: Fix defconfig syntax, Licheepi zero: Fix
+	U-Boot dependencies, Bananapi m1, Olimx a20 olinuxino lime
+	1+2, a33 olinuxino: Use standard FPU configuration, Pine 64
+	sopine, Rockpro 64: Change to mainline ATF to fix build issue.
+
+	Updated/fixed packages: ace, arm-trusted-firmware,
+	babeltrace2, boost, botan, busybox, clamav, cog, containerd,
+	cups, dhcpcd, directfb, docker-cli, docker-engine, connman,
+	edk2, edk2-platform, elf2flt, expat, ffmpeg, ficl, freeswitch,
+	gcc, gdb, git, glibc, gnutls, go, gocryptfs, graphicsmagick,
+	grub2, gst1-plugins-bad, gst1-plugins-good, heirloom-mailx,
+	icu, igh-ethercat, imagemagick, imx-gpu-viv, jack2, jose,
+	jpeg, jquery-ui-themes, kodi, kvm-unit-tests, libcamera,
+	libconfuse, libfreeimage, libglvnd, libgpg-error, libinput,
+	libmdbx, libp11, libsepol, libtirpc, libupnp, libvirt,
+	libvncserver, libwpe, libxml2, libzlib, linux, linux-tools,
+	lshw, m4, makedevs, mali-driver, mariadb, memcached, mesa3d,
+	minidlna, mosquitto, mutt, mv-ddr-marvell, ncurses, ne10,
+	netsniff-ng, networkd-dispatcher, ocrad, ola, opencv4,
+	openocd, openssh, openvmtools, pango, pcsc-lite, pistache,
+	polkit, postgis, postgresql, python-crossbar,
+	python-paho-mqtt, python-pygame, python-service-identity,
+	python-txdbus, python3, qemu, qlibc,
+	qoriq-cadence-dp-firmware, qt5xmlpatterns, ranger, redis,
+	rng-tools, rsync, rsyslog, rtl8189es, rtl8723bu, runc, rustc,
+	sconeserver, sdl2, snort, sox, sqlite, squid, stress-ng,
+	strongswan, sunxi-mali-utgard-driver, sysdig, syslinux,
+	syslog-ng, tcf-agent, tcpreplay, tesseract-ocr, tinyproxy,
+	uacme, uboot-tools, uclibc, unzip, usbguard, v4l2loopback,
+	vim, waffle, webkitgtk, weston, wolfssl, wpewebkit, xfsprogs,
+	xserver_xorg-server, xtables-addons, zziplib
+
+	Issues resolved:
+
+	#13216: [Documentation] 2020.02.6 requires GNU find utils
+	#14556: python-crossbar fails to build
+	#14796: 64 bit time and seccomp conflict (OpenSSH server crash)
+	#14951: boost compile error when running make  silently
+
 2022.05.2, released August 31st, 2022
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
