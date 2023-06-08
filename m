Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489DFC7EE37
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 23:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA7D042482;
	Thu,  8 Jun 2023 23:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA7D042482
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4XNpEtIRJbDD; Thu,  8 Jun 2023 23:31:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A93D642476;
	Thu,  8 Jun 2023 23:31:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A93D642476
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D61D1BF390
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7645860EE4
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7645860EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H7M_eIB2xsgq for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 23:29:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2B2060E5D
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2B2060E5D
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 23:29:13 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-51493ec65d8so2104315a12.2
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 16:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686266952; x=1688858952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w8RhA51N2zasBKli6Jx7PEIzLSlz44E8oLu2pPxV7do=;
 b=CDfBBOHAgUwLeOCYx2lPqlClJvlDb8DDDNt+qg5o5RO2iNOVSQD0gUSP3/7Y+nQm00
 wiQ2KeW3T6SDxLQSTtsjaax2042bHYnNdLgk+rUlN77jowOAmf6726fcCOzRJIu/zkHU
 QrKLKMyi4Ud5LPz9LZ8PC0y/DUshc32LcE3xG+0gUjPB3pNByHo3P3T3AT76dMJmTdhW
 4M2qqFL5jmsIn0qojnWM4n8z6qCJZLdGsh5LhS6FvcRyCCkD/Wz2xi57LdlGeMzHdzOH
 i050tU/ED1enCzOrHDYApUy3WUUuvHU/ll8GZ58iEyU0YJwYHHdrO/8Yx4LrdbbSkD11
 /0Gw==
X-Gm-Message-State: AC+VfDyu55ypExdwDVzcy7LnWsJ7SkF0YsrV/Hs8EbLAI2HKko2diHl9
 QFEmXt9oD2mb4YNCDmxX/zpjaXdfJIw=
X-Google-Smtp-Source: ACHHUZ6IRsBX4/ph6BK8Hp0U9rdXC6IZBDWblzeRt1JRLkzOZ++YthDfgnmpLgM+f/Qp+HDPvy8MfQ==
X-Received: by 2002:a17:907:e8f:b0:973:71c3:8b21 with SMTP id
 ho15-20020a1709070e8f00b0097371c38b21mr639875ejc.72.1686266951688; 
 Thu, 08 Jun 2023 16:29:11 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb03000000b0030ab5ebefa8sm2757522wrr.46.2023.06.08.16.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 16:29:11 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 01:28:52 +0200
Message-Id: <20230608232859.1245497-10-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608232859.1245497-1-romain.naour@gmail.com>
References: <20230608232859.1245497-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686266952; x=1688858952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w8RhA51N2zasBKli6Jx7PEIzLSlz44E8oLu2pPxV7do=;
 b=ce7yoe/AqoirErOHE/O2HYat/o+282GEHVT6OCCIROxw2q3JMSo684AOF3g8OJvJJS
 Yk2zWPApLtPK5cBcjQXaDgQRoOrX5jJobiBCJvTeswHkvL5svjOJgXEJzaNd1bPBz16r
 8AXQqg0ETvU8J+IAVl9blLUzSAGgY/N/Uyg8uCqBcaXW1w9YyN7XikT87Gj/9+Jxcdb0
 sBkVhLZGQgA/Ar3rRlJanQFcILN97zkHUN/GYz3/R18eIN9W2Nr+5Gld3cBUSqI93V6m
 126lwKTYgHVhjyxMakDLetdsAl9iQ9JC6c1bd1jjRh4wovEz7SvUpdN7XxOrHlUC3RWv
 lkRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ce7yoe/A
Subject: [Buildroot] [PATCH v2 10/17] support/testing: TestPythonPy3SciPy:
 use python base configuration
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
 support/testing/tests/package/test_python_scipy.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_python_scipy.py b/support/testing/tests/package/test_python_scipy.py
index 007bc9ffa5..06297763c3 100644
--- a/support/testing/tests/package/test_python_scipy.py
+++ b/support/testing/tests/package/test_python_scipy.py
@@ -5,14 +5,8 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3SciPy(TestPythonPackageBase):
     __test__ = True
-    # We can't use the base configuration, as we need a glibc
-    # toolchain for scipy
-    config = \
+    config = TestPythonPackageBase.config + \
         """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_SCIPY=y
         BR2_TARGET_ROOTFS_EXT2=y
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
