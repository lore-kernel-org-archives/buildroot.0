Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FA7C46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 21:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67A4F41DFA;
	Tue, 30 Jan 2024 21:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67A4F41DFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X8P-nRhD-ENF; Tue, 30 Jan 2024 21:06:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAE4641DF6;
	Tue, 30 Jan 2024 21:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAE4641DF6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D8D3E1BF263
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 21:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE34E6139E
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 21:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE34E6139E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AHY5AhtS5wy0 for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 21:06:07 +0000 (UTC)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1EAAC6135E
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 21:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EAAC6135E
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-29065efa06fso3443476a91.1
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 13:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706648766; x=1707253566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d5hhFkFplwz3Io/FGbRRl4L9WRvNigvTOu8qRPFY4kg=;
 b=s20P6Rqiv1XfxrOzBKFfgTOpfPpIyZ6ieyUaQqeVNAfktXdNf4K3jEEiUo5czms0Cm
 28byiNhZOCLgUtU8tdtOlSF+PyCjF/skp1KpuT6412eQsIf/5o6Pi5Naay6FqttPfMa6
 nAVm8MNxeZgxDcPuSk25MAJpxx49NLNb5ZJ2iV5wOcnuw7xjJoC6SEJvkEcJttVAMa1j
 FMWWy9K0O9QFYSxsHGSf6rNODORs5L547M7qIm5u6snvUUZz/D+BtvJb/wn2epqa3WXy
 OE9QZv1MWzqpLGu9lBYzsLRrM0NChe6FwUsuvc8XaghcAapUaJ3U3tH01YTzKYZGkorM
 MXHw==
X-Gm-Message-State: AOJu0YzvPib4sG2rz7K7JmMggzcpkxqxORr0wdxd2oqmm2g9c9RywI+W
 R2epeFCOQ29rqQ/+JwOyrTe9D9A63liZPZUIk7PEtnrNPAtpTW1R0sfViMwKFk+x+vtE7hpQG8C
 p
X-Google-Smtp-Source: AGHT+IFox0xoB6E8JDpk5Pn83T1WJxL5hkF9T2zsZvxTfCC4DNdqEnPg4l2PAabFM1+y/DeJ5kuUvg==
X-Received: by 2002:a17:90a:8d0b:b0:295:311f:c67e with SMTP id
 c11-20020a17090a8d0b00b00295311fc67emr6092516pjo.11.1706648766088; 
 Tue, 30 Jan 2024 13:06:06 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCU+nl3kJv98O1GCynA9LhdkR7pz9IXA3FDn2R7JeYPoL8lkANsyoKa8AuqBVz6SKWj0Zh02sL7lGMJ00wtaNpvDd2FChuFjPuAZaY6PL/rGG9Ze+BtOPVA010vrVZpT3huIjkZgEuzJshVM
Received: from boron.threespeedlogic.com (d172-218-135-26.bchsia.telus.net.
 [172.218.135.26]) by smtp.gmail.com with ESMTPSA id
 e18-20020a17090301d200b001d71937c37bsm7666240plh.174.2024.01.30.13.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 13:06:05 -0800 (PST)
From: gsmecher@threespeedlogic.com
To: buildroot@buildroot.org
Date: Tue, 30 Jan 2024 13:05:53 -0800
Message-Id: <20240130210553.2554954-1-gsmecher@threespeedlogic.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <2419e302d2201270df70f0f2033fff876168332b.camel@gmail.com>
References: <2419e302d2201270df70f0f2033fff876168332b.camel@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20230601.gappssmtp.com; s=20230601; t=1706648766;
 x=1707253566; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d5hhFkFplwz3Io/FGbRRl4L9WRvNigvTOu8qRPFY4kg=;
 b=l+9kWSg2u+l9ELO0YW52TcX9Wv7Mue8/ewMciG5xWZ8beoWSmI+n1DYsF3znA4AHfn
 lr7R6D2yLVNsgFO1aS9chG0+rfdwgueZ2/JrQvgTgLxwGO4gReZZsuTxGGCm4LSMvlQw
 3Snn0XEGQbmWQVjjzLNGPInLeinrY1GZ1QtNhD3bVY8T1XGlP4QL58TwEMHuzA0F5xoh
 7z5fBCsjOQZ8oaMicSaQQw9fGgnab/8eGI/92ZK7Ok7guwjJiKU5YiuMkx9hpeubTVDV
 Y4HvWqOH+oH+dbA9HnDsb1xfU1P+a19sd6RW4xjRintgxDVeol1ZO2nEHIFxlN9UC4vI
 bCwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=threespeedlogic-com.20230601.gappssmtp.com
 header.i=@threespeedlogic-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=l+9kWSg2
Subject: [Buildroot] [PATCH] linux.mk: Allow wildcards in
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH.
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
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>, alexander.sverdlin@gmail.com,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Graeme Smecher <gsmecher@threespeedlogic.com>

There are a few config/ entries where wildcards are already present:

     $ grep -rle 'BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=.*\*' configs/
     configs/octavo_osd32mp1_brk_defconfig
     configs/octavo_osd32mp1_red_defconfig

...however, while the copy-in step of device tree compilation works
correctly, these wildcards are not converted to DTC build targets in the
kernel build. As a result, this configuration line alone is not enough
to generate DTCs. It should be.

This patch adds a $(wildcard) expansion step into generation of DTB
compilation targets (the LINUX_DTB_NAME variable). As a result,
wildcards behave correctly.

Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 1db5c6046d..80881597ad 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -195,7 +195,7 @@ LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 # and .dtsi files in BR2_LINUX_KERNEL_CUSTOM_DTS_PATH. Both will be
 # copied to arch/<arch>/boot/dts, but only the .dts files will
 # actually be generated as .dtb.
-LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
+LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(wildcard $(call qstrip, $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))))))
 
 LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME))
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
