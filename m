Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B659606A334
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XZQ6KKB1;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=fpHWgNuX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14E03607E9;
	Tue, 27 Oct 2026 16:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5HXf5uREw-9Z; Tue, 27 Oct 2026 16:40:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3B2FC606CB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793119237;
	b=NUIVGbRA26xQXqvG6xgQLMCcyfJCWNlUdIYeHhIW4dFmIhz4B88QLTGWWkZ3RH2Nw59R
	 A5TEAFj291Dmb93z7OYLLq6RH/qhQuXYSZR22nicDb3hNyvsma0RLLPUauX5CLs8YL+VP
	 k7F2c+G4iP6pb+FZcunbS8NeK3VrJ7QrHpm9Qwu4rPAqEXXOLoePdiRqbmn575UtyLeCZ
	 dCfAq4n/sEozJ01tVg4d2iAkVuJ9x8zrg0qZn4Tz6bZiJhRLNO4Xv4WunNj5e9FWQcPNV
	 B5HRSWB6IIFuLTu72C8Jwq4E4WAQm48X+xRyNhwxuCgXen8z2avyP8zcghZSL/CmpKQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793119237;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=1y8IcT+l3+wrN0ZVBTFkGSMDHIWeDDJwUangLP2mUCo=;
	b=BAGRtwN7oEgOXiFV/jaUdkLfNX2yYkvMZxbcDgHWSoS1dCc4+x+cPuO5c0DzkdHhsEW/
	 cl7l/TYR8hG45g29rgC0nmzmdoeo1UVuqRFD3xUv8VGi2kIAV0AWMLRZ8JsqNh4kU1MIm
	 rRaWB5lniBl4I2dl63X0vqPhjssWgiz2qll6yV3jmk0UVm2xvChQFO+Y6OaEA58ms8LbX
	 bgPFUNh/1JUvlufCuUVOPq8YZ5OZEaimWu5N5Zd46zP7QvPwY9334GNPG0dmTCRSAuftF
	 hgiFHqIAukIpp2UEWpePglmnMA3yICVrTW1leT/lRPFlkN9naCKulRrmoi3XOGlEOMg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793119237;
	bh=1y8IcT+l3+wrN0ZVBTFkGSMDHIWeDDJwUangLP2mUCo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XZQ6KKB1drFWfinU9bSYvuJAggGE/dBo/2eLLNgwWPkZSMjDmtPLvBRRdWsMPecmD
	 JoimVe4mUL5qZrul/kATmSVUgMNWx1j2V7HDEi7RPpBmRPtl5kGr8DIFuN+11z8aJg
	 wAW/F3M9rEXcSpbwDRgcBv4OtDj4qjFVXqbfjX8ZFw3Gkb5xyeKZh2B8ZBQraTf8F2
	 CcIl55sIW/LK8PLalbcnnp+7YXt8NmlXCX8ChhM5MsGHzG7mLCPdAuLHCDR90QPEdq
	 VLSMGJIap3SdpYI1xc+7QGmr07Wq/CKhjuR2uyugDEzFqkG/7utKANg80vbMW4spMA
	 z+yDWwzKuegAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B2FC606CB;
	Tue, 27 Oct 2026 16:40:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6404F72
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5467880C23
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r48sWWvcD4iS for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:40:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6138D80CEC
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::630"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793119224;
 b=MAtQWIprqQiKdAUL9nJ11bblyOJDHLsv1E+DPGNqSwrzUepYQe+iB2vQc8DhC7hkpKNv
 33e3J0toAWlHTVp8BRCnBE4a0SkR2hREGfKx9XN7dGwgMCXYvVB96VAWuhmESPYA1FjNd
 6crzr1KWsgF7neG90uCHWohlc2JtGipLBA4TdLWhDgGuAnePCuJSuPJ7WGPxcyzBpa/HK
 LcfCupMMr6TTn3n6c7UvvR6tNWT3UhpEke1JwqHXrPDq6r5B0xpUhw47tM+JjwMHHyh8Z
 OWo5yK2fnxoLGDkrNPJeBnFAsA0a3DoIs/NTaLpF8wOLI6Rm13jhhgirxT+L3tfQxxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793119224;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=j7tt77Pl2EO+eK3hH0ynjStV+ilwTmmbgYU0X4RhaS4=;
 b=lj6TzMyBX2aesNB3a/OW244YCRpiDy+onFXlxn+R066yKdZcfrotOlwBoCO5XTmMPZAY
 Dn/xhKHP5/7nju0rOyk3MHABxzoZV9taAgzyL15Rmx3Lf8ED7qcB4qkFuoDrvN4gBcO/c
 VjdvAjJhDIT7ZSxBIdRw8Xn45uF1+X7NDA2aDtpA8i/kI5CmMpjFtidOuB09K2mKQ/xnE
 inNIRndmM+3ujTj39OcCNgr4uQEMX3uammtWSJgrBJvC5kleVK2YPzWfk7tARiScUpH39
 rBA2K4KKX3gBod2SGPlPMy+cSNpbWoBu+vHdZ+VBVw5PoOv/JUThIlnHDAz1k+9pPUQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=fpHWgNuX; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::630"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=fpHWgNuX
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6138D80CEC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:24 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c40f5077425so240966b.1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793119222; x=1793724022;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=j7tt77Pl2EO+eK3hH0ynjStV+ilwTmmbgYU0X4RhaS4=;
 b=fpHWgNuXwyEbc1n/bXfpjFiK8cmLw25uTgJwqc0JqFUjJml/7Mhz51FgBNJZyHnuEB
 HBk22/kG0mqzJGTcTxLEzMrsUDwPCuAijtZxbraM9NQMTHf8Y+hBI7+VS7B54NqVtZYI
 4A5WDf8HNGaOLPYYDnnIkkTbOViJmerM0Vi0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793119222; x=1793724022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=j7tt77Pl2EO+eK3hH0ynjStV+ilwTmmbgYU0X4RhaS4=;
 b=RTGaB7lBDyG66S/Oo337I7vQa4qQFONBKhCu+VyC+Dlgehci2uLxR020F3M7WyT+Dz
 EbEgaa94cQcTFchrAbs506QDJLv2qlIVH+JRcj9pgGQJmwfpsfZzzYZvSzifvEiW9VI/
 80nGqbWKYY01FHHMEgJsjv2boyS6XKIREIs3KxS7AD+6D2egPRZUVzqCxh2531joyEMr
 FCsmPP2s/reMnmfUgOwsmpx0Z8WqWh2g/PwtS1oJrFI6HkFIvdRGK9BDZ2Li4XDhkUYZ
 mOicY1Fqgqx6BNjE03kLBptDpMdmh5woXXSjYwDdZlVxReNojtGDDWVHPbG7VrlfD1j9
 AhCQ==
