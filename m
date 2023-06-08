Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9623CC7EE29
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 18:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B808611C6;
	Thu,  8 Jun 2023 18:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B808611C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v0diAaCmq0Ue; Thu,  8 Jun 2023 18:08:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71C8E610B6;
	Thu,  8 Jun 2023 18:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71C8E610B6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9800E1BF3E1
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D52A401CC
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D52A401CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uvav_N80DYw7 for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 18:08:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB90D403EA
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB90D403EA
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 18:08:49 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-30af56f5f52so735794f8f.1
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 11:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686247728; x=1688839728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B+kkLY8SOuNyK4F6Uz3E3lyYpZDGmpB+3VwffrqGTKI=;
 b=KIwqqS3svMgjCCRt/iInI2ChV1SZL6WhLGkau4bACM7HPmlKKiXVlTzpQk+vIHCOU1
 FUiVim7+f1A3axJVkCK+BRmLGi4B5z6I1WPhVYeK0SBMWJ2U091VM8X7D1iTawnqTACt
 wNbpi+3SmrBzvDTKcZyB2WD6TqileZFSQTs9Co2oXHv8bcg+nvje+kMLhogxUmqZporc
 d8Vqh6WTGP3GmGonuapibB2HzqXzYFMF8qH9E7LWNamxE0rFZee7p5j1XEbMuJ5v5a9L
 rYysNO1NdL4a+FXVQzkce1vzrTigU5ejyoOSzW6SVHFNgZqm1dusYVjNlvmiRFifFxXr
 pWjQ==
X-Gm-Message-State: AC+VfDxQzsTDKEudMUlyC0zZF/8oWvM/Ng2meuk9hpUwpN1s7rObMiz/
 ZjnutjdWj13Hjul1s3aJBVIgfUosmnk=
X-Google-Smtp-Source: ACHHUZ6vtH18ZqS2Cd0HE03pdpPqQCTjm+YgxnvfwLsxocMcYzxxkuN7uN/7//mvBNNca4BaBWTidw==
X-Received: by 2002:adf:e54c:0:b0:309:51ec:9ce0 with SMTP id
 z12-20020adfe54c000000b0030951ec9ce0mr6665746wrm.69.1686247727891; 
 Thu, 08 Jun 2023 11:08:47 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfec02000000b002ffbf2213d4sm2221238wrn.75.2023.06.08.11.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 11:08:47 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 20:08:29 +0200
Message-Id: <20230608180844.189528-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686247728; x=1688839728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B+kkLY8SOuNyK4F6Uz3E3lyYpZDGmpB+3VwffrqGTKI=;
 b=Y59fi8qYClV8rcc7aoFNTNwhWB1vBPkzfcQZQC5cseBBgx03hi/0P63BhJdhBKCHp4
 tfy4e1kQdic6c/ASh3dL9UGc1UWBWir9SvIc+tZHTvn6nWwejIfUicgepTCZhgKdmCiL
 yZNyl4uGJId86NvXvP/q40WduivLHwAs0Vy6qLlq4wBxleE6Q3vURqaO+UUnE5C6oGQX
 iETIUSy1P0skV0Z7ypK9rVD99nQbK5J+/80Q1U3eJS5eELhQp4LCcOInPbSFT+boqYRz
 GTD+ryOuariPDAB7VOmsSdaFqiyD7KKLJXIQywq6SOjpPbB0Lm7kjFapKsnXQhjoo/NE
 WrdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Y59fi8qY
Subject: [Buildroot] [PATCH 01/16] support/testing: TestPythonPy3S3transfer:
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
 support/testing/tests/package/test_python_s3transfer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_s3transfer.py b/support/testing/tests/package/test_python_s3transfer.py
index d81560aeb1..1578f3aa74 100644
--- a/support/testing/tests/package/test_python_s3transfer.py
+++ b/support/testing/tests/package/test_python_s3transfer.py
@@ -9,7 +9,7 @@ class TestPythonPy3S3transfer(TestPythonPackageBase):
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_S3TRANSFER=y
         BR2_TARGET_ROOTFS_EXT2=y
-        BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+        BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
         """
     sample_scripts = ["tests/package/sample_python_s3transfer.py"]
     timeout = 10
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
