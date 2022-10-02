Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9895C433FE
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 19:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 389B281438;
	Sun,  2 Oct 2022 19:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 389B281438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SHb8dNBbUR5I; Sun,  2 Oct 2022 19:37:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E97B81401;
	Sun,  2 Oct 2022 19:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E97B81401
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD4E41BF2FB
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 19:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88F5F81401
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 19:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88F5F81401
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lxddMzxBWqZ0 for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 19:37:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78B4081400
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 19:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78B4081400
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64875867A0; Sun,  2 Oct 2022 19:37:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 2 Oct 2022 21:37:02 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 92938648df013e5990812ff1462a70eddf762f5c
X-Git-Newrev: 374f83630bafe7371ecd751cf07e3e7c0ce1c71e
X-Patchwork-Hint: ignore
Message-Id: <20221002193739.64875867A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Update for 2022.02.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=374f83630bafe7371ecd751cf07e3e7c0ce1c71e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4d7076e908..055b262d7a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,51 @@
+2022.02.6, released October 2nd, 2022
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
+	babeltrace2, boost, botan, busybox, clamav, cog, connman,
+	containerd, cups, dhcpcd, directfb, docker-cli, docker-engine,
+	edk2, edk2-platforms, elf2flt, expat, ffmpeg, ficl,
+	freeswitch, freetype, gcc, gdb, git, gnutls, go,
+	graphicsmagic, grub2, gst1-plugins-bad, gst1-plugins-good,
+	heirloom-mailx, icu, igh-ethercat, imagemagick, imx-gpu-viv,
+	jose, jpeg, jquery-ui-themes, kodi, libconfuse, libfreeimage,
+	libglvnd, libgpg-error, libinput, libmdbx, libsepol, libtirpc,
+	libupnp, libvirt, libvncserver, libwpe, libxml2, libzlib,
+	linux, linux-tools, lshw, m4, makedevs, makedumpfile,
+	mali-driver, mariadb, memcached, mesa3d, minidlna, mosquitto,
+	mutt, mv-ddr-marvell, ncurses, ne10, netsniff-ng,
+	networkd-dispatcher, ocrad, opencv4, openocd, openssh, pango,
+	pcsc-lite, polkit, postgis, postgresql, python-paho-mqtt,
+	python-pygame, python3, qemu, qlibc,
+	qoriq-cadence-dp-firmware, qt5xmlpatterns, ranger, rng-tools,
+	rsync, rsyslog, rtl8189es, rtl8723be, runc, rustc,
+	sconeserver, sdl2, snort, sox, sqlite, squid, stress-ng,
+	strongswan, sunxi-mali-utgard-driver, syslinux, syslog-ng,
+	tcf-agent, tcpreplay, tesseract-ocr, tinyproxy, uacme,
+	uboot-tools, uclibc, unzip, usbguard, v4l2loopback, vim,
+	webkitgtk, wolfssl, wpewebkit, xfsprogs, xserver_xorg-server,
+	xtables-addons, zziplib
+
+	Issues resolved:
+
+	#13216: [Documentation] 2020.02.6 requires GNU find utils
+	#14796: 64 bit time and seccomp conflict (OpenSSH server crash)
+	#14951: boost compile error when running make silently
+
 2022.02.5, released August 31st, 2022
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 51de2066d7..93125e16a6 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.02.5
+export BR2_VERSION := 2022.02.6
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1661977000
+BR2_VERSION_EPOCH = 1664739000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index cf6192a9d6..8ff587100c 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.02.5'
+RELEASE='2022.02.6'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
