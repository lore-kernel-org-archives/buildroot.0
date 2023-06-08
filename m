Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D427C7EE29
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 18:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23BBC611D7;
	Thu,  8 Jun 2023 18:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23BBC611D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jk5aTOeNcXrT; Thu,  8 Jun 2023 18:10:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B77B6151C;
	Thu,  8 Jun 2023 18:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B77B6151C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D285C1BF3E1
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC852403EA
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC852403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DuY4E_YpyM4F for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 18:09:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C28BA401CC
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C28BA401CC
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 18:09:00 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30ad458f085so735494f8f.0
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 11:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686247739; x=1688839739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BHeQPuOKUkdexGvdVu/L4rhn35Nfht/1Wk9L1v0yHTs=;
 b=Y3AtG7MAPnYjZFKgM5oda35qdlu6FAStWpttzmkgvdAqug4pC8jArprqyD1yHBgpTb
 jUW2w+b5rU4T7g7ZJcAOtr/M3DOpQZ7kwL2vQYOtpDQjAIZFCBKZ6aN81FjTp1TU2fbe
 OVkgGAd9sC4GzVd57B6PRR/mQlWQogk0cRbK1cqaor5RIYEH20QcMOFswlV7GFmNE9Y7
 rfwiNcoLV4Phhjt7NmhRxZv/ubu7VnyQaV+t2+n+tDTeAd/Oa7mheou746jN2dPKoN7T
 FP8dEC+60U8YCUvgLZjo/NyLCw4DI3avCkYuEzRcSZSpIrf4s/Wvnc2Mrgl9KGvNd7a/
 +2Sg==
X-Gm-Message-State: AC+VfDxBoiMzhCxdSLzUAH9VW9peSzrgoRzkWb6u/s3j7MVp+iMRHGnO
 xgtAzenPg+ByBaaIubUfHKsJTU5KwXY=
X-Google-Smtp-Source: ACHHUZ41iND1/IRfplrVT7xPGME39b3i7LlGzjOYDFUQIPV2r6mehqjp5VCgVXfbDuQLtteLJIdMsg==
X-Received: by 2002:a05:6000:1b07:b0:306:2c20:c4fb with SMTP id
 f7-20020a0560001b0700b003062c20c4fbmr2334063wrz.2.1686247738885; 
 Thu, 08 Jun 2023 11:08:58 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfec02000000b002ffbf2213d4sm2221238wrn.75.2023.06.08.11.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 11:08:58 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 20:08:38 +0200
Message-Id: <20230608180844.189528-10-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608180844.189528-1-romain.naour@gmail.com>
References: <20230608180844.189528-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686247739; x=1688839739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BHeQPuOKUkdexGvdVu/L4rhn35Nfht/1Wk9L1v0yHTs=;
 b=HoJkKb4Ze4oy0ydW6cTBtSNJSXfKuNtiiGk0cJUCFCHXuxXXjDxoUBTcyd7IyjmMvk
 Z/xdJ3yo5ttvYZm7XAaUC3gSmtbbjuPRO7gVubwVX3FMAs14Hw31lyg3RAqQmbf9S/gp
 8rhzAaFUsqgubHKbxtCA08Z3dfZubCKjiAZXharYVD/8oqfY124afUA4rw+neHXKcPns
 1aSbsytUj1ff/06h1EVP6eoNMQ/cRalUbkFDxTFn+PcVari+/0ATYB4OpGbICTjn33QJ
 gUQZiKL0jZ60mU8awjk4QUxSzntJTJizjB1DBOZwrP2cE4Pla/NA4nKFBgP1GDvu5MxH
 ewtg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=HoJkKb4Z
Subject: [Buildroot] [PATCH 10/16] support/testing: TestPythonPy3Crossbar:
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
 support/testing/tests/package/test_python_crossbar.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_python_crossbar.py b/support/testing/tests/package/test_python_crossbar.py
index 178b16be82..d586f32aef 100644
--- a/support/testing/tests/package/test_python_crossbar.py
+++ b/support/testing/tests/package/test_python_crossbar.py
@@ -4,14 +4,8 @@ import os
 
 class TestPythonPy3Crossbar(TestPythonPackageBase):
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
         BR2_PACKAGE_PYTHON_CROSSBAR=y
         BR2_TARGET_ROOTFS_EXT2=y
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
