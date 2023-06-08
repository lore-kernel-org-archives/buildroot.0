Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEE9C7EE25
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 18:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D3C561520;
	Thu,  8 Jun 2023 18:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D3C561520
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RfmcDfRlcZQ9; Thu,  8 Jun 2023 18:10:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A0B761556;
	Thu,  8 Jun 2023 18:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A0B761556
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 478E91BF3E1
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E905611B9
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E905611B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FXLhJavDxMIx for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 18:08:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7091D61502
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7091D61502
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 18:08:58 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f7f6341b99so6771205e9.2
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 11:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686247736; x=1688839736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d3ucrEdqMMVYfy2+2PlzEj+6ju0P8XzsHHWO3NrH960=;
 b=V4rmUXpCu6REikWvHcNnxd7mGLvh7D1LRj9xAnV8QduR4Gb3EdA1cfvlyklhLwEOgM
 Nx6n0nX6xgoCKJXtiVEnuWSMGdv1CDV630qA+Wu5GzFIWDtjqXWqggUNyJJWHIFUx1XZ
 Jkjjq/2/PicWK4O5/RjWGgWscEfoNpyn/asE/ULq+HBwwXLGAyTZJ2C/3CTI3k0Dchkg
 GUq3nlGLKzU2mebT6yMIFxZncgqcTlRnhOetejBTE9w7e6O6vqhfGb4ju1nM3vsQl9Fe
 Hiol9ypkpAgjW4Q52WW4ICJXG8jKXiHBeW86LtNbyhJHoHspHK5No+mH7udAJE8rpT7r
 H4AA==
X-Gm-Message-State: AC+VfDybTEx6cb5gwIdUIse3cuYzHAqb69m6CTSBcwtrLKQJCXrnw+4Y
 9WaGA3YCjC9kxgy9ODtS7oUZQUTPPuQ=
X-Google-Smtp-Source: ACHHUZ5/KqvBA+VfPJZT6L4wimyq5Epte3V1lxmCF+TmZU45ZswS0Tvzy89kdmp/vPvkT4EQj06smA==
X-Received: by 2002:a5d:4687:0:b0:30e:5c4f:8a6e with SMTP id
 u7-20020a5d4687000000b0030e5c4f8a6emr4799290wrq.15.1686247736548; 
 Thu, 08 Jun 2023 11:08:56 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfec02000000b002ffbf2213d4sm2221238wrn.75.2023.06.08.11.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 11:08:55 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 20:08:36 +0200
Message-Id: <20230608180844.189528-8-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608180844.189528-1-romain.naour@gmail.com>
References: <20230608180844.189528-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686247736; x=1688839736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d3ucrEdqMMVYfy2+2PlzEj+6ju0P8XzsHHWO3NrH960=;
 b=fMp1JPyrtMfnP5SIAlttjFg3XR24+YInIj7m0+GnEwnplfXJzeGhzBl1Z379eVaTWs
 5Xyf2rh3Cb9AHOgGPydXf5ZcTkoguviwk2+XyfXGyTDJn9AF6ilClHmgFPPgwY5Q0Vin
 RGwQq5/+l1fdwIfJRIAiB8pVQ57uUxG7NMkPpbfH1iHqpj9Yn7UC9uQqxBq8ygK1EpTM
 2sKqbTA6IbeejZZU69TAY40Sj8a3oDIsdeMysrefq5eANfRHc4RBfEOpELew2His9FgP
 iYciPpQqXrTsJGd2/0fnNFlFT115OV7wrCNr9QN+nr4UgD3A9eS0/fQd8zEBg443kobp
 78TA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fMp1JPyr
Subject: [Buildroot] [PATCH 08/16] support/testing: Test{No, All,
 NonDefaultLimited}Timezone: use basetest
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

While at it remove Glibc from the test name since all Timezone
now use a Glibc toolchain.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/core/test_timezone.py | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/support/testing/tests/core/test_timezone.py b/support/testing/tests/core/test_timezone.py
index f661519196..0e5009494d 100644
--- a/support/testing/tests/core/test_timezone.py
+++ b/support/testing/tests/core/test_timezone.py
@@ -26,11 +26,9 @@ class TestNoTimezone(infra.basetest.BRTest):
         self.assertEqual(tz[0].strip(), "UTC")
 
 
-class TestGlibcAllTimezone(infra.basetest.BRTest):
-    config = \
+class TestAllTimezone(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_TZ_INFO=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
@@ -48,11 +46,9 @@ class TestGlibcAllTimezone(infra.basetest.BRTest):
         self.assertEqual(tz[0].strip(), "CET")
 
 
-class TestGlibcNonDefaultLimitedTimezone(infra.basetest.BRTest):
-    config = \
+class TestNonDefaultLimitedTimezone(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_TZ_INFO=y
         BR2_TARGET_TZ_ZONELIST="northamerica"
         BR2_TARGET_LOCALTIME="America/New_York"
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
