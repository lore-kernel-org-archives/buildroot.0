Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93378C7EE25
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 23:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C2DE4242F;
	Thu,  8 Jun 2023 23:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C2DE4242F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k0Kg0xj0wUSi; Thu,  8 Jun 2023 23:31:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E29344241E;
	Thu,  8 Jun 2023 23:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E29344241E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13CB11BF390
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 080D34202E
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 080D34202E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xwBVlkWMqBmW for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 23:29:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 364BB4207B
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 364BB4207B
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 23:29:08 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f654d713c0so1068300e87.3
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 16:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686266946; x=1688858946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NIHEMYycGl/rgY3D7MZa5N8c/mTtJdIvlhThnIm4Z4Y=;
 b=XCOgSbsCrB4vtmD2VEQYnmOw+QxL/EEqepnyeBzbRNwnLnXBJYwfr33C+tjXz+HFBk
 ukzJUS9zxYIL8NTch6YP2M/RlMvChfp1hnN0fPnKzKpxhr8P/UIMWzroQNufDlB7GKPH
 f6iMcyvzyiTMcQCgMl8v3+4DDNqUVekaQiQJ2caD97QUFblvG7B4F+yl0qZ8kmJgfQ15
 iJr/DUy7dp/uW7alhdLbDf3F+0jL5RQzla/CwQekUsRmXls4RRBS6NsmAB6k/ZZWU9ND
 stdMssxW2B6Lwt0G1zmol3Ta5fKPrHb9aXXUJEB0NXRtVWjZHw8jBUgWMwZkSp3h0EkM
 7sJg==
X-Gm-Message-State: AC+VfDx+VFR+vGB2XayvfEqg7a4bjkuFxQt9f1NVa1so4x5+Z+jQTPYp
 6o5lsnjuizBVhfRy0+jil8J7/G6TsbQ=
X-Google-Smtp-Source: ACHHUZ70XTdMWoJVdgKGQ6uIv/SnXLNPPKw9YSLijALXxIE95nJLToygwDJBC2wWBItUcR0M7cQcjA==
X-Received: by 2002:ac2:4d81:0:b0:4f4:b3eb:80f8 with SMTP id
 g1-20020ac24d81000000b004f4b3eb80f8mr319800lfe.3.1686266945692; 
 Thu, 08 Jun 2023 16:29:05 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb03000000b0030ab5ebefa8sm2757522wrr.46.2023.06.08.16.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 16:29:05 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 01:28:46 +0200
Message-Id: <20230608232859.1245497-4-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608232859.1245497-1-romain.naour@gmail.com>
References: <20230608232859.1245497-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686266946; x=1688858946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NIHEMYycGl/rgY3D7MZa5N8c/mTtJdIvlhThnIm4Z4Y=;
 b=mHuKzeOhpeKuNXVnLxxgmGbVmYqkP7ilaiou/cyItA/npjS7vd7ZPgs1y/L7nuZZrV
 1gLfwKChX6Tq04zN8QZC7v5KE1RiPilUxvWA6tRi3I0sYdkJRVHQL3epsQx40kSFsao3
 WZIcZ+0wtev22yK9IefIvomHVZTW+mfnlS4mhAeEWmVz3B16u6/lQ9ZgTkoHzJzw5p49
 x98KpLol1HA/ZG3Di9XSyG9b7ifGcYE4oVsDe2qtyXtAjPXIwX3ou8OAIZyTGXDCE/lp
 fGO4E1VfY6kPkcfYxkFElE7KQqqHhKPdSifPECOTNuour7W3W5kjiuxCO5y9UHf6G3Cp
 PeIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=mHuKzeOh
Subject: [Buildroot] [PATCH v2 04/17] support/testing:
 TestPythonPy3Botocore: increase ext2 size to 250M
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

We are going to update the toolchain used by the Buildroot testsuite
and this update will increase the size of the rootfs over 120M.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/package/test_python_botocore.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_botocore.py b/support/testing/tests/package/test_python_botocore.py
index f123993c08..0f3dc93a37 100644
--- a/support/testing/tests/package/test_python_botocore.py
+++ b/support/testing/tests/package/test_python_botocore.py
@@ -9,7 +9,7 @@ class TestPythonPy3Botocore(TestPythonPackageBase):
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_BOTOCORE=y
         BR2_TARGET_ROOTFS_EXT2=y
-        BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+        BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
         """
     sample_scripts = ["tests/package/sample_python_botocore.py"]
     timeout = 30
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
