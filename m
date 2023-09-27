Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4E4E810D5
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 11:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D16861407;
	Wed, 27 Sep 2023 11:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D16861407
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ecr-EI2HSchL; Wed, 27 Sep 2023 11:53:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 911D060BA2;
	Wed, 27 Sep 2023 11:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 911D060BA2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AEF4D1BF2BE
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 11:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9481A410B7
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 11:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9481A410B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TExGGqzovmq3 for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 11:53:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77EAD40980
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 11:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77EAD40980
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E88E8229C; Wed, 27 Sep 2023 11:53:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 13:52:12 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7156bc753e43860c1949483504d611c7cdec5b01
X-Git-Newrev: df2c4a2301636a3818f36f37f7361ec89b38f36d
X-Patchwork-Hint: ignore
Message-Id: <20230927115320.5E88E8229C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] Update for 2023.02.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=df2c4a2301636a3818f36f37f7361ec89b38f36d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 30 ++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index abf5b4bd7c..c6ccc09e3f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,33 @@
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
diff --git a/Makefile b/Makefile
index 42bb7a7b1f..a7b7729946 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.02.4
+export BR2_VERSION := 2023.02.5
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1693507700
+BR2_VERSION_EPOCH = 1695815000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 29f1e8223d..ae060e4425 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.02.4'
+RELEASE='2023.02.5'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
