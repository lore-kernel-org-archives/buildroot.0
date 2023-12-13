Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F04C4167D
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 16:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4336C60ED1;
	Wed, 13 Dec 2023 16:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4336C60ED1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1evSUYLcgzu2; Wed, 13 Dec 2023 16:45:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4357615E2;
	Wed, 13 Dec 2023 16:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4357615E2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B1A71BF285
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8013640648
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8013640648
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pus70-Yu4-kf for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 16:43:27 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 967FB400AB
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 16:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 967FB400AB
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40c31f18274so67600695e9.0
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 08:43:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702485805; x=1703090605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8rbNjT9sS6wsVDTro2bNCL0qMD/RbDGsLwOu6SZ51HY=;
 b=UHw8sgzSdHIpOvVGzcJoZk7TMG1fAGlr/SA7mKzzgtfCuz7SITqJxtBd+g37n7D+pI
 0FjXf89INXrAJPSHYFUXTREwS2uBH5U8a5ZxOFDH3q/hMUxNA5WXZGNlJtKSV2vvfkJb
 S6KOSpAX3T+NlG1/EX/fSWY6CF8jgqAFk9DcHYBxDK3ZLubkXHXHzCiWVUF4CsA6l80P
 18PUoJyONoN0XEb5z4MvEPCvPJBBnsIfBcTTj7hCRuBzTkYsBNTtCIL/MW8SxYCn+YTp
 qWT5UxH0EUbzTbfArcjS2psDfR1BZSJWfGVaDThxOwFFt9jcAKb0fQ4d5PdPWA3aMb7Y
 +qyQ==
X-Gm-Message-State: AOJu0YzYToLlaRvq2yyM8pir022LKOFYvBYAjJfEd4BoGGFZ34j7zwcw
 2pK/2ak+H/DglsvHuaYq7FCKyCT8Pv9r2dfQBh59Qw==
X-Google-Smtp-Source: AGHT+IEogTeRO4xGmxPeQwUF/9zpCH2DStL1OIaSNefFnLqwcV4jET3qzwLb+S7/jMbg3nWVaEF84g==
X-Received: by 2002:a7b:c7c6:0:b0:40b:5e4a:4086 with SMTP id
 z6-20020a7bc7c6000000b0040b5e4a4086mr3751569wmk.166.1702485805637; 
 Wed, 13 Dec 2023 08:43:25 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.pool80182.interbusiness.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 rl19-20020a1709076c1300b00a1f8bae93d3sm6017326ejc.215.2023.12.13.08.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 08:43:25 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 13 Dec 2023 17:43:11 +0100
Message-ID: <20231213164311.4180059-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
References: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702485805; x=1703090605;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8rbNjT9sS6wsVDTro2bNCL0qMD/RbDGsLwOu6SZ51HY=;
 b=M9Sk4tIE8RA/CFxY7BBPte/QZGYH1mzx8swFkHb8v/JErjsj6MTuRUY3nRzG93RqY3
 OCMGwWdYNjea0XxIxq2Hw6pP7kj/t/EGukLQIXwjrQAUSdEmnZjcn3MwZLJr48+aISqM
 8TVPTe/DyXbUADw4MGheV6As9pd9vZFfbRyL4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=M9Sk4tIE
Subject: [Buildroot] [PATCH v2 11/11] configs/ti_am62x_sk_defconfig: bump
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
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
