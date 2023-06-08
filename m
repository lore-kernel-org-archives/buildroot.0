Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D12C7EE25
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 18:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CC1561535;
	Thu,  8 Jun 2023 18:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CC1561535
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LlCvNWmu59kz; Thu,  8 Jun 2023 18:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 723F061534;
	Thu,  8 Jun 2023 18:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 723F061534
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A122C1BF3E1
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AEE9403EA
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AEE9403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PZVp33PdYw1K for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 18:08:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B1AC401CC
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B1AC401CC
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 18:08:52 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-30e56fc9fd2so956375f8f.0
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 11:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686247730; x=1688839730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NIHEMYycGl/rgY3D7MZa5N8c/mTtJdIvlhThnIm4Z4Y=;
 b=B5LKiLvaKyEw/CpXAMaTevqcfSQ/6+AHC7VzId+wdG/NvS8o+akAsbcl1erdtRJEHz
 vjqyOb6Ljjd62vyIPtU2T7ZKDIOUXL77Nlm1W6OMz6vRn1UjSk5VMtGe0go4rzRcrKQ4
 WqU6u68SFyDp+7DcQtkjcggyBnYGNdI827VEcybXOOUq+CpzqrucYhxsP/NxVnvwFvZd
 XBqiE2Lvb+z3wgk5M7AaUY6rdnp3ErPraXOqsHH4eEe4w2pkPYECkjRFzXO+8Nhceryd
 nT69BrJioZNGm4pna67diFl90lQ6O9aR6NJBdcWqpu7oy28X3ieK+ES1YnJyJrMmnPOh
 68GQ==
X-Gm-Message-State: AC+VfDxQU1BU5DekMmWBLZm6lRjJ35InOj3IFwTAOYMmrIIp9mvaAMgw
 U9nB9RQLtrVB29LJSNI1KZ9BiLBUsdQ=
X-Google-Smtp-Source: ACHHUZ40q64t/FNEMPJQYuhV8nFY1a8QqEdBFwp40zbrWzGhm0vC9bPa6qALs1C3TUJTZHf+UUA1wA==
X-Received: by 2002:adf:f152:0:b0:309:45cc:577a with SMTP id
 y18-20020adff152000000b0030945cc577amr8513578wro.13.1686247729992; 
 Thu, 08 Jun 2023 11:08:49 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfec02000000b002ffbf2213d4sm2221238wrn.75.2023.06.08.11.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 11:08:49 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 20:08:31 +0200
Message-Id: <20230608180844.189528-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608180844.189528-1-romain.naour@gmail.com>
References: <20230608180844.189528-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686247730; x=1688839730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NIHEMYycGl/rgY3D7MZa5N8c/mTtJdIvlhThnIm4Z4Y=;
 b=M8QIpXxk0hoaM8vJ+KUYUVT5PHT42ofItuiCWw3IRbX7e52mvyCancbaOnQzGk0Uxu
 PYiS6/1WXRwuDzmSX7c7JuhTbMe06t87oD3bgRC8XNURP+iHRKRh5LeuFEIlnGGWIqE5
 f40LEKbl8sq05FmkU0YORhG2ISk83g6sMepeQFEJImAS12h+DN9Adu/BZRDCN4TNcgXz
 vDT2Yg/xrxZxqr11vZxIHJUighU7RJUYpIRb6ga54Zhg1wd3vIzxUHyGrSBCNFT+qxLZ
 VfDBOdbL3OJOsfbkDhxofoyHaCkaWHC/o6iz4DBU8QndM15CerWX1y5+kk+HBnfk1GNI
 in7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=M8QIpXxk
Subject: [Buildroot] [PATCH 03/16] support/testing: TestPythonPy3Botocore:
 increase ext2 size to 250M
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
