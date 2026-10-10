Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE52ACA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 05:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E63081471;
	Sat, 10 Oct 2026 05:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 62WW8rpdyUjA; Sat, 10 Oct 2026 05:40:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 457AE8140A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791610800;
	b=J1Wdql8l1ZFt4hAx4LM1xeeDYsMnpSLGJp9gG+DjbtjnC773sCAlEPSCTNfxhnG+TwbP
	 F05SsA6tMSeGSkXLotDVFQSpmprnwnMBq7JU93OY/RgaYfe1M2auJOA1GQysETX7klJaE
	 3GpaImaZpmso1vgbvf9NfaDEhw0Hc8k5Y7EoL2z//t5OcNQbMajWtnsJ6Kba+a30EIH86
	 Quz0SCfyXCLC1Wno/1ZGLNWG+pDnntTSWnKRaYjmNiWm5XS3X+wyepn30sbsYrjKiX7Cx
	 6X2dc9SLeTcGQ4cAexmIwcSJE8pRgLKdMgLc8paQt6OqKHyQepKzmhe+1jVKayAp1FQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791610800;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eJ28N0zTP3sQHEdzSaKtR8yyiYYf0FS36LprWPheumo=;
	b=XTJnc47ux0vviU2ROsxHSo6FQwI3404s2Hb3vktUNIffFaIVzl+pStLlA2UPtnQhIESR
	 D9l2DHgemGqzBCwKQn9Bt82vud/h9v/GsrkkXFpAGyoFJTB8Reu4vHBg3teb2sZrorwbS
	 cB/SVCqa4zxcJnJpI5wSta4NgAm862AH/amoA+8G2kCX1ZNQaVaMC5BXLyB749fofYPVe
	 boQnXZTCbiddl1SVsXv7EWpPs1HUSff2h4tP9wKDmiCqHN3LK+PTKuBybRycZim6T+kjW
	 ZZEkTpNixXukM9C79dNVI05KY0M0LD0eu+o8zMSOMUv/etRTmGhqDX3fxkJXVI5ysGg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791610800;
	bh=eJ28N0zTP3sQHEdzSaKtR8yyiYYf0FS36LprWPheumo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m+k7Yr0Y4yTwc4ty+Yt4aPJvvv7aX4Nmv4/03CP8UbxSky1+pgHv1G3aB3DLm4kpY
	 ZQLkIuxtncDzwng3uz6et0Oq5OlA1sBqWQ9x5U63taSKZ7W+/eSOEyxQb3qgVYLRzF
	 auayun7jJcTll+8O0OhxHE7Ud7sP91vP6iJIBjqYlktXHKd8Hl0ZAqIcNBCkDCXVa7
	 1RY30sD1OudJ2rnvUpMT6ykSUNQV9yhv6PdQCCkdsmGNONEMVNKwn5yKMbwFhIlDei
	 H1o8SdZbc3cppmezNoJN8heXcdwmrbEVPmXYWUuV33TRnzwQTUL83+DF6jj09FD9Ws
	 GBcsRUhEltyLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 457AE8140A;
	Sat, 10 Oct 2026 05:40:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87321A64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C22C400CC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7-u-tyVZDgl for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 05:39:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org ADA5D40004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791610796;
 b=anWAUfxb3/dyZZxwF5RqhY43oKdc+5OoC4tGsPLqXVzju99B9afK69+NyV5XubpiL3Ve
 5y+1A/Lh3ofu4MaIehbetCFWbBtuwVekNKs+E/F2qrJNsmghZoyaCZpr0EEiaUDGppEbg
 jvI3K4omzIyo6iZaqOoNuVqUn4oRGfXGSUm+BckUaCjYJG9buWHOErP6yzTUDJpMcqh/j
 qCjv9BwQC+Z6/539vf0xQnKayPrL0Q3Zj1mwbpdpk3DSBns9j58MVxqpJNGpWRrODrpuL
 rBPoTzuTcTFanKOLT/WQdGGv6BuXZHLjb8OWE/WvBmSPXLYvInE7n7XIWlDoGKETHrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791610796;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=A/dCfe3C7RDJYpTQk0VeNf3rtCSmMUfOdRfTEsZNMIU=;
 b=rZh8teTSmvWb+jFevMre8GJyjNI/9d3fFTVHEbUw2c7iZuCS053nGgoMUDZbOlwiVe1C
 la4Fzlv6FctOTCnSht3qvd+xUHnvaTJkvH1n3RZRqI903ur/VU7DydMqefXEAU1B+2pbe
 4cKmX1txGTdAWW2vcTSjaqlgHN9ONWKPkiPb7yG7UwCIaLPVY8aulaKIAjYXzwmFBe5Pu
 mX5eWb1dxpiZNlSMr5S7poQ/qRoPcsVd+IIJKNwtYxIjG/n3ZB2T+3XRI25S1g81aU3RD
 Y8WAnUNC20aCArWlutk6PHzabujCI5HO9V+9nEUffKN1I2bEtuqvugV2Z/3ip546mvw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADA5D40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:39:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A51098E492; Sat, 10 Oct 2026 05:38:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 07:38:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a19c9e6c44e65eae6f669f9632f993fff8669a44
X-Git-Newrev: 7396b459ad58cd62405b0b2e114e203c86e4c58b
X-Patchwork-Hint: ignore
Message-Id: <20261010053838.A51098E492@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libusb-compat: add option to
 build/install examples
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7396b459ad58cd62405b0b2e114e203c86e4c58b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The examples are not installed by upstream, and their names conflict
with other packages (lsusb from busybox/usbutils, testlibusb from the
libusb examples), so install them in /usr/libexec/libusb-compat/examples.

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libusb-compat/Config.in        | 11 +++++++++++
 package/libusb-compat/libusb-compat.mk | 14 ++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/package/libusb-compat/Config.in b/package/libusb-compat/Config.in
index 076d7b8d77..5efa9bbe3d 100644
--- a/package/libusb-compat/Config.in
+++ b/package/libusb-compat/Config.in
@@ -5,3 +5,14 @@ config BR2_PACKAGE_LIBUSB_COMPAT
 	  libusb-0.1 compatibility layer for libusb-1.0.
 
 	  http://libusb.info/
+
+if BR2_PACKAGE_LIBUSB_COMPAT
+
+config BR2_PACKAGE_LIBUSB_COMPAT_EXAMPLES
+	bool "build libusb-compat examples"
+	help
+	  Build and install the libusb-compat example programs (lsusb,
+	  testlibusb and hotplug_monitor) in
+	  /usr/libexec/libusb-compat/examples.
+
+endif
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 4e78a213b7..c8dabe2068 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -20,5 +20,19 @@ LIBUSB_COMPAT_CONF_ENV += \
 			   |sed -r -e '/\(SONAME\)/!d; s/.*\[(.+)\]$$/\1/'`
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT_EXAMPLES),y)
+LIBUSB_COMPAT_CONF_OPTS += --enable-examples-build
+# Examples are not installed by upstream, and their names conflict
+# with other packages (e.g. lsusb, testlibusb), so install them in a
+# package-specific directory.
+define LIBUSB_COMPAT_INSTALL_TARGET_EXAMPLES
+	$(foreach example,lsusb testlibusb hotplug_monitor,
+		$(INSTALL) -D -m0755 $(@D)/examples/$(example) \
+			$(TARGET_DIR)/usr/libexec/libusb-compat/examples/$(example)
+	)
+endef
+LIBUSB_COMPAT_POST_INSTALL_TARGET_HOOKS += LIBUSB_COMPAT_INSTALL_TARGET_EXAMPLES
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
