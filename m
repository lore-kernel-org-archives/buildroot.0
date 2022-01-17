Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED8EC433F5
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 02:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C77264028D;
	Mon, 17 Jan 2022 02:06:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P2Maa7L2dibA; Mon, 17 Jan 2022 02:06:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A1314024A;
	Mon, 17 Jan 2022 02:06:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFEF11BF361
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 02:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 954B540132
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 02:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ypakwiin3UZ for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 02:06:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C53D1400F8
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 02:06:07 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id w188so21426648oiw.13
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 18:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rzuVCOpkuhQAN6L/FcYwAXZAQ5e+d+zqShLMXD6uPaU=;
 b=E6dVWMQbvWkl7akhNvCKHeJ2Dg5Fm5l9fCzSwBgiBMCchHFi1RfLCJXqY0Scztjbxo
 GeYXatC3+j9FQB5bOFS2pBOXLYMiWi5pukxjgb3p0dDW6RUWTJcQvwP35rHk2Q+htIzF
 FuTUh0rO8BElAxpCR9cTdrJkHvqAGDc571+XNQ77mta4XYR8MRS31M8g76mhjdiMNUhB
 bpflqiiG5KyMuDq0ba/UPTlg9bD9HpK5e6fzD6V/329WIgFADDLmYaEX0x3TJRqWF68K
 qsRggcV7BmDm/OvC61ZF8zC/oCcEfBSQg5vDH6HyJF9/1RjxZBThpmnAq/LhleaYehMW
 NU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rzuVCOpkuhQAN6L/FcYwAXZAQ5e+d+zqShLMXD6uPaU=;
 b=hEjPdW05jyE5JIG6ennrLFF3UDgXgtC2dkUU26alm6s8Pjc0j5v2hB4tFHT5DJpPyj
 PUn3PQ4J/wVZ75bKpxJE9OEbnXZI5wpqvgxQXZNaE/b5NjIDfCnAQtSEBx7n3hDyVYFh
 P+xXoiq9w7Tpowk9oNR95doEd4ZKyvNxuyA+52BPMrJ8XzUKHoXX4m6MToK43Mrc5FhZ
 WW7Awkkb5zLCQZfSGNKrIHFK1nm2GZfLuaqt7eZManu+ncseSuTYFB0nFIprI5Q5KaCE
 lN0dlvqmVHb89vmH3BnntXNq34FSzOG3ELI+VST0hY47qpWAoYDd9KF6yekKA/emS319
 QPaw==
X-Gm-Message-State: AOAM531Q+Eyx1JvwZGHlHDgsiRP8mgQTiR63+ZblQdWEUGPipRc3t4nx
 0dy77XVWRoNVNsLZsvo1PnlWlPv2k5w=
X-Google-Smtp-Source: ABdhPJzq4lKObWe/STOj5tFW0aKn9MisqNwFxt9Vn0DA/YwS1uEUlMxXERdSk7ZBcnNU67tflbbYsQ==
X-Received: by 2002:aca:646:: with SMTP id 67mr20826029oig.175.1642385166165; 
 Sun, 16 Jan 2022 18:06:06 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:c74:31c3:afdd:37fb])
 by smtp.gmail.com with ESMTPSA id
 ay40sm5580660oib.1.2022.01.16.18.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 18:06:05 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jan 2022 23:05:53 -0300
Message-Id: <20220117020553.749592-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/mx6sx_udoo_neo: Select
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Select BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following build
error:

include/image.h:1178:12: fatal error: openssl/evp.h: No such file or directory
 1178 | #  include <openssl/evp.h>
      |            ^~~~~~~~~~~~~~~

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083907

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/mx6sx_udoo_neo_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/mx6sx_udoo_neo_defconfig b/configs/mx6sx_udoo_neo_defconfig
index 3e1dc33bd4ba..793d992ce7a1 100644
--- a/configs/mx6sx_udoo_neo_defconfig
+++ b/configs/mx6sx_udoo_neo_defconfig
@@ -13,6 +13,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="udoo_neo"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
