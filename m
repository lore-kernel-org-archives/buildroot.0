Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECC1C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:06:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD85F6056B
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD85F6056B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B5EB422A4;
	Wed,  4 Aug 2021 00:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnRVBr_UrwtK; Wed,  4 Aug 2021 00:06:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD20942381;
	Wed,  4 Aug 2021 00:06:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A98401BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28E45404F6
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0KuF_JNShmBg for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BCD74044C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8AB727FD63; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jul 2021 23:35:14 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 711a83624c8a80217dd0ce9328235120dc9d4be8
X-Git-Newrev: 705b5b3cd0e38a37672eac086ca555da2ec60baf
X-Patchwork-Hint: ignore
Message-Id: <20210803210959.8AB727FD63@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openocd: require wchar
 for the xds110 driver
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

commit: https://git.buildroot.net/buildroot/commit/?id=705b5b3cd0e38a37672eac086ca555da2ec60baf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The xds110 driver requires wchar, and is enabled by default. Make sure
to disable xds110 when wchar support is missing.

Fixes:
http://autobuild.buildroot.net/results/530bfe22ff509cf4ebfdf99a183312a1053f505f/
http://autobuild.buildroot.net/results/956538a0a6029137db19cce30dc340e2e30dd166/
http://autobuild.buildroot.net/results/ae7da2ce1389ece44a4ca65108fee02e318df7b3/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openocd/Config.in  | 13 +++++++++++++
 package/openocd/openocd.mk |  1 +
 2 files changed, 14 insertions(+)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index f2e79f29fe..b14f940b27 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -144,6 +144,15 @@ config BR2_PACKAGE_OPENOCD_ARMEW
 	  Enable building support for the Olimex ARM-JTAG-EW
 	  Programmer (default is auto)
 
+config BR2_PACKAGE_OPENOCD_XDS110
+	bool "TI XDS110 Debug Probe"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	select BR2_PACKAGE_LIBUSB
+	help
+	  Enable building support for the TI XDS110 Debug Probe.
+
 config BR2_PACKAGE_OPENOCD_PARPORT
 	bool "pc parallel port driver"
 	help
@@ -233,4 +242,8 @@ comment "many openocd adapters needs a toolchain w/ threads, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
+comment "xds110 adapter support needs toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 endif # BR2_PACKAGE_OPENOCD
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index b74426ff47..9f53ae3ee3 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -49,6 +49,7 @@ OPENOCD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_OPENOCD_VSLLINK),--enable-vsllink,--disable-vsllink) \
 	$(if $(BR2_PACKAGE_OPENOCD_USBPROG),--enable-usbprog,--disable-usbprog) \
 	$(if $(BR2_PACKAGE_OPENOCD_RLINK),--enable-rlink,--disable-rlink) \
+	$(if $(BR2_PACKAGE_OPENOCD_XDS110),--enable-xds110,--disable-xds110) \
 	$(if $(BR2_PACKAGE_OPENOCD_ARMEW),--enable-armjtagew,--disable-armjtagew) \
 	$(if $(BR2_PACKAGE_OPENOCD_CMSIS_DAP),--enable-cmsis-dap,--disable-cmsis-dap) \
 	$(if $(BR2_PACKAGE_OPENOCD_PARPORT),--enable-parport,--disable-parport) \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
