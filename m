Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB79DC7EE37
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 23:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C48F4241C;
	Thu,  8 Jun 2023 23:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C48F4241C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lXH7DdkXELA2; Thu,  8 Jun 2023 23:30:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FDD642457;
	Thu,  8 Jun 2023 23:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FDD642457
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FBE51BF390
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B318242037
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B318242037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qRzcE5WMwToV for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 23:29:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEDD34202E
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AEDD34202E
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 23:29:11 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f649db9b25so1466383e87.0
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 16:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686266949; x=1688858949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0hcXFbsCTahnT83wqMhssE0yzlSJv8lVj9uo/3MQ+w8=;
 b=Yq4U5eHDknTOk08aMNb4Bjn5u9DywwAEtaNGVmlgxs82TKSSU46fPghSVV8zD0ba8Z
 RWJdhrmvPtp6XM90zQ1o9Tb3KR5T7kePj+7A6bqv1kh0nc2gmJcfKVNiJNxfX4WSZlD0
 skaoRK1mOp1q0YICdLL5okNsWJSUlREVZqhXEaHWxNBB668Pt7lY7KLO9Rs671nQZP6U
 gVL03nSCr8ygSSHXa382PqFhuEoonlxmpzMIsOzI/ItxKGt3O7FFqdKbcl1IdHlxoOjc
 r5P8WUVCbkYSYFLJAVOtLSRCWfKEHKbWhklpPCC6Deis9nEuzq5LZVUdUEkVMuE252r0
 G6qw==
X-Gm-Message-State: AC+VfDx+dZS2S8wuTHRQuyQwlwmWLnFqzMz1sNGvICnz/p5prc6O0iUf
 jH5P5+jDxvVaR5qFUxg6hc+pryVkg2Q=
X-Google-Smtp-Source: ACHHUZ5dzllhG37Rn1TqWHpBbIKM7+osHXilOSCriIQg31LmzBXQnPB2D1YufFTSM6vqKdJXydNTpA==
X-Received: by 2002:a19:505e:0:b0:4eb:1361:895c with SMTP id
 z30-20020a19505e000000b004eb1361895cmr239590lfj.55.1686266949453; 
 Thu, 08 Jun 2023 16:29:09 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb03000000b0030ab5ebefa8sm2757522wrr.46.2023.06.08.16.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 16:29:08 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 01:28:50 +0200
Message-Id: <20230608232859.1245497-8-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608232859.1245497-1-romain.naour@gmail.com>
References: <20230608232859.1245497-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686266949; x=1688858949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0hcXFbsCTahnT83wqMhssE0yzlSJv8lVj9uo/3MQ+w8=;
 b=gqziV6jKvFfQ8etgfyQ+Oj4MQFoOhimlxf3gyXDmpp4WYU2h2xvAl7lpqNny3+3wDJ
 wpcrIAyGB4aNhxOi4/xm6Y4Ry9KVl3hAnQc3IX2owyUQBpFqs5ed+99Ef6N1HTwGPwmM
 pvamur9nYh0F2V4+DQ0mD4hOZZn1OMvlgiDqUwMWvOKsekoIyLJ3wfml+vEUTkS/Lvzd
 y7iBP3eEIlAO+kV+bZbTU6pbEhvmQ34pt2dbez+oAt6Z7V/VAstI7GpPv2WK64X5djZc
 G4Aw/3eKlvTcVDY5g2Gr3BYTBcx/0GXfQllMxHfEeCwnRhHfbS4YB3vGchOpn0x0n5PZ
 m+LA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=gqziV6jK
Subject: [Buildroot] [PATCH v2 08/17] support/testing: TestZ3: use base
 configuration
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
 support/testing/tests/package/test_z3.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_z3.py b/support/testing/tests/package/test_z3.py
index 71b074a587..30794a250b 100644
--- a/support/testing/tests/package/test_z3.py
+++ b/support/testing/tests/package/test_z3.py
@@ -4,14 +4,8 @@ import infra.basetest
 
 
 class TestZ3(infra.basetest.BRTest):
-    # Need to use a different toolchain than the default due to
-    # z3 requiring fenv.h not provided by uclibc.
-    config = \
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_Z3=y
         BR2_PACKAGE_Z3_PYTHON=y
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
