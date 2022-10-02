Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBC3C433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 21:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 343E240492;
	Sun,  2 Oct 2022 21:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 343E240492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b2JW2rwyDCH2; Sun,  2 Oct 2022 21:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24FAC40189;
	Sun,  2 Oct 2022 21:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24FAC40189
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26B681BF3E9
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 21:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00E53408AE
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 21:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00E53408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rUndpxRzy4lf for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 21:05:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE44A404F7
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 21:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE44A404F7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6BAE867B7; Sun,  2 Oct 2022 21:05:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 2 Oct 2022 23:03:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c57ee9d7cf81c1c1530e4ff00348d22fdbc473d4
X-Git-Newrev: 12c7b23b4a383fc26f671dad7e1a39310e143a09
X-Patchwork-Hint: ignore
Message-Id: <20221002210552.B6BAE867B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.02.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=12c7b23b4a383fc26f671dad7e1a39310e143a09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 374f83630bafe7371ecd751cf07e3e7c0ce1c71e)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/CHANGES b/CHANGES
index 3fc00b44d7..357375c2de 100644
--- a/CHANGES
+++ b/CHANGES
@@ -345,6 +345,54 @@
 	#14731: BR2_PACKAGE_IOSTAT
 	#14751: LVM2 Outdated Link
 
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
