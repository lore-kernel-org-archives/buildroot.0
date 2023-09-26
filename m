Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B101E7F130
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 21:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E03FE613AC;
	Tue, 26 Sep 2023 21:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E03FE613AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ikS8Aci-pRHa; Tue, 26 Sep 2023 21:40:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FB37613A9;
	Tue, 26 Sep 2023 21:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FB37613A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E7B101BF279
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 21:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C113882083
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 21:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C113882083
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ccY9k5qTxMud for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 21:40:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A202882072
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 21:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A202882072
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9067681D2A; Tue, 26 Sep 2023 21:40:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 23:37:00 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 763d1934598b581ebfdfa4039df3b2ce53ea0ca7
X-Git-Newrev: 70638523a704aca46313aba05b74783340b11b32
X-Patchwork-Hint: ignore
Message-Id: <20230926214006.9067681D2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] Update for 2023.05.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=70638523a704aca46313aba05b74783340b11b32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 29 +++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index fb52f9bd1a..bf9b57e21d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,32 @@
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
diff --git a/Makefile b/Makefile
index 2ea0467fc9..eedf4ea296 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.05.2
+export BR2_VERSION := 2023.05.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1693493000
+BR2_VERSION_EPOCH = 1695764000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 75aae858b7..0b26583ea9 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.05.2'
+RELEASE='2023.05.3'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