X-Gm-Message-State: AFq9FYKHYE+savMNvtCmfb1PJDAs45/OBUJoTPW0z33nRt/oaS8Cr+pv
 F46MLAgG7QEKQDTttSrxZyfcZtLKjBv9opEFijBSXy5CgvKztuai5bv6o8JzZoZDHR68i2pDqZQ
 GNAo2PMY=
X-Gm-Gg: AYBFou1HGtRm6T5fXiBmJERRIpY+Z2vpCseSKMPW25PFmOMJj6bo4Ko9W9GjMF1pbLJ
 Q/T2HNbXUWF+tHN409V4WS4jLlnqLVuVNdHge2fdGvxP5Tr8i5o0nhhBP1OxJh2Qf+EyfV4Gqfy
 6OB4pj9M9kTNmfnirC67NLlYX4D1cRszi/TCp9SSAygsivnPMFy3H/6E+2zj/Vhz1TyE4a+vsab
 K3WdD6CLXNNJ2XHuulYW9sYcI3mQrIraedK5sJEW7C36uPlGDn01K+Oxcs+ZG3mT9JR5VywBOYH
 2Jg/mEgQZ22wcJxa8zB4SXVopYisfW5J0J/C/AHLk1fjwfY4VwEt+Mq8ACmRjb6N7jzUnyRkWhb
 Xt1E9Zh2lqDgRw2KluAlSgFSocxaGs7YLnI86/KtzmNcWn7yyXVSkJSl4Hv6aozP2UXFjnPgvNi
 acwdD1eaRaMiGtR67dYpCW9/Ilpg9DVXokybJuBExq+9VWH4+SIIpq3LBK5+xN1DKwbt4tDoJp4
 rkTI46KzzIrZQ/afgGXa7cn0XJ062KHSd7xfM50BGeScPxL93mPGUvDLrmrB6GuLvAjKz6yi31f
 KNsmhYPIVVoFHcwoKMUgJJSrTCA2Qp5/o2HLBYsnwqogkSOjVBvnDBh6KfojOLb+11HYae96GPM
 xzvbj2tn7uvglZYeAgayMCxbnxeuRZD3opJgfo1+XoC+NBCwTOGOdDFDYPzUxRA==
