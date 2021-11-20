Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71644C433EF
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 22:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCD614036F;
	Sat, 20 Nov 2021 22:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lGzFD_9fmAPR; Sat, 20 Nov 2021 22:59:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE0AF40361;
	Sat, 20 Nov 2021 22:59:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12CB31BF362
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 22:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02BB081819
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 22:59:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yLwZRXXHH3Vd for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 22:59:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E27F80DB8
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 22:59:09 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id n12so61354801lfe.1
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 14:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cGPk1Xl/DTqCgG7kld8p3/j3/I0CIo2mErdMPfrxPIs=;
 b=lhQbNU3plW3Zt6X4fukkncZKQGYJl8xeJrX5zitK3UYVbG5iTrXQpt5JMy5kdRGfPX
 1P5V4qdVItslX1FTIfseI0kr702EhHsIhMLAIZi4OgHHyawGHjjP+5mFg8Kt+mmEMtfC
 zuXsx8HXaETRrpVX8s5yiqlcVtU/BVKKhwRJf/ljThJhjbJALR6UHzi1XwKjGTS8iDmK
 VJH+VM/P6m0sLlznubecUSML4KJ9ot+vEDNbJKHn2ktcMTOLx6TgWbi82zEMw6NLIq0z
 KdnxFVz78+Ns3UyKH8gO6MNkRBdwk8Ubby6+GZGTM5zMKVo6CZ2cbHyTHiyPHZGIY1Wj
 NeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cGPk1Xl/DTqCgG7kld8p3/j3/I0CIo2mErdMPfrxPIs=;
 b=1Ik2q1X0FKe7P13u0B4Xn0NRmNFOjWbd2iNtlMcAMEkxgJcs1JU/TIpn200UzrUWVB
 dwQ2FSXTfJ+qSnLsnzzgIQB/4kfbQXujlZgc6URVGNYGT3rGOZiZCwkUuaK2uIFbZtzp
 bEHbAkWbK2iSta30tAjirMneZN3EvVkcVYr/jwuZPdJt5xfsD4L+2NMtpBIHiu49PTUi
 Xm5AW7oKsonOqS1RuQNFv1uCOlNB2TrUET1D/cZHk5AzDUrp/IujEgInxBFt49Y866Fk
 3O4p3mhn5QT8iaD+jHi4XrPxKwkRPSisMz1Vul3om/20mefSxm9XerYwnLadr5L/jdiA
 D+1g==
X-Gm-Message-State: AOAM533o+VOhIMWRtGw5PW47lcLqV5f8DnkSmOB/fVwFaBNWpWv/9TrU
 snoHU9HI8e3acCTeCjV8IRguUGYVpzEYAA==
X-Google-Smtp-Source: ABdhPJx0CrEESMjRayZ8zEKo44VjCFlOLdvw1Ej4dEPitqF1W8UtjHkkMLqbxo+K5TcZVwbdG8ObXQ==
X-Received: by 2002:ac2:4c4d:: with SMTP id o13mr43590161lfk.196.1637449147026; 
 Sat, 20 Nov 2021 14:59:07 -0800 (PST)
Received: from hellfire.local ([178.155.5.87])
 by smtp.gmail.com with ESMTPSA id x12sm344360ljc.121.2021.11.20.14.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Nov 2021 14:59:06 -0800 (PST)
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 01:59:03 +0300
Message-Id: <20211120225903.28937-1-kuzminov.sergey81@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] ARM: dts: orange-pi-zero: enable uart
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable uart1 and uart2 on orange-pi-zero board.

Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
---
 ...4-ARM-dts-orange-pi-zero-enable-uart.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch

diff --git a/board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch b/board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch
new file mode 100644
index 0000000000..839bc16087
--- /dev/null
+++ b/board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch
@@ -0,0 +1,35 @@
+From e8768cc1f0f1231cbd4864417de629330e21222d Mon Sep 17 00:00:00 2001
+From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
+Date: Sun, 21 Nov 2021 00:58:32 +0300
+Subject: [PATCH] ARM: dts: orange-pi-zero: enable uart
+
+Enable uart1 and uart2 on orange-pi-zero board.
+
+Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
+---
+ arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+index f19ed981da9d..03acf166ab70 100644
+--- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
++++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+@@ -184,13 +184,13 @@ &uart0 {
+ &uart1 {
+ 	pinctrl-names = "default";
+ 	pinctrl-0 = <&uart1_pins>;
+-	status = "disabled";
++	status = "okay";
+ };
+ 
+ &uart2 {
+ 	pinctrl-names = "default";
+ 	pinctrl-0 = <&uart2_pins>;
+-	status = "disabled";
++	status = "okay";
+ };
+ 
+ &usb_otg {
+-- 
+2.32.0
+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
