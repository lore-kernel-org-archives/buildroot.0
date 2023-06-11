Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7B9C7EE23
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 11:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D920241765;
	Sun, 11 Jun 2023 11:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D920241765
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pr2Nx8k_eiHZ; Sun, 11 Jun 2023 11:58:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C70184174A;
	Sun, 11 Jun 2023 11:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C70184174A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8279E1BF5DC
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 11:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CE5141763
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 11:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CE5141763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DIhd70jsmWhI for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 11:57:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DD3941745
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DD3941745
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 11:57:58 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f6da07ff00so34753475e9.3
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 04:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686484676; x=1689076676;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ko2U7920EigxE9+m/oVhqDvd4BbJeWe3saod/rcLxdI=;
 b=VY2LuTMzPGv12joNdAyDiMRHdCKaBG98mY7sdL/HKLWyC5UW2uNq/d3rUP4cNhpVfA
 Zihc5XyHcMu8jyQsAizNfPX0hgcL2jKZbNHZpHeVjsW3igiFO2ybC67wPi3QBu5zcEJU
 5LHuMA5Ga2ZWPdv1N7f4/0cN+AqaVjTqbWoKKjiuI5p1xjUGF3anvw99z+q764JwhKgt
 6k9gMVVco/p11dXMZfEDW65wjnIy304VnEebp3u7P2BmXiu6bty0Tk908FDXDMo/8Gk6
 NFw9hu6rbIdVc3q0X3m0srK3tMOm7rdsOZGcHLETWu0sSTmNDQSlWZywQRFoKICmQ2B+
 KShQ==
X-Gm-Message-State: AC+VfDygq1hKqWhSoORnEc0zuxBJZiVaonspHpXRoE/QUaX2MR4iNzIy
 st/KOtN0MaeazgcxJBr1/JaLUpAd3rY=
X-Google-Smtp-Source: ACHHUZ60CwLSZykzfX3Qz/vJc7iJ4FvKUYuSrBY1mi0h/hBypjpk09Itcv6fmnqyZ+wFa15QtCOyvw==
X-Received: by 2002:a7b:cd8a:0:b0:3f7:cc2d:3f6c with SMTP id
 y10-20020a7bcd8a000000b003f7cc2d3f6cmr5052636wmj.24.1686484675879; 
 Sun, 11 Jun 2023 04:57:55 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 b10-20020adfe30a000000b00300aee6c9cesm9499085wrj.20.2023.06.11.04.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 04:57:55 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 13:57:47 +0200
Message-Id: <20230611115748.801929-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686484676; x=1689076676;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ko2U7920EigxE9+m/oVhqDvd4BbJeWe3saod/rcLxdI=;
 b=GsCIsnDyJPWdofr9SojqdmP4t713KxU5ljD+Hn5nLWrSqF8zDVdMg4GsnAYVxEYsHL
 CkrDhfj904hb76G+8kiUHl7km4Fhu1t38sxnGeZ1sTiJBOv/+s3bRaDCgJ77DRL93geU
 LyE5JqmXzoPsdik0BsDmBhGz6GfKeSQypLogm8B8aDvJyOLbsQMctR2GeglQE3epQSs0
 Q3Y9+b5GPkLeiPpJTkaCVoSlZCOb6vIJMwH6buxsCmEEFE81ITWZKEig5BcDQrqKp4AG
 PIkXrui8uSbxPn53dZG5cPBdT43rKHmR3h3yBDb6h3nC3kC4u1figOf97Un1x7UNrW7C
 wj6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=GsCIsnDy
Subject: [Buildroot] [PATCH 1/2] support/testing: TestGlxinfo: bump kernel
 version to 6.1.x
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

The kernel 6.1.x is the latest LTS version.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/package/test_glxinfo.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
index 79be596635..c7d62a690b 100644
--- a/support/testing/tests/package/test_glxinfo.py
+++ b/support/testing/tests/package/test_glxinfo.py
@@ -20,7 +20,7 @@ class TestGlxinfo(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
         BR2_PACKAGE_MESA3D_DEMOS=y
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
