Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B97C54E49
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 13:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D64A836F6;
	Fri,  1 Mar 2024 13:37:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qSIE0XiNRjNS; Fri,  1 Mar 2024 13:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4E0E836C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4E0E836C3;
	Fri,  1 Mar 2024 13:37:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A0B31BF2C1
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA9AB4193C
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n2euDjFPUAF5 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 13:36:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA71240644
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA71240644
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA71240644
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 13:36:44 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56682b85220so3795848a12.1
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 05:36:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709300202; x=1709905002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bprQybVcjJtafv+N+uoSsIglL497eIKFD5hLVUAwUew=;
 b=w5wgLpVY4Bw0K3I2OaGMsiHEefAJzFFEk8qpL1qnTz509pZoQ73PVv0q5DlOaXoZ5q
 EabyDkj92yfuSIAwUHg0ysj2tJecXHBG6jg6LRy7PHsdxaLvDfhbmy9UUFCEVmCBGc7C
 aHaj+KzPuCCSG1GTmYNkXBRbevVCuiX1DwA+QKRTVIdNp69C6Aqq2xUclIzooOY6vIST
 NHRWQRpcDnzCPPA8Jv7M+2pE7O7LXWpSiM/u93H6rM/H8tZoh0x4yNpBpVn242QqjDSR
 d9HxKtmWQ0NjMG58kIYTV1C/Z0BSQfkC9N1rG2LotlQqPuSotBLwmgPqyAjJoIaJ+UKb
 NUxw==
X-Gm-Message-State: AOJu0Yzn94UP2Lil+1lBjxDF2TQ6U0MTLCq1JyTzZYqYtmvVyHwkjiGU
 OMm4/6qgVk7yQXCOPdpYQmF6zyGm7ZZ9cQyKOJvMcY08IKdJf9YWuF+I/PRDgRPebaJVzkm17CA
 SegY=
X-Google-Smtp-Source: AGHT+IHZC11hJnZdcPA5Tph+rbxXYe+ACJ85rhhwHXx5H1VJA5Ru9mmzzqXG9Qqyyv3coAWlwcAqDw==
X-Received: by 2002:a05:6402:2895:b0:566:3d19:9058 with SMTP id
 eg21-20020a056402289500b005663d199058mr1465336edb.33.1709300202518; 
 Fri, 01 Mar 2024 05:36:42 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5260:58bc:42cc:9d46])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a056402033c00b005659ea1caf0sm1566608edw.6.2024.03.01.05.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 05:36:42 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 14:36:12 +0100
Message-ID: <20240301133620.3547430-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709300202; x=1709905002;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bprQybVcjJtafv+N+uoSsIglL497eIKFD5hLVUAwUew=;
 b=AoT/3kmqO3Qm0S0pAUie1AZNnuf/6L5pdUx4/etJa44IWxkmQo5ScKAOEhBnhtJT3x
 /oeAS58oRqlUOEN6DbCvR0nLfQl6yzqsxfTgnwRhF9AvPdR5XapFyG8AZId7DkRBqXpS
 iz4CJ+3VZpFbxGU5OkVLsXqltEjNmzVnHw2/g=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=AoT/3kmq
Subject: [Buildroot] [PATCH v8 15/23] boot/ti-k3/ti-k3-r5-loader: install
 tiboot3.bin
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

Recent versions of U-Boot are capable of building tiboot3.bin using
Binman. In this case, let's copy it to the binaries directory.

The use of `find' command is justified by the need to use a regex
expression to select the correct file. This is not possible with a
simple `cp' command.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v8:
- Use the `find' command in pipe with the `cp' command.

Changes in v6:
- Replace `find' command with `cp' one.

Changes in v5:
- Replace tiboot3-*-$(TI_K3_R5_LOADER_SECTYPE)-*.bin with
  tiboot3-$(TI_K3_R5_LOADER_SOC)-$(TI_K3_R5_LOADER_SECTYPE)-*.bin

Added in v4

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index fdb058f3b72a..9a05d005067a 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -70,8 +70,12 @@ define TI_K3_R5_LOADER_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
 endef
 
+TI_K3_R5_LOADER_SECTYPE = $(call qstrip,$(BR2_PACKAGE_TI_K3_SECTYPE))
+TI_K3_R5_LOADER_SOC = $(call qstrip,$(BR2_PACKAGE_TI_K3_SOC))
+
 define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
 	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
+	cd $(@D); find ./ -type f -regex "\.\/tiboot3-$(TI_K3_R5_LOADER_SOC)-$(TI_K3_R5_LOADER_SECTYPE)-[^-]*..bin" -exec cp {} $(BINARIES_DIR)/tiboot3.bin \;
 endef
 
 $(eval $(kconfig-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
