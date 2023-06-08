Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC6DC7EE25
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 18:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 166F761502;
	Thu,  8 Jun 2023 18:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 166F761502
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0RfJCSShhrt8; Thu,  8 Jun 2023 18:11:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48E936153A;
	Thu,  8 Jun 2023 18:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48E936153A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7EE711BF3E1
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56EEF420F3
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56EEF420F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UJZXcbmC96BZ for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 18:09:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57981420B0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57981420B0
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 18:09:03 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-30e5289105cso727950f8f.1
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 11:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686247741; x=1688839741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uUMVMR5rPzG7Q1663WgTDlHKoLBkA081fwlO8B35roA=;
 b=FR7aZ/WZ4O0lvwOgt/eSvkDyf1H+jRmH22f/NlK4F9dzPU2kgD44L/mwIn2ItzJBFM
 5rmC4XKiE0dyf0LRHqrhE6NVU7qwnrnfltEYh9Spv3Xx+w2DfSwZPWTu06KzJTbtc3xX
 jbv6HBHvpeXBSm4qno5L1mMjlTH4kgglzuq5Y7QNVo+XjpROXNzLngzwB9cU0qzM5CFq
 YTgVEoL7owBQha2E8ki11pdY/bm/l4Uf1PyghkuJGtJicg1O5ymwtC45r4SrNhtOBJiR
 2lYDaZy92NTqyilmRakTNn2aqsMfdq7R0PMmQ+qnDQxt47n667DLcj/cyCmAsUIdsyAy
 Z0AQ==
X-Gm-Message-State: AC+VfDwJ4jKNuNg0BK2ASbQ/UtIM+Hwly8KtMlxNhDMShZqluLKovcu1
 fnxiKLvHYQnI8bTvRvKZNhLQD3nuAqc=
X-Google-Smtp-Source: ACHHUZ6Opi45jx3ali0TEJUmj/P5RmRvJH7bNDHlCZNiwLjEQmhwjnacqnAjHKlLFZgFlWMSuZLyeg==
X-Received: by 2002:a5d:4248:0:b0:30a:e901:bc66 with SMTP id
 s8-20020a5d4248000000b0030ae901bc66mr2024994wrr.5.1686247741485; 
 Thu, 08 Jun 2023 11:09:01 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfec02000000b002ffbf2213d4sm2221238wrn.75.2023.06.08.11.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 11:09:00 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 20:08:40 +0200
Message-Id: <20230608180844.189528-12-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608180844.189528-1-romain.naour@gmail.com>
References: <20230608180844.189528-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686247741; x=1688839741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uUMVMR5rPzG7Q1663WgTDlHKoLBkA081fwlO8B35roA=;
 b=iMMlH+cn+3O32Lg0M+VJI3VbfuuEUCuKz36WJhTvCAAjpx3JQ2TJobduGdg/Cl4L6Y
 PQ8Ul6igxLhFSABhD0E+dQHHq3xhyb2roziIzrlK6oECgBILu0XOiK/MtSO8VDZHEXPX
 7/cs9Rdmmt4uSaG1WeGaRS4Vhs08WogWXdxoKex8/f1uu71vHWNO/l+xZl/0oxBqW9MO
 GJ+RESE7rqsrk5R5ASfY2suVn4cPoFYSnQyNukc8ZzymoaiZJsUyScw/bYFtMW6DadhE
 IsyNtBeWSIJLO2R7zvpm92oCOyMXL+UeFHgWXUOHdQazvxyginIyqL+dXwvJQUytJVIU
 vkGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=iMMlH+cn
Subject: [Buildroot] [PATCH 12/16] support/testing:
 TestPythonPy3MagicWormhole: use basetest
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
 .../testing/tests/package/test_python_magic_wormhole.py   | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_python_magic_wormhole.py b/support/testing/tests/package/test_python_magic_wormhole.py
index d6541a2480..9869aa783a 100644
--- a/support/testing/tests/package/test_python_magic_wormhole.py
+++ b/support/testing/tests/package/test_python_magic_wormhole.py
@@ -5,14 +5,8 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3MagicWormhole(TestPythonPackageBase):
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
         BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE=y
         BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER=y
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
