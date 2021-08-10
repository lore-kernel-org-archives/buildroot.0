Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45993C4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 20:33:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAC4160F55
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 20:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAC4160F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63B5483466;
	Tue, 10 Aug 2021 20:33:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j7RU1bzdanQd; Tue, 10 Aug 2021 20:33:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFE118348C;
	Tue, 10 Aug 2021 20:33:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01FBF1BF3D4
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 20:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDDBC8348C
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 20:33:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W_6Xam_JPFY6 for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 20:33:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F20283466
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 20:33:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8B5E9853F9; Tue, 10 Aug 2021 20:32:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Aug 2021 22:32:54 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 84c010f4688d74edc010d40ad76bf0f91e2bf6a0
X-Git-Newrev: 004a792dcf10e6c474070c9571f7504411e786cc
X-Patchwork-Hint: ignore
Message-Id: <20210810203246.8B5E9853F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] Update for 2021.02.4
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=004a792dcf10e6c474070c9571f7504411e786cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 51 ++++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 80c0125b80..a692ed7baa 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,54 @@
+2021.02.4, released August 10th, 2021
+
+	Important / security related fixes.
+
+	Toolchain: Disable PIC/PIE for Microblaze (like for NIOS II)
+	as it is not currently working.
+
+	binutils: fix linker assert failure on OpenRisc, or1k build
+	issue with gcc < 5
+
+	gdb: Enable on NIOS II
+
+	utils/scanpypi: Various improvements
+
+	Defconfigs: stm32f469_disco: Fix kernel boot issue, Microchip
+	sam9x60ek mmc_dev: Add missing toolchain/system options
+
+	Updated/fixed packages: apache, arm-trusted-firmware, audit,
+	avahi, bind, binutils, bird, bluez5_utils, boinc, busybox,
+	chrony, clamav, cryptsetup, cwiid, dnsmasq, docker-cli,
+	docker-engine, dovecot, dovecot-pigeonhole, e2fsprogs, exiv2,
+	fail2ban, fb-test-app, feh, fetchmail, flac, fluxbox, gawk,
+	gcc, gcr, gdb, gdk-pixbuf, gesftpserver, glibc, go, gptfdisk,
+	granite, grub2, gqrx, guile, hdparm, heirloom-mailx,
+	ibrcommon, ibrdtn, ibrdtn-tools, ibrdtnd, intel-microcode,
+	iodine, irqbalance, keepalived, libass, libconfig, libcurl,
+	libfreeimage, libfuse3, libgcrypt, libgtk3, libgudev, libhtp,
+	libjson, libkrb5, libloki, libmodsecurity, libndp,
+	libnetfilter-log, libnfnetlink, libnice, libodb, libodb-boost,
+	libodb-mysql, libodb-pgsql, libpcap, libqmi, libressl,
+	librsvg, libtasn1, libtirpc, libuci, libxmlrpc,
+	linux-firmware, linuxptp, lrzsz, ltp-testsuite, lvm2, mariadb,
+	mbedtls, monit, mono, mosquitto, mpd, mpg123, mpv, nbd, neard,
+	netsnmp, nettle, nginx-modsecurity, nmap, nodejs, ntp,
+	openntpd, openpgm, openswan, pango, pcre2,
+	perl-crypt-openssl-rsa, php, pixman, polkit, postgresql,
+	proxychains-ng, putty, python, python-django,
+	python-dataproperty, python-pysftp, python-urllib3, python3,
+	qpdf, redis, ripgrep, ruby, samba4, spice, slirp, suricata,
+	sysdig, tcpdump, tftpd, thrift, tor, tpm2-tools, trinity,
+	uboot, uboot-tools, uclibc, util-linux, vlc, wireless-regdb,
+	wireshark, wolfssl, xapp_fonttosfnt, xlib_libX11,
+	xlib_libxshmfence, xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13586: grub failure with BR2_OPTIMIZE_3
+	#13661: host-python2 build fails on aarch64
+	#13836: package build failure when target install set to no..
+	#13846: BR2_PACKAGE_LVM2_STANDARD_INSTALL should be default to..
+
 2021.02.3, released June 12th, 2021
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 22bf04a056..c6be0ca7df 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.02.3
+export BR2_VERSION := 2021.02.4
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1623509900
+BR2_VERSION_EPOCH = 1628627000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 303e266c68..f0d1e78891 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.02.3'
+RELEASE='2021.02.4'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
