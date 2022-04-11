Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA8FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 09:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2D2882FF9;
	Mon, 11 Apr 2022 09:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3iHHeV2Nzwu; Mon, 11 Apr 2022 09:07:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2C5082BBC;
	Mon, 11 Apr 2022 09:07:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA32F1BF44A
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 09:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A257F60AB5
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 09:07:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VnC4DmehPc6u for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 09:07:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A0A6607F9
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 09:07:34 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id t11so2466425eju.13
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 02:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=1+uMKFPzLpJaPaeJy6o3cdXfd7Bvav2p5SWuVj/XHds=;
 b=Inj2eQi7T/xCCE71nZ1PWLx9+9t1quwlSoga3awou/AjJ4CzCZ+sxaRrt0LiwwqDKy
 L9W/TM56hZ/M0sAWStSWhJ4S87FSRlS6xKng86XIgkxUy/BzkvYdqChGitskZ327KjCw
 huBlS2h8EJKidqYBqpB4kO3J257IdC8jSYyySNT015g8GT7vuZgMd4rYiiEo6xAROd4y
 KTdD3ScTsZsU6afbhyhLLDuHtEegPA+K8xkoDOoCXs8OX4UMg3ZhMJ9CV32txWvs9HqQ
 qmEcNqEZUUU2GFggYhVVYbBwmW1ZE7NRrV0OfHrNNO5YBjxO5munSk3wWL1qGXy2FOB2
 1/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1+uMKFPzLpJaPaeJy6o3cdXfd7Bvav2p5SWuVj/XHds=;
 b=i9uedMEjraPAvoO5VjtDgG6k2RDSGNGMCufhLqj92ZZ7mq8snSPt3x4flbwFZybUyX
 +IESQhqn0g6RzizjpMz+H2L+WbzMQw7qAN/9FPws+tT3njUC5yDgPhs978OcEjAeZZeo
 88eJ/SfKjlDiaQwBigjOqRmK1Tay4NnJTee+xoK2Bbx7p5vwm0CBwZrvUcqtdQ25U/6u
 goSe6RhDV2wNM/9LOc62zn7Xs6FrYJoz4RJV501Svt13T+qm/H/nNgVod93Lup5Yzb1e
 wTx1o7XE6uX7HjuQnnT7UKTHmm1waD0GKCcMNAK19cT7LoqjftBRuMAkOuX7ZkUGIn5l
 rbYA==
X-Gm-Message-State: AOAM53338vIzDDGu2Mnan32W0uCiR87X7QEzfw4SOg7d5NDuI6dCBxzC
 a7i6z/YLQZxFsihkskF8PCbhNYObTFQ=
X-Google-Smtp-Source: ABdhPJwjp+v8R8/CYizWlmsLSJMkmAJJ9yvQioMa3jJ826gyUIWRrjoY9WkhUDFfBsYFnPHxyrrBCg==
X-Received: by 2002:a17:907:6d94:b0:6e7:fe12:6e9a with SMTP id
 sb20-20020a1709076d9400b006e7fe126e9amr29230345ejc.584.1649668052260; 
 Mon, 11 Apr 2022 02:07:32 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 t1-20020a170906178100b006e7edb2c0bdsm9096609eje.15.2022.04.11.02.07.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Apr 2022 02:07:31 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 11:07:23 +0200
Message-Id: <20220411090723.13504-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Subject: [Buildroot] [PATCH] package/wpa_supplicant: enable libnl for the
 WIRED driver
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Matt Weber <matthew.weber@collins.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

BR2_PACKAGE_WPA_SUPPLICANT_WIRED also enables the MACSEC_LINUX
driver. This driver requires libnl.

Also fix CONFIG_DRIVER_MACSEC option to enable only the generic
Linux driver and not QCA extensions.

Fixes:
http://autobuild.buildroot.net/results/2dea7dee521794b306cc610601fda322987e6cd0

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/wpa_supplicant/Config.in         |  2 ++
 package/wpa_supplicant/wpa_supplicant.mk | 11 +++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 8f095cdf2d..0094531548 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -41,6 +41,8 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WEXT
 
 config BR2_PACKAGE_WPA_SUPPLICANT_WIRED
 	bool "Enable wired support"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_WPA_SUPPLICANT_EAP
 	help
 	  Include the "wired" driver, so the internal IEEE 802.1x
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index a2ca8a0b30..ac66d1f7e0 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -63,11 +63,18 @@ WPA_SUPPLICANT_CONFIG_DISABLE += \
 	CONFIG_FILS
 endif
 
-ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WIRED),)
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WIRED),y)
+WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf libnl
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_LIBNL32
+WPA_SUPPLICANT_CONFIG_ENABLE += \
+	CONFIG_DRIVER_WIRED \
+	CONFIG_MACSEC \
+	CONFIG_DRIVER_MACSEC_LINUX
+else
 WPA_SUPPLICANT_CONFIG_DISABLE += \
 	CONFIG_DRIVER_WIRED \
 	CONFIG_MACSEC \
-	CONFIG_DRIVER_MACSEC
+	CONFIG_DRIVER_MACSEC_LINUX
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT),)
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
