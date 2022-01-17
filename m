Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C98FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 08:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AA47607F9;
	Mon, 17 Jan 2022 08:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wiZww76U2hgf; Mon, 17 Jan 2022 08:06:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4030060ACD;
	Mon, 17 Jan 2022 08:06:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E24DF1BF2C0
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 08:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCC2F40360
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 08:06:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9_omBpWi6Evk for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 08:06:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D7FE401A2
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 08:06:28 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id m3so40452026lfu.0
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 00:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RaEtS2AkBzxNlsgYYD5qSoEqTn52qp+Thz3HP050g1c=;
 b=DI8WCEoFqE1silK75d+Kz1OxOuNNfW/hMYyFz8SA6kpk+V3Hdx8QVLSHO5qd6KPnBE
 78nJA+r/Vz+cKOLTxFlC9vW6m5+M0O4QlR9xo+GvatET/f3R+zmjFB7lJcPqhOPWzSO1
 ebYW3UA8CYxmStCjTR6S8XdqxHK3Z3P9Ca9S8AJHze7xjz6ZgRVtYYSyVM5a/SgvG4gU
 2cRCrZe4XukWxPJpgityRBSHh6fbh8Xuv9eDPETS1UyNOVQgo/ze5m26QT1HrdFN+N2N
 d2zY+DaVX8nWqmTtsl916T796yct9FG08oMGYSg7DzSVxG/C8cSXcYlu8OCsN1z+xjoH
 C9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RaEtS2AkBzxNlsgYYD5qSoEqTn52qp+Thz3HP050g1c=;
 b=FK2n3NWK8rRE0wu87gxOJGFJwwQGoRiFy6Vx+HPnQaMqIHNmMyMvJabAduosWzSijn
 miqCEdwBGODmfaYmh/fgodi8cDeNuu26Uu1SKXaBej2GxxgU7RwTLm4suiRfo1qF/xi2
 DoFk1Hjj+5TL6g7m+Uju0yDPjZ1cLfMDPlMzktHm5+K3klS2kWhD+SQxPkjUyrLrqsmF
 o4nH3i+XldCNBaWBQ7CREjNIMcV6xEgi/0gP7Pq2VBsLaOpHtlX0NbUcZBYteTbekAz/
 /fmwRc7dsPiSGBPP49PAUei9ujBKapzdOSVX7sMtj/yBp9F2kMLMYp99B1ZVrVxkubcD
 7B3Q==
X-Gm-Message-State: AOAM533WmxAzk7CgejYKQN3FIMC2/0YtsuPf791bGXEI2HlcbgldX1lh
 zEFR+ZwNPJK7URZ7RFGwnIWS0MCBpfaGbA==
X-Google-Smtp-Source: ABdhPJzbu4gtuRVYHJ+EQWkVn2UHY792qeC1HiP2Pkzre43TMXqfRPDdyNInqKwBlhaKQdGVMaFcVA==
X-Received: by 2002:a05:6512:6c5:: with SMTP id
 u5mr4032991lff.322.1642406786282; 
 Mon, 17 Jan 2022 00:06:26 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id w28sm1316654lfu.115.2022.01.17.00.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 00:06:25 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jan 2022 09:06:17 +0100
Message-Id: <20220117080616.10563-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220117080616.10563-1-heiko.thiery@gmail.com>
References: <20220117080616.10563-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] configs/kontron_pitx_imx8m_defconfig: bump
 kernel to 5.16.1
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 configs/kontron_pitx_imx8m_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/kontron_pitx_imx8m_defconfig b/configs/kontron_pitx_imx8m_defconfig
index 458083160b..7f9c0eeae8 100644
--- a/configs/kontron_pitx_imx8m_defconfig
+++ b/configs/kontron_pitx_imx8m_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/pitx-imx8mq.dtb"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.1"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-kontron-pitx-imx8m"
@@ -19,7 +19,7 @@ BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
 
 BR2_PACKAGE_FREESCALE_IMX=y
 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
