Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0469CC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:07:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98D5860FDC
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98D5860FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63E4682C3B;
	Thu, 26 Aug 2021 22:07:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZvFXurV5HsL4; Thu, 26 Aug 2021 22:07:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E30D682C5E;
	Thu, 26 Aug 2021 22:07:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F3A71C1148
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F12682D12
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TRdlHVBIAu0d for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5848982BC8
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AD4FD8DC50; Thu, 26 Aug 2021 22:01:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Aug 2021 10:33:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ef377fca04051eb46f63080201fdfc14c60c9bab
X-Git-Newrev: 817148b8191b6e7536c945128d7b86ae97eee8ba
X-Patchwork-Hint: ignore
Message-Id: <20210826220128.AD4FD8DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Update for 2021.02.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=817148b8191b6e7536c945128d7b86ae97eee8ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 004a792dcf10e6c474070c9571f7504411e786cc)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/CHANGES b/CHANGES
index 5dab63c755..568fe37552 100644
--- a/CHANGES
+++ b/CHANGES
@@ -253,6 +253,57 @@
 	#13751: libopenssl (static): huge drop in performance in newer ..
 	#13771: package htop has undeclared dependency on host python
 
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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
