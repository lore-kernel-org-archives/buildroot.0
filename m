Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E2EC7EE37
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 23:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84E524207B;
	Thu,  8 Jun 2023 23:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84E524207B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HxFAnDmiexAD; Thu,  8 Jun 2023 23:32:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58E0742476;
	Thu,  8 Jun 2023 23:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58E0742476
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B7AF41BF390
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DD064207B
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DD064207B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yz__3deqwb5r for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 23:29:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95A324202E
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95A324202E
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 23:29:17 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f735bfcbbbso8830285e9.2
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 16:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686266956; x=1688858956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hNx/Xdn8PxetPunw2aWWbKTYEyzYuxY2ojOOkQ0N/yA=;
 b=IKUMsqb9uDn+LoJTs/9+aypujGzTLElmmVkbppfmtytQ/viRlV5Lj12x6HlANkTzay
 uqyDrBQPrmbNLTrJPxwxp4QgBJ5XtE1B/kOGc8YEA1xafWshYeJHO7cvgX72ttDXxdG5
 CGpb1uNDJPpFCnmUObdc5Lo16tnPY3ky1dZD77i8uOMBB5MAMiaOBUUKZPgvmM0D2SBw
 IDGnEKFphRB/zN/2aEo9d+l9kPlI4JR0YQ0JU400h9L9y0DIf91E9a12B4KJKDXzOtkw
 7Z2qnQp5BNx1DlXk611K49F4OQZUR/UVMFfeE8z5aADY9kjr+thSylB5hOoBinuFKlvk
 yMLA==
X-Gm-Message-State: AC+VfDwNtdBpC8uZzHQPpjbxzYhXliZgdAb8A3o3C7lzK8R71VJXM0Ws
 Vht3ZRijStpsrgzx2pdp3UA5sYnJ2EE=
X-Google-Smtp-Source: ACHHUZ6a9ZHUJJBDVGHVkybXf/xhD4PSwq1Fqt2/5exVWHfj2AbQfAA6RI/zHJabum9fcsSsGkqvrQ==
X-Received: by 2002:adf:e409:0:b0:30a:efb0:ce5c with SMTP id
 g9-20020adfe409000000b0030aefb0ce5cmr7803026wrm.45.1686266955721; 
 Thu, 08 Jun 2023 16:29:15 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb03000000b0030ab5ebefa8sm2757522wrr.46.2023.06.08.16.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 16:29:15 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 01:28:56 +0200
Message-Id: <20230608232859.1245497-14-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608232859.1245497-1-romain.naour@gmail.com>
References: <20230608232859.1245497-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686266956; x=1688858956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hNx/Xdn8PxetPunw2aWWbKTYEyzYuxY2ojOOkQ0N/yA=;
 b=Ue7YUeoxAXdJnCSrJaOw24dBe3BIISZwsEn459AOEeq9S19KlMFvl3vvGgKqpcqU4Q
 IrTm7tiM0N9yoNX0NSpPmb6JbufgpdfL3sc8COLwoSHa0bnFb1vn50KFVaiGRnE5fQ5R
 tQyZiG2xyNVx0fZWBRjbWav5CG9HNRt+vEyV1U4pF8VVf6SJDUjQQeIqtV7XwMI8jdji
 BxsDqfWtRyjjmNSitvp55/pwB0IDOlUeYIV5baUV5HgbGR4rit9WhoWohISfgpqDn1Nm
 Zn6HtmCMehsHUQVw/07XTfo9hbx1kETDGJ9RU14lq4mMY9+ZklsfEDHSHmLxSiPdudVH
 BabQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Ue7YUeox
Subject: [Buildroot] [PATCH v2 14/17] support/testing:
 TestPythonPy3MagicWormhole: use python base configuration
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
 .../testing/tests/package/test_python_magic_wormhole.py   | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_python_magic_wormhole.py b/support/testing/tests/package/test_python_magic_wormhole.py
index d6541a2480..abd34bca50 100644
--- a/support/testing/tests/package/test_python_magic_wormhole.py
+++ b/support/testing/tests/package/test_python_magic_wormhole.py
@@ -5,14 +5,8 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3MagicWormhole(TestPythonPackageBase):
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
         BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE=y
         BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER=y
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
