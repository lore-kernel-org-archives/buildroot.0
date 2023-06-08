Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430D7C7EE23
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 23:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D433142459;
	Thu,  8 Jun 2023 23:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D433142459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NpxcimVM872E; Thu,  8 Jun 2023 23:31:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B492C42488;
	Thu,  8 Jun 2023 23:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B492C42488
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 952C11BF390
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F03183C59
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F03183C59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZgtHFYDYBROH for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 23:29:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A701883BF8
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A701883BF8
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 23:29:14 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-30d181952a2so1168201f8f.0
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 16:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686266953; x=1688858953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3qTg3KOw9iUWPqpda7tv9hSzOj0L8fqbYMACydXZYkc=;
 b=PrUIp7LqDEm4cTYz3HAehi4Ig/VdeTbrWikbj9+hBE5YSFRvKFE/hcDiWCkrYsbcTr
 1tlhku9DwQnP578JKMsJI+984syAnvtGpmkwwKSfwlr8cMjA4wXUrM5DjUH6cPEM0Tep
 np9eCI6nQUYBE9x4i30I+m+bUS8HwYRGnSnzQqlnUpU/j2CvGY2H7xo6zToiSprpFJHE
 jU07JOmifpXr1vQ/bPcEXlGMhWcFAuO/ZWn6KnzVNrwYrZcXdSFqdYS0MQTWFUQpczGg
 65vQ86XEvDADP375v6Frhg9sd2+w6XLEGp3r2TRhP+iUxyvI8TXfb4ypff99YRUNH3eC
 Eodw==
X-Gm-Message-State: AC+VfDwUovmuCbMtsYJjRNCMBM43ATmUyt67GBxu3YoJDQmEuLvBsKgk
 27JkGCMjCYMLNEpsq/rMIgQB2xMkaAs=
X-Google-Smtp-Source: ACHHUZ4Z4xrjGbJvGnDXSXTKiEEmmrB2uWhF22fw55zIGW7e3h1y/ojLh1RnvP4kNPb2NGhMLc9lZg==
X-Received: by 2002:adf:ff8e:0:b0:30e:412a:841b with SMTP id
 j14-20020adfff8e000000b0030e412a841bmr7765912wrr.37.1686266952821; 
 Thu, 08 Jun 2023 16:29:12 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb03000000b0030ab5ebefa8sm2757522wrr.46.2023.06.08.16.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 16:29:12 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 01:28:53 +0200
Message-Id: <20230608232859.1245497-11-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608232859.1245497-1-romain.naour@gmail.com>
References: <20230608232859.1245497-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686266953; x=1688858953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3qTg3KOw9iUWPqpda7tv9hSzOj0L8fqbYMACydXZYkc=;
 b=fZgAQK93bBGgFoqEb4jth3rCwSQjiERhP5cxC9OsDBHNaGQ8ZBzxN0zHDWTU3Yp0Dr
 bq19pVQVNCV5nayChEhnDdDjgXlgLqbtYLzpbnBZXx5cPFscKafS4eUM6aJkc1z9UFwW
 68CnIt/cgtS79pGeZ3gNppdZ+vmM2YCSN77XU20vMlC9uzKIPMtq3x0B752mOPEcnlFm
 1TJUzAT/J321KjRzEKG8MUCK/HwArUgLjFCYAA55UIVQ7E5g8DrSff+UMDsRey48v/B3
 4+3XwzX3bLRLhsmuoQQuuLEBiM1yflimodBPW1QyVG7bUEeITTBihzvcfDgHcOp6ESgw
 KM0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fZgAQK93
Subject: [Buildroot] [PATCH v2 11/17] support/testing:
 TestPythonPy3Autobahn: use python base configuration
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
v2: use TestPythonPackageBase.config
---
 support/testing/tests/package/test_python_autobahn.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_python_autobahn.py b/support/testing/tests/package/test_python_autobahn.py
index 6c1678a615..f785b1af97 100644
--- a/support/testing/tests/package/test_python_autobahn.py
+++ b/support/testing/tests/package/test_python_autobahn.py
@@ -3,14 +3,8 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3Autobahn(TestPythonPackageBase):
     __test__ = True
-    # Need to use a different toolchain than the default due to
-    # python-cryptography using Rust (not available with uclibc)
-    config = \
+    config = TestPythonPackageBase.config + \
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
