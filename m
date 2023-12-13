Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F2DC4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 16:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBED060F11;
	Wed, 13 Dec 2023 16:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBED060F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f3zNWfpBpom7; Wed, 13 Dec 2023 16:45:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5162615BA;
	Wed, 13 Dec 2023 16:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5162615BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68CA71BF285
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41B1C41ADF
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41B1C41ADF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BNnmy-NwzgUb for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 16:43:26 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC42E4158F
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 16:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC42E4158F
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a1d93da3eb7so829015366b.0
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 08:43:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702485804; x=1703090604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dof/GJcDXFGBHL7g6Pes+V0YjmvVefsviCiZtZGui7Y=;
 b=Qa/Yov96ySm8zcOG16Olfs7OvpXu/sLjPCUActnGWjTPzV9hJXGMbPFqv4zSZNrylW
 nB7g1fMgdO6QwVVJj3AkmgghvwrmQ/UA6wZFrBErIWcPmsjEf/vauiq3l/p5ExgJO7Mv
 Qk9lTUaCMlETdp2wJ9L6DXEldDZNmkKsVfYtt/vS+sPWtZCSxSgiTGRNiaEjt8KqoRMR
 MndbD4FSJ97zzvHWE8yeMkWPit4jR9XFww9WmGwWdWaDmSxY69QDKmViLIGyJ1Wh3TSU
 dd5Md5r5ycSuz9FWYea/hwBJwV9UShN3P+zyxoQQSr6r5ANXt3OzIGAwa75njFw+AuKf
 tthA==
X-Gm-Message-State: AOJu0YwUIoq+AaL4uiCGagkC380eQU+LQGs6N9PcdaWNLCyChaC2eLWr
 vP5H+01/vQyR36nOIRn4hdaE/9tJBVQlLyWlNuJADQ==
X-Google-Smtp-Source: AGHT+IHouO2P9tqMpv5hxQ5BqpvLQGBfoH7dwIh200E6n7FtG2FGeum9OBC7zZvNDEXk6CJ6ND1XIg==
X-Received: by 2002:a17:906:c14b:b0:a1c:af1b:7562 with SMTP id
 dp11-20020a170906c14b00b00a1caf1b7562mr4263430ejc.62.1702485803823; 
 Wed, 13 Dec 2023 08:43:23 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.pool80182.interbusiness.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 rl19-20020a1709076c1300b00a1f8bae93d3sm6017326ejc.215.2023.12.13.08.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 08:43:23 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 13 Dec 2023 17:43:09 +0100
Message-ID: <20231213164311.4180059-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
References: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702485804; x=1703090604;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dof/GJcDXFGBHL7g6Pes+V0YjmvVefsviCiZtZGui7Y=;
 b=aeqd290xK0ngPMKodKdpHiuuMlJRdnP6XQAP1EQCG/gS7jVUPNgiD0ngZsRR+V3oX2
 AWU+34SQFZ94iKfpQlSM6rZXe0zFqahUsHRpiKAAUbxkntZRhSFZEeTzBn+ANV785gsm
 1sUzDRcWPZdV2tSiAAHnhnbMvHFc0dAIx0xQs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=aeqd290x
Subject: [Buildroot] [PATCH v2 09/11] boot/uboot: set BINMAN_INDIRS for TI
 K3 DM
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As explained in [1], adding support for AM62x LP SK in U-Boot, requires
binman for building bootloader images. The BINMAN_INDIRS environment
variable is used to provide a space-separated list of directories to
search for binary blobs.

[1] https://patchwork.ozlabs.org/project/uboot/patch/20231030110138.1347603-3-n-yadav@ti.com/
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/uboot/uboot.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index dda606a88059..cf70f86a4132 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -189,7 +189,8 @@ endif
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_DM),y)
 UBOOT_TI_K3_DM_SOCNAME = $(call qstrip,$(BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME))
 UBOOT_DEPENDENCIES += ti-k3-boot-firmware
-UBOOT_MAKE_OPTS += DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f
+UBOOT_MAKE_OPTS += DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f \
+	BINMAN_INDIRS=$(BINARIES_DIR)
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
