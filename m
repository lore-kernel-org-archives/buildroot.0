Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC00C7EE23
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 23:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5E224245D;
	Thu,  8 Jun 2023 23:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5E224245D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZRHy9mtk745S; Thu,  8 Jun 2023 23:32:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B70742483;
	Thu,  8 Jun 2023 23:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B70742483
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE4541BF390
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8756E60EE4
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8756E60EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RgsUuyMzVNg0 for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 23:29:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B270360E5D
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B270360E5D
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 23:29:16 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-51475e981f0so2063810a12.1
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 16:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686266955; x=1688858955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n1ND19/PqcXDRBkyOk25oCGyueyW6b19cmodd49o0Aw=;
 b=BO0MTv6MMonE9y31VNl9ifGU121chb3x/95lvQABmglIBU5irQmkBa+cb501RLu9Qj
 9IoCqVWZVj7qh0PjHO2+PirbYvPFgbk/ezzVD8szVQF+OxzrGyuOxzTrKRCuQm2ePfnV
 0cHzk2g+E23s/86oPh4w7ijLGHxW5hsghwEG8pr7VxeHgR+bgn10PLfuY4C3OfRQKQET
 nRiiUxrdKhkyob9fH8PVHadTXAekoMvzRrwY7jS2k9GEfxvPMOHaeGOt4Z8egAFRvNrM
 wu0Whs4Yl391YH2SE5NPxZfWViAmydz1Z8KHt2sTkYHpoxtCHXwHrOwwRw3aK+TsAcOY
 E5cQ==
X-Gm-Message-State: AC+VfDweqhqLt+jISS7dvy3ZRs/X4+73Fi71GwKsvC++Q/dOhihJ2BEc
 2ix7IDtt0WJStDaeoQyU6dqOCKb1NaY=
X-Google-Smtp-Source: ACHHUZ79fNcXA5NWyyrPs9QEIZUc8Z5RE9LJK9zuRAhwpW0sio2+UHivgfwz478rHA55SrFebVZH2Q==
X-Received: by 2002:a17:907:7f23:b0:973:903c:35a4 with SMTP id
 qf35-20020a1709077f2300b00973903c35a4mr633505ejc.65.1686266954863; 
 Thu, 08 Jun 2023 16:29:14 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb03000000b0030ab5ebefa8sm2757522wrr.46.2023.06.08.16.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 16:29:14 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 01:28:55 +0200
Message-Id: <20230608232859.1245497-13-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608232859.1245497-1-romain.naour@gmail.com>
References: <20230608232859.1245497-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686266955; x=1688858955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n1ND19/PqcXDRBkyOk25oCGyueyW6b19cmodd49o0Aw=;
 b=XMdv7NNyevBNnJsltbOrRsqHZX8OBuSiKXSCCi2+Q4zoO59t0Hax0xDVZmTQXabbTS
 BQplnUnbZgxwAOf4IbgpSAfm7qfu4MhVbSp1lnuEUIq9N/8bAp/lAVhuwhFsEtt+PofO
 s2c195RIo1aWNUv8dAQS+haQ6e4RgmWoNiwrUzRw7enZ4XCN4dlZTA8xLtmJ0+ZXDt7E
 Se23dlrl4OmdNnFL1x4RgSCBvxyvM8ja7mGXurILIFj/laE6TJcy+5DQ8+9W42LpYsEt
 o4JmQnu5WOc/lv54KFi0ckG3dYhjKdVslGil3mt6WkZgbtW7wiPoDPoKmytKJmvIa0ab
 Jx3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=XMdv7NNy
Subject: [Buildroot] [PATCH v2 13/17] support/testing:
 TestPythonPy3Cryptography: use python base configuration
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
 support/testing/tests/package/test_python_cryptography.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_python_cryptography.py b/support/testing/tests/package/test_python_cryptography.py
index bf11c02e5c..ee8e75f885 100644
--- a/support/testing/tests/package/test_python_cryptography.py
+++ b/support/testing/tests/package/test_python_cryptography.py
@@ -3,14 +3,8 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3Cryptography(TestPythonPackageBase):
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
         BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
         BR2_TARGET_ROOTFS_CPIO=y
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
