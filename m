Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C8AC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 16:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 052324011F;
	Sat,  8 Jan 2022 16:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b13fxmLSyjzr; Sat,  8 Jan 2022 16:51:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C2EC400E4;
	Sat,  8 Jan 2022 16:51:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 37C5E1BF599
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30DD540357
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kFAcbQs60Wzv for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 16:51:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AC0B408EA
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 16:51:18 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id s1so17611431wra.6
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 08:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PjnRwvRzbx2NvuwGwn4hH6x0bHziuqtE0YbfW4JYNnU=;
 b=KD0tUJ5JEKujZO8Km9OtA5dfEbhxaQvOoKPZ5FKtfeTaCVvdpRElOu7JQTZKQNMK/K
 HVBBbUUivgNWpJfWfOy9ijFy9a/oX6+P3XC6q4JmminsbjqfqT8eCKhaJnnqQ6wofoKg
 xTAc1xffCz3qxdSVrlnAaQROpVCG8Q0mxd4KOG+b+/XmmfMUONUG6/Ryn7Taom+I4DWI
 dknGw9yJXrvJTvgSrtyfEnnI3/eSjtX6K0tnX5WvruNnoaRWunOTM18kh5lShMuMoLEl
 NdmA6ukjOeEqBl03uiBYUkPPpQ46fzrqdonQ17Bwm2M7wv6DRq6Ad2SFFLUzOesH4v3l
 TVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PjnRwvRzbx2NvuwGwn4hH6x0bHziuqtE0YbfW4JYNnU=;
 b=RNSAUUk5j28aGPVbcyibRIlzXSyllybR9rU/6YwQ2h+PIkIi6oQ5qJbWP84GdhCanx
 2YXMoOprtP6CK+EjMdYQIILIBiZSRaOhy3RLCg86q9c6himJgUtlgLI+H0f/7jkNtQxU
 W/uAIPNwkEefkdHOnbPhqEX/QylY6QRCBZQyaFSWAEIe68z6rnzBsjDh4qz5+ofgAQpg
 e+WGkvOFAFx+iFA0KfW/R5TgUCUr1VwUy4BOoHMnjs46ys9PTzsAq/5NijBHdWZ/ZYvm
 a+T33sbHvL9bXA1dm6lR0JUlztk+2uY4locZbE5QB8zNP8BkY+RP0m5wU/VMThsbz8mc
 JEsw==
X-Gm-Message-State: AOAM532HvFNWXnQsHwZ7V3h82TZHbrS8wciWCUDPLtEgb6b3zftb0aNZ
 qB7VmeObpzdoH+KrQFylHsqOOGdZ5TY=
X-Google-Smtp-Source: ABdhPJxGVf2N2a0I7WlQI2ZoMQ0NtQ7oBe56SFDfgqzvBvIwx4++HyGgg4qvVT+X8/wMjfMisdlKeA==
X-Received: by 2002:a5d:5848:: with SMTP id i8mr57632464wrf.398.1641660676649; 
 Sat, 08 Jan 2022 08:51:16 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id ba18sm2039523wrb.40.2022.01.08.08.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 08:51:16 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 17:50:05 +0100
Message-Id: <20220108165005.2737902-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220108165005.2737902-1-fontaine.fabrice@gmail.com>
References: <20220108165005.2737902-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/nvidia-driver: add Linux in comment
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add "Linux" before kernel in comment to be consistent with other
packages and manual

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nvidia-driver/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
index 9631b3e70c..a8617a939b 100644
--- a/package/nvidia-driver/Config.in
+++ b/package/nvidia-driver/Config.in
@@ -75,7 +75,7 @@ config BR2_PACKAGE_NVIDIA_DRIVER_CUDA_PROGS
 
 endif # BR2_PACKAGE_NVIDIA_DRIVER_CUDA
 
-comment "nvidia kernel module needs a kernel to be built"
+comment "nvidia kernel module needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_NVIDIA_DRIVER_MODULE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
