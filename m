Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0300CE79A9
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 19:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D11141D6B;
	Tue, 19 Sep 2023 19:48:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D11141D6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Er6ddrnlUhA1; Tue, 19 Sep 2023 19:48:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F15C4194A;
	Tue, 19 Sep 2023 19:48:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F15C4194A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC8821BF409
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 19:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC8CF6122C
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 19:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC8CF6122C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kP_8pzsmz52F for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 19:48:50 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8EFD61065
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 19:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8EFD61065
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-404314388ceso64668255e9.2
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 12:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695152927; x=1695757727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oUm1honDX0QpsSbiRXWmK8ziM4fE8Yp+eLXHmlwFeR8=;
 b=guNN22uE3x3LwPN6ld77VqL8kFSL5Na0tw3ZYKQjLqFR7jz2BZ/6KPTRsg7NZrChCc
 VVpoTOOeUtV9FwhBUG6RjYT2tdap8NeLiXayLZLOxJMA+QPFALCp1WQ8cZk4AaSE/Bae
 93f05Yar/9vYw3NJphIEnbVQvfZ8G99V8KJZqfzs8MIf0EzjEN+YnD5oWYBBEeTRPGH8
 PYkQuLLu9lCRIQmR1bA3qJKHuYSv1ZRXleG8J5GHHSYmMYAtCUEbBvKjMRQLwXSg3OQ5
 r6DxaOu6WDz3CPJsziZWI1w9BIMPMN4R8zHl3MbSQUJBWyn26+kc5iLm+yJCwQCOUEhj
 qRHw==
X-Gm-Message-State: AOJu0Yw/Jan6ZKfHtUmSqlWwK1pek39fsQJjzuwLcF0dxAHR8eOnOX5N
 Hns2kadeX84eAbaYcOYTcg2s+Bdbwtgczg==
X-Google-Smtp-Source: AGHT+IGlFKyvj17WOVyvJgz1OZPoDWZBjt2EjH31fibsq4AAPu1KyFZUx/ClUdo/WRF5aNIRmYKsqw==
X-Received: by 2002:a7b:c453:0:b0:403:d299:b2a3 with SMTP id
 l19-20020a7bc453000000b00403d299b2a3mr577310wmi.31.1695152927223; 
 Tue, 19 Sep 2023 12:48:47 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:983d:f980:1c19:9eea:1974:d68a])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a05600c21cd00b00402ff8d6086sm16057827wmj.18.2023.09.19.12.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 12:48:46 -0700 (PDT)
From: Roberto Medina <robertoxmed@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 20:48:34 +0100
Message-ID: <20230919194834.626884-1-robertoxmed@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695152927; x=1695757727; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oUm1honDX0QpsSbiRXWmK8ziM4fE8Yp+eLXHmlwFeR8=;
 b=e4p2TvaC7G82o9iuhNmCXje+vvtqFCpR2i5Un2N1fGjMXfti9TY29DjMJFw1L904g5
 UjhAh8ErBnAa5ophSojekM6GTf0BnWfUAXAhQa789IXQFPUudc99G/veTRJg6sIhzRhV
 Tgv9eWm2maFYz0VOKi5VBCQvMEHxMlUWszWuzY7oTQGDUiRlJ8qlQ3zetS20d5nEfQNJ
 GfUJZzTXb+rwAZndCLfMGJrptwbpV0wafJ1VyMhsIwkFOKOATGqbBRRQWT98Al/izgs9
 kb1sfeCQm/g14NQbpOnf0LwG0UGCiq2HEvKmllghMtX3USN9UvWR8XNeJk0GQGhRcmzm
 YsRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=e4p2TvaC
Subject: [Buildroot] [PATCH 1/1] configs/roc_pc_rk3399: Enable OpenSSL for
 U-boot
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
Cc: Roberto Medina <robertoxmed@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable OpenSSL to build U-boot. Reported by the daily autobuild.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/5083367140

Signed-off-by: Roberto Medina <robertoxmed@gmail.com>
---
 configs/roc_pc_rk3399_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/roc_pc_rk3399_defconfig b/configs/roc_pc_rk3399_defconfig
index 3cc64be176..79a51a8230 100644
--- a/configs/roc_pc_rk3399_defconfig
+++ b/configs/roc_pc_rk3399_defconfig
@@ -31,6 +31,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="roc-pc-rk3399"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
