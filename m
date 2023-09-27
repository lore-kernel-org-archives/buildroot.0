Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F114EE82CB7
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 17:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6C5741BB5;
	Wed, 27 Sep 2023 17:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6C5741BB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vrjP5vlx1apY; Wed, 27 Sep 2023 17:36:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77C2141BBA;
	Wed, 27 Sep 2023 17:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77C2141BBA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC2A51BF286
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 17:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C099C42C8C
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 17:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C099C42C8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B1iFJ59Splp0 for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 17:36:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D408F42C6E
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 17:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D408F42C6E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B10D682542; Wed, 27 Sep 2023 17:36:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 19:32:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de48ecb83d2e69ea2a191a70fd353c93844a7382
X-Git-Newrev: 8ea74a5b49375d6a661338e5e20ac1bb7f3d392c
X-Patchwork-Hint: ignore
Message-Id: <20230927173605.B10D682542@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.02.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ea74a5b49375d6a661338e5e20ac1bb7f3d392c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit df2c4a2301636a3818f36f37f7361ec89b38f36d)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/CHANGES b/CHANGES
index 4fc069a68d..2d18c32f24 100644
--- a/CHANGES
+++ b/CHANGES
@@ -260,6 +260,36 @@
 	#15376: Libiconv config
 	#15461: QtVirtualKeyboard segfaults
 
+2023.02.5, released September 27th, 2023
+
+	Important / security related fixes.
+
+	Updated/fixed packages: agentpp, asterisk, at91dataflashboot,
+	aubio, berkeleydb, bind, bwm-ng, chocolate-doom, clamav,
+	compiler-rt, connman, cups, dav1d, diffutils, dracut, dt,
+	expect, fail2ban, fio, flite, freerdp, freeswitch, fstrcmp,
+	gcc, gdb, ghostscript, gmp, go, grub2, haproxy,
+	heirloom-mailx, hwloc, icu, intel-microcode, irssi, libcoap,
+	libcurl, libiec61850, libjxl, libks, libksba, libmodsecurity,
+	libpjsip, libqb, libraw, libssh, libtommath, less, lldpd,
+	log4cxx, lsof, mdadm, mosquitto, mpd, mutt, mv-ddr-marvell,
+	ne10, netatalk, network-manager, nftables, nodejs, ntpsec,
+	nut, openblas, openjdk, openjdk-bin, opensc, openssh,
+	pcm-tools, perftest, php, pixman, poppler, postgresql, pppd,
+	python-django, python-ipython, python-pip, python-pylibfdt,
+	python-tornado, python3, qt5, ramspeed, rtl8189fs, samba4,
+	screen, screenfetch, sngrep, sofia-sip, stellarium,
+	strongswan, sysstat, tar, tcl, uboot, uclibc, vim, webkitgtk,
+	webp, wireshark, xfsprogs, xserver_xorg-server, xterm, yajl,
+	zbar, zxing-cpp
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14366: Nodejs fails with "version `GLIBC_2.34' not found"..
+	#15754: The docker-engine and docker-cli versions are not...
+	#15787: atmel_sama5d3_xplained_mmc_defconfig: Missing...
+	#15790: at91sam9x5ek_dev_defconfig: Missing...
+
 2023.02.4, released August 31th, 2023
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
