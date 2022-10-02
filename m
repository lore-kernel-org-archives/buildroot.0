Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D090C433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 11:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFE74828E3;
	Sun,  2 Oct 2022 11:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFE74828E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D8KN08FbZV7v; Sun,  2 Oct 2022 11:31:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB04A828B3;
	Sun,  2 Oct 2022 11:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB04A828B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E6AD1BF3FD
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 11:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A8EC60B3D
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 11:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A8EC60B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id irzyqWAtIYnY for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 11:31:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB14560B12
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 11:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB14560B12
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A241C86754; Sun,  2 Oct 2022 11:31:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 2 Oct 2022 13:30:37 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 3b1cef1c0b6a6b1b2da0892bb8469d12cc403ee1
X-Git-Newrev: 4dc1fffca00d07462f59d195a8a8b73b1a885110
X-Patchwork-Hint: ignore
Message-Id: <20221002113101.A241C86754@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] Update for 2022.05.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=4dc1fffca00d07462f59d195a8a8b73b1a885110
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 50 ++++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7b2cb2a2c6..c68224bb37 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,53 @@
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
+	#14556: python-crossbar fails to build
+	#14796: 64 bit time and seccomp conflict (OpenSSH server crash)
+	#14951: boost compile error when running make  silently
+
 2022.05.2, released August 31st, 2022
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 14edc46865..0c2e7d7d77 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.05.2
+export BR2_VERSION := 2022.05.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1661958000
+BR2_VERSION_EPOCH = 1664710000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 7d68392a8d..f3d4866d33 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.05.2'
+RELEASE='2022.05.3'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
