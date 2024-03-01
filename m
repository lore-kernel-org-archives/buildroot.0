Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8915C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 13:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA93883367;
	Fri,  1 Mar 2024 13:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wxfC5bV9zPOZ; Fri,  1 Mar 2024 13:37:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F3B3837D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F3B3837D3;
	Fri,  1 Mar 2024 13:37:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DFA301BF2C1
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20ADB4016D
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GpGRoQYvPTTa for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 13:36:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E85E24193C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E85E24193C
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E85E24193C
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 13:36:46 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-564647bcdbfso2851044a12.2
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 05:36:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709300205; x=1709905005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GtNmGMMeRF1mHJwmIvLmfoAs7yIf384+FvLNoGeDJb0=;
 b=kQgoaIiuAvUqBTqh1FX/MXsJZU+axUATuVAvBGokZveG1oWqt07Ma2B/gZEmKenMbw
 5s/zjsVzs4Jogmp/1tyCVY2OwXBxRUt+NdurfgFQJhE5Pz0lBXEbnAnMqMERNcyQ0XBT
 t5+T65KlrHSEqaCuKABQDz03V4m2Zl6cSvUBndhfiTPO5bo7KwU6NOeb6ixXAHaAOrde
 ed3zrf47D0MNgGpFIktJHVbT+tbb7svC9XoMuJmK+1icSlguqY7rmkhfSusZUhBdLew6
 b4zWTmEMlO2gsBuFjfN2cwTE90IJj2d3riJSJVSL/YrIh2BtlvKPTswNEMniH3USYN+o
 BpFA==
X-Gm-Message-State: AOJu0YzX7daoOBcfarPoGr3Ydv2IcMcdQa42SYugCv1cFmZW1It+Mubi
 rdlw5Yg5xEU1qCOdcwjH82iIgBUJ+gnJ5sjqT3fLmAsIRkhRHRVlZCEoazAbCOaevIzBh7pViJq
 BA6c=
X-Google-Smtp-Source: AGHT+IH6SMlIWD3MvY07DtV4DK+kfPwNDskLUTPxIzcdSRM4nvCHufFIfqLalsoy3Te1sCc2Met4nQ==
X-Received: by 2002:a50:951a:0:b0:566:dee0:a3e0 with SMTP id
 u26-20020a50951a000000b00566dee0a3e0mr1006311eda.37.1709300204838; 
 Fri, 01 Mar 2024 05:36:44 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5260:58bc:42cc:9d46])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a056402033c00b005659ea1caf0sm1566608edw.6.2024.03.01.05.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 05:36:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 14:36:14 +0100
Message-ID: <20240301133620.3547430-18-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709300205; x=1709905005;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GtNmGMMeRF1mHJwmIvLmfoAs7yIf384+FvLNoGeDJb0=;
 b=fNjXTGDbOxfG5LBR+PP9cR2AvAquIowg/W9ZsXLrXcLESl9re9gQky8p09WaGN4kee
 LklDWZAc+IMHn7vxWTEV8uDVkoE4vLG+KRo8ZlyXATEBVAnjsN2wtlhfuzsephamVYy1
 hJRj/bCYdQLajfl6SDG6ecSrAOeurR3Pv/AB0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fNjXTGDb
Subject: [Buildroot] [PATCH v8 17/23] configs/ti_am62x_sk_defconfig: bump
 Linux version to 6.6.18
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested on SK-AM62B-P1.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v8
- Bump to 6.6.18 from 6.6.17
- Update commit message

Changes in v5
- Bump to 6.6.17 from 6.6.1
- Update commit message

Changes in v4
- Add BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6 to ti_am62x_sk_defconfig.

no changes since v1

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/ti_am62x_sk_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 7d9912024a16..877f88899af9 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,11 +1,11 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am62x-sk/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/am62x-sk/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
