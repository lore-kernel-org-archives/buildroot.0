Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E721AC7EE23
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 23:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A8234241E;
	Thu,  8 Jun 2023 23:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A8234241E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJ33w3Q1I-K0; Thu,  8 Jun 2023 23:32:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23B1E4245F;
	Thu,  8 Jun 2023 23:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23B1E4245F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E122C1BF390
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAB0D83C59
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAB0D83C59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id niWuVK1ZR8FF for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 23:29:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2DB683BF8
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2DB683BF8
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 23:29:19 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f739ec88b2so8766685e9.1
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 16:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686266957; x=1688858957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OFCju1L7KRajTRTTPYb8YgEk//IhdzHP+1ZUHGRa1wI=;
 b=f3mfvFvaJNIhyYizVvP5+ZxPKhIYzGee238vby6SQIMDKCqIyXRAIRQbYU+bFjGitR
 K23CiEy6p8CaDsdrxaZj/0bJ1v67pGi1+mo6LJ2t+5JIYxCvkC1mvCxzk+jK0wWHUrrc
 sUVtos5G+UP5elDGhiibMSFG4gMmEloxfp+y+UpXU4R85Lnd2gSmXp8KsaYYIEMIGiur
 Flm6lipQhQT0BN9Mtfb9yPO3PU4B74FD7pdOOJ/ObF4uMNSGCmq9dqAXchZh2QrikhO+
 NtR/qDxN/pnlYA8mblB+wGDfGCWI87S6ULulPXfPs3d0mhCVdMDr3yXw01pxGIfymG3V
 tYvQ==
X-Gm-Message-State: AC+VfDyExQCK/STDfznssdlHJWe4nqxtKnwpM2Wj3BPE9hJQiJVUBoy2
 gauqbvI8ktBetORbHffioKa7j1GPCyc=
X-Google-Smtp-Source: ACHHUZ5c65J2ouyClH0XqYSrx3JKaxUHm06FOu5TcUn4R9RLsKKJmVMdKIxXCoTsmy8D4bZ2VNNDzQ==
X-Received: by 2002:a5d:4e8d:0:b0:30e:5428:2a00 with SMTP id
 e13-20020a5d4e8d000000b0030e54282a00mr6347465wru.32.1686266957602; 
 Thu, 08 Jun 2023 16:29:17 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb03000000b0030ab5ebefa8sm2757522wrr.46.2023.06.08.16.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 16:29:17 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 01:28:58 +0200
Message-Id: <20230608232859.1245497-16-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608232859.1245497-1-romain.naour@gmail.com>
References: <20230608232859.1245497-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686266957; x=1688858957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OFCju1L7KRajTRTTPYb8YgEk//IhdzHP+1ZUHGRa1wI=;
 b=MgA6JoKb394QWpFobHjq7xvCrnM/F/Qs+IduNHUJnESwc9gE8AZz5NM9DG2mf9UXDI
 R6OeGeI0T9xl44C+BBP4NJ9+/JmznqiRZg2yFI0dwSFzZrVLmZxL1JLayW14pGfhMAOX
 5G6qHcFrcwcZg2CNVCdFJyuPn4ENO+sBSfgbVDCtWhNPtXoazF/fbCUR1G+qh1ox+L5w
 VgGgehvVapnWTClaoJKOhoLG/6ixpe0bYQ4Rr54xhQoQUKohEU9ZbUOGPMmksnop4cNo
 Y/anCv8WRUS5rS4Cquhm5aHVXIVjFOXTsMeJwdQnJR8Jo5tL7UnxK8F9wgYtLkrT+O7a
 Ptiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=MgA6JoKb
Subject: [Buildroot] [PATCH v2 16/17] support/testing: TestPythonPy3Treq:
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
 support/testing/tests/package/test_python_treq.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_python_treq.py b/support/testing/tests/package/test_python_treq.py
index 515f1ea304..bd472d3b39 100644
--- a/support/testing/tests/package/test_python_treq.py
+++ b/support/testing/tests/package/test_python_treq.py
@@ -14,14 +14,8 @@ class TestPythonTreq(TestPythonPackageBase):
 
 class TestPythonPy3Treq(TestPythonTreq):
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
         BR2_PACKAGE_PYTHON_TREQ=y
         BR2_TARGET_ROOTFS_CPIO=y
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
