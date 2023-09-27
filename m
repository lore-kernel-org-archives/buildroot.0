Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2661BE80A92
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 06:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A22328219E;
	Wed, 27 Sep 2023 06:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A22328219E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SUNB6hRJxvwD; Wed, 27 Sep 2023 06:21:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC41B81F4F;
	Wed, 27 Sep 2023 06:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC41B81F4F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56EB61BF335
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 06:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AC2661005
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 06:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AC2661005
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id khZi6BAljmut for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 06:20:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F23C60E53
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 06:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F23C60E53
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65C6C821BA; Wed, 27 Sep 2023 06:20:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 08:16:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a0dd63c824c1c8a104e09b4f773764daf5b3e3f
X-Git-Newrev: a0831dd5f5bb4bbbb72fd0b90964695cafc99da5
X-Patchwork-Hint: ignore
Message-Id: <20230927062059.65C6C821BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.05.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0831dd5f5bb4bbbb72fd0b90964695cafc99da5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 70638523a704aca46313aba05b74783340b11b32)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/CHANGES b/CHANGES
index 260e883973..4fc069a68d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -94,6 +94,35 @@
 
 	Removed packages: libasplib, ocf-linux, tovid
 
+2023.05.3, released September 26th, 2023
+
+	Important / security related fixes.
+
+	Defconfigs: PC x86-64 bios/efi: Needs libelf. Raspberrypi:
+	Also enable HDMI console when systemd is used.
+
+	Updated/fixed packages: agentpp, asterisk, at91dataflashboot,
+	aubio, berkeleydb, bind, bwm-ng, chocolate-doom, clamav,
+	compiler-rt, connman, cpio, cups, dav1d, diffutils, dracut,
+	dt, expect, fail2ban, fio, flite, freerdp, freeswitch,
+	fstrcmp, gcc, gdb, ghostscript, gmp, go, grub2, haproxy,
+	heirloom-mailx, hwloc, icu, intel-microcode, irssi, less,
+	libcoap, libcurl, libglib2, libiec61850, libjxl, libks,
+	libksba, libmodsecurity, libpjsip, libqb, libraw, libssh,
+	libtommath, lldpd, log4cxx, lsof, mdadm, mosquitto, mpd, mpv,
+	mutt, mv-ddr-marvell, ne10, netatalk, network-manager,
+	nftables, nodejs, ntpsec, nut, openblas, openjdk, openjdk-bin,
+	opensc, openssh, pcm-tools, perftest, petitboot, php, pixman,
+	poppler, postgresql, python-django, python-ipython,
+	python-pip, python-pylibfdt, python-tornado, python3, qt5,
+	ramspeed, rtl8189fs, rtl8812au-aircrack-ng, samba4, screen,
+	screenfetch, sngrep, sofia-sip, stellarium, stress-ng,
+	strongswan, sysstat, tar, tcl, uboot, uclibc, vim, webkitgtk,
+	webp, wireshark, xfsprogs, xserver_xorg-server, xterm, yajl,
+	zbar, zxing-cpp
+
+	New packages: xlib_libXpresent
+
 2023.05.2, released August 31th, 2023
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
