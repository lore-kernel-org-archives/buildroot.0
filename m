Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1901DC7EE2E
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 18:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8F6E61535;
	Thu,  8 Jun 2023 18:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8F6E61535
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lkjD9CT0C9UT; Thu,  8 Jun 2023 18:11:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F08D861541;
	Thu,  8 Jun 2023 18:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F08D861541
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E93551BF3E1
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C376483BAA
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C376483BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id osf9El_oiO1H for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 18:09:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B1D083BA8
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B1D083BA8
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 18:09:05 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-30adc51b65cso923853f8f.0
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 11:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686247744; x=1688839744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L4+HLwLgZbAb3Dj8EmpnkuU+cgwMDXMOLJFGZXACG3s=;
 b=DGzsVtMEptGLYmcAKvBuUn7QQak94TFfKUDWuLt8LE8quyiPaZlLLEHnoUvrTB4mXh
 ZtROHOn5CuTM/6u3axsrHJ8kefzBVtFcZLtk3K1eJ+h+LrfhrzsoP0A/40Hp2l+d3D8W
 4SyM2FRt/cfGBngR6vrVLTENJPeLzfwdgfexLfszZdqnunbixiUgvDk5RQm6vPxzqh+4
 6DeiZr14Qyldl/Bkbmi2Fh03/hFfiFeFYb3X3rw6ToRMOwQ3LmcR5AWYYxRX65RQkCNN
 1qz1sd78h6p3rQ0Jbiq1mjZL7DmI38n0nIj3AI5Vira5tPMlKTbc7kQRy5uEc1qrOBCv
 qZ+g==
X-Gm-Message-State: AC+VfDySeqWE/3gZDemQmjvqHLMwpuxoOY+7xji8FiUzKAk6DsuACH4t
 pGaYtItBdWPzeivQ2K8e4YEjCE0IMrQ=
X-Google-Smtp-Source: ACHHUZ5CSiweJ2z92fMr0QX3s388uUkjypdcrNElpWpeljb/5PcbACYQ97UDS0a5iBXKXnpUDLU/2Q==
X-Received: by 2002:a05:6000:4e1:b0:30a:f0f0:1277 with SMTP id
 cr1-20020a05600004e100b0030af0f01277mr10608613wrb.2.1686247743832; 
 Thu, 08 Jun 2023 11:09:03 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfec02000000b002ffbf2213d4sm2221238wrn.75.2023.06.08.11.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 11:09:03 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 20:08:42 +0200
Message-Id: <20230608180844.189528-14-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608180844.189528-1-romain.naour@gmail.com>
References: <20230608180844.189528-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686247744; x=1688839744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L4+HLwLgZbAb3Dj8EmpnkuU+cgwMDXMOLJFGZXACG3s=;
 b=Hk8NHmx9O3Vd6mAHlXRT+2S0+W+aLjP+If8J1mNtBy2LRJ7IVDHfUj+QERB16wB9NP
 zTxtrEJLR+vDhCktFE58w4mYsj0OwxkMGLWxutwQwkVrqmPljsm/x0hu2fDbfBSf/FxR
 N73v+kysp4TNKjrDQOLGBGAc0GuuCxCmIOqeIxEU2I7Uy2avIZ4LGRNERhFZjqMtLPzD
 SySmwM4Likd9UpmlLE5Tpg4bvOUXbQi3qqIj8VB/BIFi60KqQDty1AsLfKbOkJR3RnGS
 j4Nv5eMnkRH4FE+zhMihhAui/P/TVphI/rycOLJWDB71odPXTLDZVZZh+c51XKSnuvgt
 1wHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Hk8NHmx9
Subject: [Buildroot] [PATCH 14/16] support/testing: TestPythonPy3Treq: use
 basetest
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
 support/testing/tests/package/test_python_treq.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_python_treq.py b/support/testing/tests/package/test_python_treq.py
index 515f1ea304..bb6e1a90aa 100644
--- a/support/testing/tests/package/test_python_treq.py
+++ b/support/testing/tests/package/test_python_treq.py
@@ -14,14 +14,8 @@ class TestPythonTreq(TestPythonPackageBase):
 
 class TestPythonPy3Treq(TestPythonTreq):
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
         BR2_PACKAGE_PYTHON_TREQ=y
         BR2_TARGET_ROOTFS_CPIO=y
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
