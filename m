Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901D3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24A3A40AE2;
	Wed, 26 Jan 2022 22:54:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vG8IXD8D4Nnc; Wed, 26 Jan 2022 22:54:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F60F40ADC;
	Wed, 26 Jan 2022 22:54:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C1DB1BF48B
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 585FF84E31
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xpv0KNo7ZCiD for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:54:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CE0084E2D
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:54:02 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a13so1478346wrh.9
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 14:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AThN6tX4uznp0JRPYT+dm2WUlFp2CIUUIjFiJTAluiQ=;
 b=Yu0HLfhk3WSiMBye+pWroiXg/re/7l07g3juXd//AL095DRc+zVaNPxj85Alyd6yu2
 b4x1USfYGCIq+St4mahyrYkvMmuXz86uB6ko+ILgtHkRQvb0eAjutPe8GT/vs1lma0Ha
 hgYUPnuNM3sggAgJ886ZcEfU+v5RVpAiBPS2o6YkKT/dYBO7K2LUdBu5JVZlVsn/04tD
 cFkbELuDE1Y9aztG8cFQguBLQf7xweeur+MLdCXiAJIv8Hx8O4flxRfSw4a28a+ydNla
 TZ3zBnpqJOHoVvak+5jR32TjPZ+duRKrHZL6+A3A+5m3eIcLXGqDoWsFfoLLPaSi7rf3
 44zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AThN6tX4uznp0JRPYT+dm2WUlFp2CIUUIjFiJTAluiQ=;
 b=Zobx8qjkj338bSuT8khRgzCSnjV4mzLE92JkZZ9VckHvX7S3ZE6DqhMLEtha7BziDe
 jgKkDl0L6VCMcCDZyj4t9Zp6xtUvGv7gFnPYEBJC/rYuNaZfoOlq8rot9H0mTAx2SkHr
 Zcfy8BPklS6X/i6aVf3qP3HlvOOxxiiJ6q/k3Rx6U3NOaR1uvyg34XMdKls66dyPRFFa
 R4D4vUlB3qoi3VS2fWOUImkh6j+oGmEeqt9qKKZs0KidBistaJKVbZF3NucvbMEkNHWu
 ipXluipX9AH/GfmYLgKi4LPG9WLLMT5UtySMy+niJRls4zljOsloCe7GM06cnJlKtCQq
 wFqQ==
X-Gm-Message-State: AOAM5307bv/wmsNqEcH6FnUp8rsl8ytn8dyNFOVVnyyvT2rGAc4Dm9UT
 eM33DEh8s09NX3wv5B4F8J64O9iEcu4=
X-Google-Smtp-Source: ABdhPJxK8d2bWqpBq/C1tESNdrw5OewNX5afh7Ojsm/YpXiWXFpmc5NkuMmxPphIrhcWiV9IxaOR2g==
X-Received: by 2002:a5d:500c:: with SMTP id e12mr559580wrt.193.1643237640600; 
 Wed, 26 Jan 2022 14:54:00 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id g20sm5720248wmq.9.2022.01.26.14.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 14:54:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 23:51:59 +0100
Message-Id: <20220126225159.1567622-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126225159.1567622-1-fontaine.fabrice@gmail.com>
References: <20220126225159.1567622-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,2/2] package/xvisor: add riscv support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Alistair Francis <alistair.francis@wdc.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

riscv is supported since version 0.3.0 and
https://github.com/xvisor/xvisor/commit/d6feda4e80eefd372294b081111ce709d08ee4c0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 package/xvisor/Config.in | 3 +++
 package/xvisor/xvisor.mk | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/package/xvisor/Config.in b/package/xvisor/Config.in
index 71628e633e..1eb50c8abe 100644
--- a/package/xvisor/Config.in
+++ b/package/xvisor/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XVISOR_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64
 	default y if BR2_cortex_a7 || BR2_cortex_a12 || BR2_cortex_a15 || BR2_cortex_a17
+	default y if BR2_riscv
 	default y if BR2_x86_64
 	depends on BR2_USE_MMU
 
@@ -34,6 +35,8 @@ config BR2_PACKAGE_XVISOR_DEFCONFIG
 	string "Defconfig name"
 	default "generic-v7-ve" if BR2_ARM_CPU_ARMV7A
 	default "generic-v8" if BR2_aarch64
+	default "generic-32b" if BR2_RISCV_32
+	default "generic-64b" if BR2_RISCV_64
 	default "x86_64_generic" if BR2_x86_64
 	depends on BR2_PACKAGE_XVISOR_USE_DEFCONFIG
 	help
diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index dc49258400..d7bb288ea8 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -32,6 +32,8 @@ ifeq ($(BR2_x86_64),y)
 XVISOR_ARCH = x86
 else ifeq ($(BR2_arm)$(BR2_aarch64),y)
 XVISOR_ARCH = arm
+else ifeq ($(BR2_riscv),y)
+XVISOR_ARCH = riscv
 endif
 
 ifeq ($(BR2_PACKAGE_XVISOR)$(BR_BUILDING),yy)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
