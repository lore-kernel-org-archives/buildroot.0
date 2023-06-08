Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B48AC7EE25
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 18:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7AFE6155D;
	Thu,  8 Jun 2023 18:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7AFE6155D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id buKo3Zze2quJ; Thu,  8 Jun 2023 18:10:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E47EC61554;
	Thu,  8 Jun 2023 18:10:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E47EC61554
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B1D01BF3E1
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 044C861502
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 044C861502
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YWuDnNtubO11 for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 18:08:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AC95611B9
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AC95611B9
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 18:08:59 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f7f6341bf9so8693825e9.1
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 11:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686247737; x=1688839737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ej3MXp2ge9myAPHjVo+PA8RKz2UuhXri81RG2i8p/AQ=;
 b=j87Zrb2urov6mAXoRT1fa1GgBoHNANa9ULIf6rLqVctzlPabrntoXmTiEhdZisVUJ0
 v0xVRihdeLyfRzFe+1/RqY0H/okjtilbCDIkvOvJlDFJCvSor2CpDvTsSCRcCKBiSVya
 dM7vA1suuffZwLlW/6KwKeoYkV5zHWPUS8x5t4NBYhcTm8X4YAG59sPQUvFSWCajJTq/
 1jTmR8k68t6+H6yXefpld4p2QRfDjEEePdOH3zLr8Gz56LTMzfksSvFGtfMRy7AjC6X6
 idQxcZQt5gEgN+xwGdjDZGd+1+HLRCyRBCQ46ryV2XqONTAv4wLc4jH+3jh6kxnYhGOw
 elxw==
X-Gm-Message-State: AC+VfDx63iuE3hUMP9YW8mvWZK3OyAG8VbD6txtyWgBIq4BQF7pcFHla
 YvygsQaNRb9FZ95D0ULkDiXPOg1Cqd8=
X-Google-Smtp-Source: ACHHUZ7X8JVlC3WmxxfxEkxE5l3LZrgU3r9bQ7IjDapiSjZms+XWTNNECwSW+OYvYf/w6YVUUuzmyg==
X-Received: by 2002:adf:f78e:0:b0:2f6:bf04:c8cc with SMTP id
 q14-20020adff78e000000b002f6bf04c8ccmr7421673wrp.55.1686247737490; 
 Thu, 08 Jun 2023 11:08:57 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfec02000000b002ffbf2213d4sm2221238wrn.75.2023.06.08.11.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 11:08:56 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 20:08:37 +0200
Message-Id: <20230608180844.189528-9-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608180844.189528-1-romain.naour@gmail.com>
References: <20230608180844.189528-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686247737; x=1688839737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ej3MXp2ge9myAPHjVo+PA8RKz2UuhXri81RG2i8p/AQ=;
 b=L2m+pHKzfQsjjH6jLVPYfaZB+bwHF93Z6AA9vf50cMKtzRJieSQyPtdKQ7LKiUoi7Q
 0qzBisB0NAliXt0xlQikhwimA6sINUwvvmTXBjzqUiVrYx9SC6Amsne2q+tcQytvxl5i
 K2jtVJklnnN9iecreuiOjjuQKZ40HzHwmf5bcKb40YGSr24w5LRF2JyPHUrCSgYK7HEN
 VrjtTmbeSSQKXERzAnMPylJwjyB86dKdSYHf1dXbC41UoXytsGvxH1hW7imVJmVYN8aR
 dTlXPKsc8+Zjt5L+PxuUZLdQ9a7v94OxqeH2k2VIvpodkFLXSeHMVKFhGgHbRHXoszYe
 TA8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=L2m+pHKz
Subject: [Buildroot] [PATCH 09/16] support/testing: TestPythonPy3Autobahn:
 use basetest
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
 support/testing/tests/package/test_python_autobahn.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_python_autobahn.py b/support/testing/tests/package/test_python_autobahn.py
index 6c1678a615..f845885fe5 100644
--- a/support/testing/tests/package/test_python_autobahn.py
+++ b/support/testing/tests/package/test_python_autobahn.py
@@ -3,14 +3,8 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3Autobahn(TestPythonPackageBase):
     __test__ = True
-    # Need to use a different toolchain than the default due to
-    # python-cryptography using Rust (not available with uclibc)
-    config = \
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_AUTOBAHN=y
         BR2_TARGET_ROOTFS_CPIO=y
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
