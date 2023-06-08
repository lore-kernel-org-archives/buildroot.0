Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE14C7EE29
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 18:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A56CF61523;
	Thu,  8 Jun 2023 18:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A56CF61523
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EMCcrixGPLYJ; Thu,  8 Jun 2023 18:11:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D89C561524;
	Thu,  8 Jun 2023 18:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D89C561524
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C52F41BF3E1
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D2CE420F3
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D2CE420F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4UNxFlV_Y_xJ for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 18:09:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A06A5420B0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A06A5420B0
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 18:09:04 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-30d5931d17aso685034f8f.3
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 11:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686247743; x=1688839743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9bqjaV+sAN4EDiXSfpA03DLag7xRNZGu8HMvNrJW2CA=;
 b=ccxx+UmUehd4CoK1GcixUSFDDiVsxX/WUOEqIAZDGgej/15lgDl2RwVIsImO+kfeLv
 rzmoiRD5zQ4YdXAWotCcbtVQb7vQiQil4RrLqhSxp8bPVQDFge8sxWBSnIMTVkVDr9cI
 z98PtIR7/calYx0tEywGae/bmR97ogs0LR+kItKt4HyMj/TNlveNA8zvuBLl6W4J/46y
 8APBLE/LEYlH5+ERUpdMvjXkwJhd1Y0aQ21s8VgCD4EW5ttjEpMaCeha6lXuKC5GsN1y
 82Cf2OpYjkHIG4U//gUOjzAJAFmANwH678aEtU5qpjK7EYnDzhbIjMWJBGt1ONsrQ5fp
 JBYQ==
X-Gm-Message-State: AC+VfDw8UQkgNYMbcNV/rgBIzVLVtMqOBVvLzMiFdL5AI8m9sgU/zUqs
 zAGbPEQF8o2fHkZOGfC7197/Kcl6Euw=
X-Google-Smtp-Source: ACHHUZ6/mPDB/g4IxbsFNISb/lMRO1miN4WTZ8eUp+00o5gJ/CPbyHzJD+eVKvGNAjYPKPQv3Tu+Hg==
X-Received: by 2002:adf:fe04:0:b0:30e:59a2:42c0 with SMTP id
 n4-20020adffe04000000b0030e59a242c0mr5480216wrr.11.1686247742554; 
 Thu, 08 Jun 2023 11:09:02 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfec02000000b002ffbf2213d4sm2221238wrn.75.2023.06.08.11.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 11:09:01 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 20:08:41 +0200
Message-Id: <20230608180844.189528-13-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608180844.189528-1-romain.naour@gmail.com>
References: <20230608180844.189528-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686247743; x=1688839743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9bqjaV+sAN4EDiXSfpA03DLag7xRNZGu8HMvNrJW2CA=;
 b=Weh2JiajvjCMdxz7EAO/WrfH+AyjeJ72RpvQ3bnQB0QpKcD4PoMUKwqjzDCrV0gu/G
 wm+93Dt3YBikRDiNHs+QDRcc2/GBzVrjaPUtyl0VvyzERkp0+kKbbbGpVZemRoeR8NH9
 ObJFcwjUuXo2eTUVX0O2xGrMB3/o3G0c111lbFPL82SUtcGszY4PdbCg4rVMEtZZFgtt
 OsrAcxczibuz557rSGIx3vtcUKRwkfR3IOWeWyEC5hsyJ2HNuIJHn49yTboHeOhiFWMZ
 vksye2LPZLJrXCRzqUKWyikDBkm0C5k8w+fz1fzOisxhiLXKZskvDuy5PdJaYb0lWhJQ
 iclQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Weh2Jiaj
Subject: [Buildroot] [PATCH 13/16] support/testing:
 TestPythonPy3ServiceIdentity: use basetest
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
 .../testing/tests/package/test_python_service_identity.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_python_service_identity.py b/support/testing/tests/package/test_python_service_identity.py
index dbad5f931f..d50402f715 100644
--- a/support/testing/tests/package/test_python_service_identity.py
+++ b/support/testing/tests/package/test_python_service_identity.py
@@ -3,14 +3,8 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3ServiceIdentity(TestPythonPackageBase):
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
         BR2_PACKAGE_PYTHON_SERVICE_IDENTITY=y
         BR2_TARGET_ROOTFS_CPIO=y
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
