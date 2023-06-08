Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026CFC7EE37
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 23:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48EE042472;
	Thu,  8 Jun 2023 23:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48EE042472
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8itO0e8aG523; Thu,  8 Jun 2023 23:30:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DE154241E;
	Thu,  8 Jun 2023 23:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DE154241E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C90D1BF97E
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5633983C59
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5633983C59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K-xZpf7-JcAS for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 23:29:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E00983BF8
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E00983BF8
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 23:29:10 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f6d38a140bso9133355e9.1
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 16:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686266948; x=1688858948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l5JmrCyJEhsYfdzfLcHFVUgApKMWuopK5/jx8v4dyCY=;
 b=kgtOTRuuIbgFM5VdSH2DPrAd492c6YSvAIji3zEvxb2/0A36YI2T7qt6k6gtdawrsA
 nbsYNPA8o/mp9y3loB26sH26RrP2JkYZm0VN0YwgaJxbevEMLza0e7OttFIAzNZA198J
 0l2zkkd8ETRTMLjKK/0EYTym0B5+h8/bDuo00fVx4VOeRYFrJ/EzE9/elbeppGZUxmZ5
 C4whV5PeGjTxowPOfTRSsL8va4T7qerK2tQvKJoQpmhYkcjfykTl+EbUCeryRElfZoBi
 6Q1vzb7qWJn/TpxiamUt5fWeJtk5304V1SfGec4NHBq7y3kMgb/FRyl+Um9XqvRAcarX
 ZlFA==
X-Gm-Message-State: AC+VfDwyW3+cnYTcgxpbOlUT6kjNliqMsRj533OmbjWhcr3EbHMci9WT
 ENzxFOeFi4YF/YjPeNSZkBwzrsufEQs=
X-Google-Smtp-Source: ACHHUZ6ebUPZWJzzJ+qvUZjT7VuVfPxKf5DUgpCEGuTK49PqvNDEI7vb/QEdgy2QHu/CWakWhzkLMw==
X-Received: by 2002:a05:600c:1551:b0:3f7:408c:ad39 with SMTP id
 f17-20020a05600c155100b003f7408cad39mr2421783wmg.14.1686266948523; 
 Thu, 08 Jun 2023 16:29:08 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb03000000b0030ab5ebefa8sm2757522wrr.46.2023.06.08.16.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 16:29:07 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 01:28:49 +0200
Message-Id: <20230608232859.1245497-7-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608232859.1245497-1-romain.naour@gmail.com>
References: <20230608232859.1245497-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686266948; x=1688858948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l5JmrCyJEhsYfdzfLcHFVUgApKMWuopK5/jx8v4dyCY=;
 b=AbWZJhdZPkl7QBa53ETjfhDy2MeFT+z/B2pBfpc2QpVLVlnoDw2oxmVut03DOVWrxF
 PuoT5ODyHnjXPXDByEEReE5pv3pMP60rqUgyA8sv6nxCnw/Xg/ZfKSy81kl/bxFTQvU6
 W5ZMP7mk9tvtOPDAhX7YBYSDc3M23jHD0OrqNrtFgYRhVVEKxMUeC1HiTXAcsmuKeLhp
 69pbbGF+RzKOP8AbYCR/Aan5KUxMH2noHp+bJokI63m7Zk3iZx36M46+zsRNZFgbsiFq
 f4YnhCleKPb2QbD8VfpwIXAiDINk6e/5WBwmxYfaNhWieseLMT9+WEr+Yrmttg6o6hhT
 QVMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=AbWZJhdZ
Subject: [Buildroot] [PATCH v2 07/17] support/testing: TestMtools: use base
 configuration
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

The base configuration now provide a glibc toolchain,
we can safely switch to it.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/package/test_mtools.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_mtools.py b/support/testing/tests/package/test_mtools.py
index 51e5138481..4a232bc926 100644
--- a/support/testing/tests/package/test_mtools.py
+++ b/support/testing/tests/package/test_mtools.py
@@ -4,14 +4,8 @@ import infra.basetest
 
 
 class TestMtools(infra.basetest.BRTest):
-    # We use a glibc toolchain to have iconv conversion working for
-    # codepage 850.
-    config = \
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
         BR2_PACKAGE_MTOOLS=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
