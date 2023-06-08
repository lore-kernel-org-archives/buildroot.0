Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394A9C7EE23
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 23:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC27D42473;
	Thu,  8 Jun 2023 23:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC27D42473
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Hcn5JdtIXR8; Thu,  8 Jun 2023 23:32:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A316C4246E;
	Thu,  8 Jun 2023 23:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A316C4246E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C7C81BF390
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33A68405CD
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33A68405CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jtu7-6RaREBz for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 23:29:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 514DC401C2
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 514DC401C2
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 23:29:16 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f62b512fe2so1516770e87.1
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 16:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686266954; x=1688858954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oQbfTMMAJi9JrYpBMKrG47uUs0P3TUIp4LtIk2TW+/U=;
 b=Ff1d++JlxTOruplA7o7R7YK6/8vwrQ2XBrMs6FWW1K0JAu3j5Gi+TbGL0whMV7daBN
 KPTghIz3rwfhchO24H9oAAdgHr+mcT46p8JGplck91uClB6aQF206QoFPCq0zvvZABxD
 l4AIMb/qMLWoXqkqg7WU/ERKCRF9Y30LDsqZNoxuvXEoT914Hlf/eCYoupmgoEfwO8Se
 UU0yr24SyCVcyyK++S4v9xv+rkcGHlntmGfDoqUl6OMN/Dajf3KWAbDrLWMFkc/KUWmK
 ZTIKG4Lhja99NIEKQ02Mn2wusrjMhhganCKlfLM5FxQ6e/lteDQoizSZR7G+y71DhFe7
 oNpA==
X-Gm-Message-State: AC+VfDxT4ikzMDSoG4+Aw6TXLVycQg4RbwHZxHqrsTGQBr0g4RExYhIK
 A/zNMebhH1WFAo5OTEZc2emVGra643M=
X-Google-Smtp-Source: ACHHUZ4Kog2QL1Ysw+CXgx9g59QiT6jGTCFmbanGWevA6ADp8MprBF+IMnlmfwhvy38TzzWIPI0Z2Q==
X-Received: by 2002:a19:5611:0:b0:4ef:ec6a:198c with SMTP id
 k17-20020a195611000000b004efec6a198cmr252207lfb.26.1686266953911; 
 Thu, 08 Jun 2023 16:29:13 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb03000000b0030ab5ebefa8sm2757522wrr.46.2023.06.08.16.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 16:29:13 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 01:28:54 +0200
Message-Id: <20230608232859.1245497-12-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608232859.1245497-1-romain.naour@gmail.com>
References: <20230608232859.1245497-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686266954; x=1688858954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oQbfTMMAJi9JrYpBMKrG47uUs0P3TUIp4LtIk2TW+/U=;
 b=PqTfLVRYcH4wXY/LGZKj2kNnDONQORBTAgqwHxssu89x0iS/d39qUUJt2QjewJNrHg
 agoArfiVKXIK7cdclw5I4HauzCV0ijaTV6dyNAumlYQetkWkH9kpaEVeUq4MqWzzsbDT
 RqKi/csGvrYdw+4P26X5jxplKqjYCicBbo89eMmkkfYpbS1YuzjmZrmHie2u3uSguKSC
 xXn7OxEW+7FEHh1n9UH2OZLFXcRW5J+Fsao6dRoLtsqODAtXyGmYqtU+p68Wv4q+fTuI
 kiMXpyRWDJrcbkkjgsBSYjfFBr3vyNd6YxY0EgCyGr+4SCGtG0BynNBj8J5PbJ5IrQKb
 dGvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=PqTfLVRY
Subject: [Buildroot] [PATCH v2 12/17] support/testing:
 TestPythonPy3Crossbar: use python base configuration
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
 support/testing/tests/package/test_python_crossbar.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_python_crossbar.py b/support/testing/tests/package/test_python_crossbar.py
index 178b16be82..e67ab9ff6e 100644
--- a/support/testing/tests/package/test_python_crossbar.py
+++ b/support/testing/tests/package/test_python_crossbar.py
@@ -4,14 +4,8 @@ import os
 
 class TestPythonPy3Crossbar(TestPythonPackageBase):
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
         BR2_PACKAGE_PYTHON_CROSSBAR=y
         BR2_TARGET_ROOTFS_EXT2=y
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
