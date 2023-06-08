Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF51C7EE29
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 18:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C87FA61529;
	Thu,  8 Jun 2023 18:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C87FA61529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LP7NwZezaTgW; Thu,  8 Jun 2023 18:09:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F158561520;
	Thu,  8 Jun 2023 18:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F158561520
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF5D61BF97D
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9911B610B6
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9911B610B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Os3b0LTpDGB7 for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 18:08:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE97060F8E
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE97060F8E
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 18:08:50 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3090d3e9c92so943655f8f.2
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 11:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686247729; x=1688839729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pBNrepenAjPUyfB6kwvm5k2NdsOtOQBRdbWy1mhaC5E=;
 b=MA4ZGti+8En7yLaEtPMrhbYPmF2Nr7Dxl4Ad/nPfF6exWy1mqBoVne/crW+w3sTDm0
 lAKpkgxUiaEay7JBp3ZYKzegWPaN2Frxq0gRRvo6+loMK272vuVvStE/EJSc9Rb9Scqn
 jNDsKyWARrfU7J3VJKevIE3064q8LYuqLTnWNKjtrY/I2omr6dlHje6f9wN9ZFWONGh8
 xp8fx9XCQRE9JI8At6TosuHRzpcBOimyxNpq+r4LzosuYQDIiuZXaTIlNjp/A9rf/dwv
 l0a5z81Nkv/0rMqv68UnzcEY/sKrF3sbaitezorfbRUPDnDMtSZfybZwnSPv//FdO5xB
 wRWg==
X-Gm-Message-State: AC+VfDx8+29TlsXbyiEA/eHrJCdF6Xt6IH99Ym5KTBH+s7AEeDG/ewY4
 5v0OWFxUh23228EONr7H5I5dIwaxdG4=
X-Google-Smtp-Source: ACHHUZ7rkee9r3CWbP43LhrNDEyrO1MsS/L/o2hOI9jGbqFjMgJ87tyk/miFtN4T23RlXONPLjgd1Q==
X-Received: by 2002:a5d:4f8f:0:b0:30a:e6d4:f2b8 with SMTP id
 d15-20020a5d4f8f000000b0030ae6d4f2b8mr7789497wru.25.1686247728941; 
 Thu, 08 Jun 2023 11:08:48 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfec02000000b002ffbf2213d4sm2221238wrn.75.2023.06.08.11.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 11:08:48 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 20:08:30 +0200
Message-Id: <20230608180844.189528-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608180844.189528-1-romain.naour@gmail.com>
References: <20230608180844.189528-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686247729; x=1688839729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pBNrepenAjPUyfB6kwvm5k2NdsOtOQBRdbWy1mhaC5E=;
 b=IeJzWsmc3D7p4eg3qAhuI1wsFjvIqv220sMU5vI0BtqsdnCjewdQbk4ocVSLghhKtE
 ere3zOmUF/BQWtX2pSJdqzDsI1zSHUOvVeCE5qVugADjpSaLf0O1p9rhJaamiQmuQ+0D
 3m78CUZn45RfNptYWqDn9xCEfjXDyZe7IkH63boww4y1K+6hE+X8OCIxqowbJQhUrgAe
 RYG6aMvLPRj8bM0NdSMduD7n4EfGZz95wP30243PCUR3XO5K1VUKmgZrct7DIXEZVYoX
 boTu8XH6E5iXBAc8muJOg7MU588Sp/75Hc/95TXsu/WS3YkyKRo7E1qL9r9A4c3AFQLS
 VqOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=IeJzWsmc
Subject: [Buildroot] [PATCH 02/16] support/testing: TestPythonPy3Boto3:
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
 support/testing/tests/package/test_python_boto3.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_boto3.py b/support/testing/tests/package/test_python_boto3.py
index 126ddae63a..02a1f69d40 100644
--- a/support/testing/tests/package/test_python_boto3.py
+++ b/support/testing/tests/package/test_python_boto3.py
@@ -9,7 +9,7 @@ class TestPythonPy3Boto3(TestPythonPackageBase):
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_BOTO3=y
         BR2_TARGET_ROOTFS_EXT2=y
-        BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+        BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
         """
     sample_scripts = ["tests/package/sample_python_boto3.py"]
     timeout = 10
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
