Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF819C4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 07:33:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67EBE6101E
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 07:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67EBE6101E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2930A607D1;
	Tue, 10 Aug 2021 07:33:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rzXWeemlMBw8; Tue, 10 Aug 2021 07:33:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FF8160818;
	Tue, 10 Aug 2021 07:33:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3845F1BF30B
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 07:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 258A840201
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 07:33:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Mtq0Dw0ywmr for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 07:33:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B37A0403B1
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 07:33:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E2C148D3A9; Tue, 10 Aug 2021 07:33:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Aug 2021 09:32:54 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 04ce5e9d35deaa04ecd4667c17044a8a20cf1e11
X-Git-Newrev: d5127a4de714d6608e897b4585e5ab5d3d5bd965
X-Patchwork-Hint: ignore
Message-Id: <20210810073313.E2C148D3A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] Update for 2021.05.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5127a4de714d6608e897b4585e5ab5d3d5bd965
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 52 ++++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index c7ae5fbfc3..ebc454c9f1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,55 @@
+2021.05.1, released August 10, 2021
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
+	Updated/fixed packages: arm-trusted-firmware, apache, audit,
+	avahi, bind, binutils, bird, bluez5_utils, boinc, busybox,
+	chrony, clamav, connman, cryptsetup, dnsmasq, docker-cli,
+	docker-engine, dovecot, dovecot-pigeonhole, e2fsprogs, exiv2,
+	fail2ban, fb-test-app, feh, fetchmail, ffmpeg, flac, fluxbox,
+	gawk, gcc, gcr, gdb, gdk-pixbuf, gesftpserver, glibc, go,
+	gptfdisk, gqrx, granite, grub2, guile, hdparm, heirloom-mailx,
+	htop, ibrcommon, ibrdtn, ibrdtn-tools, ibrdtnd,
+	intel-microcode, iodine, irqbalance, keepalived, kexec-tools,
+	libass, libconfig, libcurl, libfreeimage, libfuse3, libgcrypt,
+	libgudev, libhtp, libinput, libjson, libgtk3, libkrb5,
+	libloki, libmodsecurity, libndp, libnetfilter-log,
+	libnfnetlink, libnice, libodb, libodb-boost, libodb-mysql,
+	libodb-pgsql, libpcap, libqmi, libqrtr-glib, libressl,
+	librsvg, libtasn1, libtirpc, libuci, libxmlrpc,
+	linux-firmware, linuxptp, lrzsz, lvm2, mariadb, mesa3d,
+	mbedtls, monit, mono, mosquitto, mpd, mpg123, mpv, nbd,
+	netsnmp, nettle, nmap, nodejs, ntp, openntpd, openpgm,
+	openswan, pango, pcre2, perl-crypt-openssl-rsa, php, pixman,
+	postgresql, proxychains-ng, putty, python,
+	python-dataproperty, python-django, python-pysftp,
+	python-urllib3, python3, qpdf, redis, ripgrep, rsync, ruby,
+	samba4, sane-backends, slirp, spice, squid, suricata, tcpdump,
+	tftpd, thrift, tor, tpm2-tools, trinity, uboot, uboot-tools,
+	uclibc, vlc, wireless-regdb, wireshark, wolfssl,
+	xapp_fonttosfnt, xlib_libX11, xlib_libxshmfence,
+	xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13586: grub failure with BR2_OPTIMIZE_3
+	#13661: host-python2 build fails on aarch64
+	#13836: package build failure when target install set to no..
+	#13846: BR2_PACKAGE_LVM2_STANDARD_INSTALL should be default to..
+
 2021.05, released June 6th, 2021
 
 	Various fixes.
diff --git a/Makefile b/Makefile
index 255d37e74f..259706719a 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.05
+export BR2_VERSION := 2021.05.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1623014000
+BR2_VERSION_EPOCH = 1628580000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 84803ed250..89726c5f8b 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.05'
+RELEASE='2021.05.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
