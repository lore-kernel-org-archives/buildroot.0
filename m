Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A817C678DC
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 23:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE41C60FF5;
	Thu, 17 Aug 2023 23:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE41C60FF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZP1N_sZBcxUX; Thu, 17 Aug 2023 23:09:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25CE860E79;
	Thu, 17 Aug 2023 23:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25CE860E79
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 664071BF476
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 23:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A02841901
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 23:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A02841901
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0whtPKZ5EOvn for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 23:08:54 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6698418DD
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 23:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6698418DD
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fe501e0b4cso3571245e9.1
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 16:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692313732; x=1692918532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RSXOxyu+5pyP6114YLUDgXWU2+GmZdqkBYA5WfOcAj0=;
 b=IQ7BilP7VK81FqmsoHU07665ZLvBSogauvUBa6FUREcL59yWoD0Jkw6GNcxbtJ+qo8
 KOmw1nhOxgNU70lSCr0GGPFjRKQBOzmZJed385hAFbIDNbRBtGR5Z9u/pjM5/j2pgzS0
 vKZK3uh/Hy8AevcZBvyBa8kXO3eYXRkKzSZfwTjeIZjjLOAubymzHmTkBx0WmdDzZ6Kz
 Nts9RxYDyDK2x6gF7DioEl0kZPlMChgpS47G8wEdSz2I5WRDhYriQiFal2gd7i3KzS1m
 wVhijXvDAwJ+98xhdSNPoa3dwSYUgdHoAbcnWqOz8uXoa+yNH2J6LpAvMue/f2RVh3I4
 C3OQ==
X-Gm-Message-State: AOJu0YxI1E2yCmN25RejoE12v9VAdG5QkzzZ2fVSCwrmhrBoy7FdRHNm
 ZfimM9D/ao/8nHppjzOb3HmDMONH1E8=
X-Google-Smtp-Source: AGHT+IHYE8AGVAQYU61GKrpi9ELS19RC3qGFVL4ank1JiHQ3o4PUQ8aIqVuHWitYrQ1sYfGGEIj15Q==
X-Received: by 2002:a7b:cd8c:0:b0:3fe:108d:7f88 with SMTP id
 y12-20020a7bcd8c000000b003fe108d7f88mr840427wmj.36.1692313731782; 
 Thu, 17 Aug 2023 16:08:51 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 26-20020a05600c021a00b003fa95f328afsm4409479wmi.29.2023.08.17.16.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:08:51 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Aug 2023 01:08:44 +0200
Message-ID: <20230817230844.450092-4-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817230844.450092-1-romain.naour@gmail.com>
References: <20230817230844.450092-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692313732; x=1692918532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RSXOxyu+5pyP6114YLUDgXWU2+GmZdqkBYA5WfOcAj0=;
 b=CtPODKUvuIcqh3IFTOjISU4k7klmRmDJ2nv+q6+b+58MLuP/tltKTdv+XwWqFofEDx
 eF6sNZtjj/5dA5LCoMd5yaoSJlcyv/LU6qTHzJpZrkFWVRlZcq80+u1xs/rv6Av83nTX
 3WtmTG2qpapiIBN1uURe3UuhPAsnVyB5uuPxMk0Q1VH+62Xx+NkopnDJKpdS51U8O1N3
 /930VYMrB+/3+CTpV2WV++eh8ZInv0ldQun/sKfFvsAziEmjAa4j+F65gjwSiu3RR8J4
 mz30Sse/2SYw9g5XJ4Ihuear5r8Z4Vh8c4drrXOr+lEmmSfQ5J1C65XPoKrATSjsYtut
 ehLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=CtPODKUv
Subject: [Buildroot] [PATCH 4/4] configs/avenger96_defconfig: bump ATF
 version to 2.9 for binutils 2.39+ support
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This new binutils version break the ATF build due to new linker warnings:

 ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions

From [1]
"Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
 of a new warning when linking the bl*.elf in the form:

 ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
 ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
 ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
 ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions

These new warnings are enbaled by default to secure elf binaries:
  - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
  - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
"

Bump the ATF custom version to 2.9 for binutils 2.39+ support.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436283

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 configs/avenger96_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index 1f8e7a50d1..adfd7585c4 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.2"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-avenger96.dtb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
