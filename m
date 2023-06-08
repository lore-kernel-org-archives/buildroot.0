Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0892CC7EE2E
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 18:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B257C61515;
	Thu,  8 Jun 2023 18:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B257C61515
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M22N1rX6hzbV; Thu,  8 Jun 2023 18:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8A0561554;
	Thu,  8 Jun 2023 18:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8A0561554
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C31D61BF3E1
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9CB683BAA
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9CB683BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p4OqE8VTFRZU for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 18:09:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD93C83BA8
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD93C83BA8
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 18:09:01 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-30af20f5f67so919641f8f.1
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 11:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686247740; x=1688839740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fOOTRtqgEkOurnNAb0ppnn8QJQWsTuDrY7G6B/bGpZg=;
 b=Nu0lHV09C2s6rNt9XCXT+ab1Msqjp+zLnghTxao9aPcairy7/IQ9kFV9Aw9ppHBMeg
 EQ7buxCNcqJriU/o1vTEipmaAI1bWZWwYGNDjObNU9VZJ2YFqd2dqutEOXmIvB6xD9DC
 9pGcvbc9ITWGYESZrfEtH8DynSBUBO0dJ1ZlAF/rKjEmBAcVYamv3JyTW4uXxJHbmV0r
 TEq+cvHtBoYzFPDD/KcYuvuDnmRmQEK45M8o74VIargUnnBIzgZX7020z5PQnu5Mn7gE
 Wlq6NynvmUO672QIjnRe3BPt4IS/BIBhlcsVt2feGsFfvLMJuuSVuMHmhXnKulcBVuWG
 VucQ==
X-Gm-Message-State: AC+VfDxNITKFDMY6PSqNwQ628DG7gkagl+aWNXZglS/u17Fbdh2rrM3R
 Jpa8levNCh7jFIIa1ouJgo+ff6yaE98=
X-Google-Smtp-Source: ACHHUZ46koJjXfebiifH+AIexFhmsk2Uc9/KY44L3lH7Y1oAPEI3JIAcM6LkUtbdgZopwKjTZ1qcig==
X-Received: by 2002:a05:6000:90d:b0:30e:3d3c:1b67 with SMTP id
 cw13-20020a056000090d00b0030e3d3c1b67mr7711782wrb.8.1686247740067; 
 Thu, 08 Jun 2023 11:09:00 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfec02000000b002ffbf2213d4sm2221238wrn.75.2023.06.08.11.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 11:08:59 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 20:08:39 +0200
Message-Id: <20230608180844.189528-11-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608180844.189528-1-romain.naour@gmail.com>
References: <20230608180844.189528-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686247740; x=1688839740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fOOTRtqgEkOurnNAb0ppnn8QJQWsTuDrY7G6B/bGpZg=;
 b=VMpAdIt/USD09vkK9Whu0H3F7ow5cTF1udzBu/o/o1jeaZY72u/xgxdshbwB36Gheu
 5+kHTZc2mUlP82MZTCJ2c3N1JRFM8OTgScY/x+4JdXFwXmIu3O9Sr0yVWqjfHcd0eogt
 0NwHKR1UkV3NEoFm2T49oCXBQEiqrn59hiR0Ct3D8COMQqHNvv+ZGT+s5WKDd6JMhecs
 8VM6j7Np8bmj2eaq8w+qvMs+q2hAAS4XXs1pszaCw7h70uy/bkkbaOaajAXMOflUo6jx
 sB1GbCHf6JqpIUUBlGNqsqhXy12/ps9Zk3tR9gixbh24BEGUrTyKQ5XG1yZCtTe2PoX7
 Yn3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=VMpAdIt/
Subject: [Buildroot] [PATCH 11/16] support/testing:
 TestPythonPy3Cryptography: use basetest
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
 support/testing/tests/package/test_python_cryptography.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_python_cryptography.py b/support/testing/tests/package/test_python_cryptography.py
index bf11c02e5c..91446decc8 100644
--- a/support/testing/tests/package/test_python_cryptography.py
+++ b/support/testing/tests/package/test_python_cryptography.py
@@ -3,14 +3,8 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3Cryptography(TestPythonPackageBase):
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
         BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
         BR2_TARGET_ROOTFS_CPIO=y
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
