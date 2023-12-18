Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602CEC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11D91403C9;
	Mon, 18 Dec 2023 08:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11D91403C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FSOW3TozlADY; Mon, 18 Dec 2023 08:22:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDC0F409C8;
	Mon, 18 Dec 2023 08:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDC0F409C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C2F51BF3BC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5542260D7B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5542260D7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F3yjwb0WWR6h for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:20:27 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 814B760D59
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 814B760D59
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a23566e91d5so79036066b.0
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 00:20:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702887625; x=1703492425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8rbNjT9sS6wsVDTro2bNCL0qMD/RbDGsLwOu6SZ51HY=;
 b=PfBWAKJ88vLc/IYO1QXINXbsJWejgPVLpeQ1lCls/11EzrB9//6mbmt3KUPUrb93ir
 5G+gnhJgForQWXp8Mod/Opzk0hL70F9POKthlDvWm08v48gRPIkw7F/52N+Uor5EYS8O
 5wOhLJKLC0pT7yMKM/R272PPv3DcNLYD/vLwypWIlD0WlZgwB1IsVOa7ErPaPPxBArbs
 /75mCXYviFBlfJ66YqzqKQ9Cn6QZ3J9EeqwXChXMpnAJqqrajihnHNREdtVEKe4ZYHCw
 g2//ds+s9w1bINU8uuFMkEUosbUfBj9wxOEfiuK5ck4HajsNaHW9twL5WwkvQL3k5kjT
 ZSSw==
X-Gm-Message-State: AOJu0YxIreG6/wZK/3Y4pEYKetO0rYIh5jbvJtaPvajHbCEUV441bCzw
 wJEcZIKvEmZyZcMAGHFBwqa9zCUyqUk52+21WVXs8w==
X-Google-Smtp-Source: AGHT+IFo90f4X0sPseGgWU2a8kxSVopPclm8EQHtVqKFntcvyW0gOtx/51zauq0KFwlNAQKvRD648A==
X-Received: by 2002:a17:906:6801:b0:a23:401e:2d5b with SMTP id
 k1-20020a170906680100b00a23401e2d5bmr615112ejr.177.1702887625311; 
 Mon, 18 Dec 2023 00:20:25 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.retail.telecomitalia.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 lm11-20020a17090718cb00b00a1cf3fce937sm13807835ejc.162.2023.12.18.00.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 00:20:24 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 09:19:58 +0100
Message-ID: <20231218081958.506691-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
References: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702887625; x=1703492425;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8rbNjT9sS6wsVDTro2bNCL0qMD/RbDGsLwOu6SZ51HY=;
 b=bbuwRVFpqQqQwPUa3CPPAw7xouKS8sZe7fBT3e4sBzfhGG9eDQFkC+WmnmXq/xe0SZ
 LQa+3UvxCg77i77RnM6vX6X+Joa2B2WlnKdAhestZwQf6H0PlLCuR0S7wzOxWGfjamMg
 DMIdte2gDkGVfaf+JKlccKowSGiwScHFFETJc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=bbuwRVFp
Subject: [Buildroot] [PATCH v3 11/11] configs/ti_am62x_sk_defconfig: bump
 Linux version to 6.6.1
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested on SK-AM62B-P1.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/ti_am62x_sk_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 0fb9a2f0246c..9e825d65c0f6 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,8 +1,11 @@
 BR2_aarch64=y
+BR2_KERNEL_HEADERS_6_6=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am62x-sk/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/am62x-sk/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c ttyS2,115200n8 -r PARTUUID=00000000-02 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.1"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