X-Received: by 2002:a17:906:f04c:b0:c41:3963:6f1f with SMTP id
 a640c23a62f3a-c46bdc622cdmr1692439966b.4.1793119221853; 
 Tue, 27 Oct 2026 09:40:21 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd79683csm479171966b.69.2026.10.27.09.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 09:40:21 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:40:05 +0100
Message-ID: <20261027164013.1602502-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 08/14] configs/mender_x86_64_efi_defconfig:
 bump kernel version to 6.18.59
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Also update board/mender/x86_64/linux.config by running
`make linux-savedefconfig` and comparing the differences.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 board/mender/x86_64/linux.config    | 5 +++--
 configs/mender_x86_64_efi_defconfig | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/board/mender/x86_64/linux.config b/board/mender/x86_64/linux.config
index f17fc18edb..b758c6d45a 100644
--- a/board/mender/x86_64/linux.config
+++ b/board/mender/x86_64/linux.config
@@ -3,6 +3,7 @@ CONFIG_SMP=y
 CONFIG_HYPERVISOR_GUEST=y
 CONFIG_PARAVIRT=y
 CONFIG_EFI=y
+# CONFIG_GCC_PLUGINS is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_NET=y
@@ -10,6 +11,8 @@ CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
 CONFIG_NETFILTER=y
+CONFIG_NETFILTER_XTABLES_LEGACY=y
+CONFIG_IP_NF_IPTABLES_LEGACY=y
 CONFIG_IP_NF_IPTABLES=y
 CONFIG_IP_NF_FILTER=y
 CONFIG_CFG80211=m
@@ -35,7 +38,6 @@ CONFIG_RT2800USB_RT3573=y
 CONFIG_RT2800USB_RT53XX=y
 CONFIG_RT2800USB_RT55XX=y
 # CONFIG_RTL_CARDS is not set
-CONFIG_RTL8XXXU=m
 CONFIG_INPUT_EVDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
@@ -43,7 +45,6 @@ CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM_VIRTIO=m
 CONFIG_DRM=y
 CONFIG_DRM_VIRTIO_GPU=y
-CONFIG_FB_VESA=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_USB=y
diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
index 219f02839c..619122f5c9 100644
--- a/configs/mender_x86_64_efi_defconfig
+++ b/configs/mender_x86_64_efi_defconfig
@@ -1,5 +1,5 @@
 BR2_x86_64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_INIT_SYSV=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/mender/x86_64/post-image-efi.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --device-type=buildroot-x86_64 --artifact-name=1.0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.28"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.59"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/mender/x86_64/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
