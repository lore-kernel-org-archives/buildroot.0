Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88885C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:23:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CC6060FD9
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CC6060FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 083D8407A1;
	Thu, 26 Aug 2021 22:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Sc7wrzXTwTc; Thu, 26 Aug 2021 22:22:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7601407A6;
	Thu, 26 Aug 2021 22:22:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F61F1BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA4474077B
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S3VClsZTxzLW for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39E9A4079A
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8E3558DC52; Thu, 26 Aug 2021 22:01:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Aug 2021 09:48:00 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 73e570a290374602814d53f8d3b2ca21079ad71a
X-Git-Newrev: 5284a826aee8a908f4df63640605c0246942b6b0
X-Patchwork-Hint: ignore
Message-Id: <20210826220128.8E3558DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Update for 2021.05.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=5284a826aee8a908f4df63640605c0246942b6b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d5127a4de714d6608e897b4585e5ab5d3d5bd965)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 52 ++++++++++++++++++++++++++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index cb35b7b255..5dab63c755 100644
--- a/CHANGES
+++ b/CHANGES
@@ -55,6 +55,58 @@
 	#13846: BR2_PACKAGE_LVM2_STANDARD_INSTALL should be default to
 	        y as before
 
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
