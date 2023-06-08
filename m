Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95794C7EE25
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 23:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33FC242430;
	Thu,  8 Jun 2023 23:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33FC242430
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5X7qE-_kKjIq; Thu,  8 Jun 2023 23:33:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 086774202E;
	Thu,  8 Jun 2023 23:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 086774202E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B35021BF390
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89E774207B
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89E774207B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id swXQt7vKYuXY for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 23:29:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 870254202E
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 870254202E
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 23:29:20 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f7378a74faso8804295e9.0
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 16:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686266958; x=1688858958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wxTwUQ8j3dFpIF7q6+GEPo0YgwA2xwOgtZWyBSZB7TA=;
 b=O5dwMaFhLXqQTIcV7A8PC3IywUqOsENSUNe6cjNx1NbVjlBABwHsmBEdiveSYjyeHz
 krYFjoJoP8GoZ8RsbcIBK8latbw5ui2fjroU09N5JUJD/QeYHUKBhQKrimTcRZgofnE0
 ZjYg2a/ugibAcsc9jeQYTdOsq3u8JD5ET2Fs2/FpQcmulZ6DaWQJq1926H34yDJlVecp
 xJLGD5S4+OGUZ/+GoYqhDu3Vdvz0LhdAPSB2ZMM93ebcw6+WMEwZL/LS/b/tdXOchaHQ
 jFomma54RgimEYtTjsUXi6PBCejjIpEU15TYyJlXk0s96RmMvyt54wm7SM2cM7o6ZReh
 QpUQ==
X-Gm-Message-State: AC+VfDxCi5pWRaLP/P1Ejss9Jf3TQdUdskixbPVDpRkuyzfKwh2mpAc+
 FKgGVDbP8Eao0PNFxwGoPjMOoOGyQ5c=
X-Google-Smtp-Source: ACHHUZ4TBaLOfSZkqZC1JjQ+0JEMu5McFFecA0FcnbFT7jBU4RDRkARfqqEg4wOfRxm1x4Wpbv0JUw==
X-Received: by 2002:a5d:500d:0:b0:30a:e9a9:a4e4 with SMTP id
 e13-20020a5d500d000000b0030ae9a9a4e4mr7540005wrt.51.1686266958571; 
 Thu, 08 Jun 2023 16:29:18 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb03000000b0030ab5ebefa8sm2757522wrr.46.2023.06.08.16.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 16:29:18 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 01:28:59 +0200
Message-Id: <20230608232859.1245497-17-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608232859.1245497-1-romain.naour@gmail.com>
References: <20230608232859.1245497-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686266958; x=1688858958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wxTwUQ8j3dFpIF7q6+GEPo0YgwA2xwOgtZWyBSZB7TA=;
 b=Bkg8g5mUQ2uFrl9YqoqGsWNti/4ZBktkZQY5vxM7EXZaM5Iyo5Lz5sfdQa/toOsH/G
 JIfrTzqWwL+QOh/q9hr5PoXA1f5f70dPLIOIvsmQTTM7S+es4mh3s9zEtvLshWvr2XPA
 Nfpt/0r20sN3Zxg6BgFFKq9PGD11k1BWiVrFh1+kfixek/hpZLz+8NKmLNYLBLfCtb5A
 yTxtnFii2scV8A99Hc5/onxhsD94zuiukSaIXwYYOfIR0rM7dbLBADIhazsCmFHi3yRu
 YlIm7rT3kcA28THtOvZx4n923KUjdHPsc5YIaiUs02WEuLuh7UTfDoDxL2GXlRtFjZgk
 TpLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Bkg8g5mU
Subject: [Buildroot] [PATCH v2 17/17] support/testing:
 TestPythonPy3Txtorcon: use python base configuration
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
 support/testing/tests/package/test_python_txtorcon.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_python_txtorcon.py b/support/testing/tests/package/test_python_txtorcon.py
index 6f0c4ca1ed..107f53c6a3 100644
--- a/support/testing/tests/package/test_python_txtorcon.py
+++ b/support/testing/tests/package/test_python_txtorcon.py
@@ -3,14 +3,8 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3Txtorcon(TestPythonPackageBase):
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
         BR2_PACKAGE_PYTHON_TXTORCON=y
         BR2_TARGET_ROOTFS_CPIO=y
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
