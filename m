Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99D6C7EE23
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 23:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D8274247A;
	Thu,  8 Jun 2023 23:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D8274247A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v_u3KVKLtPnj; Thu,  8 Jun 2023 23:31:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 078B042476;
	Thu,  8 Jun 2023 23:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 078B042476
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A038A1BF390
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 795A483C59
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 795A483C59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IZqb0lZp2IEQ for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 23:29:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC82883BF8
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC82883BF8
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 23:29:12 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f7f543fe2fso11156845e9.2
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 16:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686266951; x=1688858951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d3ucrEdqMMVYfy2+2PlzEj+6ju0P8XzsHHWO3NrH960=;
 b=couOEA7BoqlKqjcb9mq6ozMwcTW+aVgJH8xeSRkWWYen+V6ML+R3dgLvBlbBcrwARK
 5DKUmUuHZVxgWl3zPAQVDxfddUmGoZcBM/z8TDqP/vZbfdCHgT0E6Auz0FLuoUa1XzMb
 Xe5J1ijz37zIenHEFvGWw4s8fd1GzqQKqdVdoXuxc9iNX5zP2NErJeNL0/OFbx29zaLa
 Hq3c5XbxhukEFQPVX5DZ3cOwx9uknYAttSlvzak3CGPS3bZy1/caby73OR9gNL4c4D/U
 Sy56O45ci9b06TUkV6K+zgEvqEugGYQdWt/SBFRMtHU8QFXomGxwgn6lAX1rCIt5MiWz
 MDXQ==
X-Gm-Message-State: AC+VfDzZhIR10QsNxqewUqKKtwvWrurgIqmqueOlRFsRMstlXYYkZwhA
 rdhbZ/9a9yqZxoR9exK0RpHwk0pbml8=
X-Google-Smtp-Source: ACHHUZ6CwHbOj0MwXJDOSMd5CEfrgs5QMWD4C9Rq2NTQekv/6vdumBszHDtsO/MVUmlLFKry8NvrDg==
X-Received: by 2002:a7b:ce0b:0:b0:3f7:f614:996d with SMTP id
 m11-20020a7bce0b000000b003f7f614996dmr2361304wmc.29.1686266950665; 
 Thu, 08 Jun 2023 16:29:10 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb03000000b0030ab5ebefa8sm2757522wrr.46.2023.06.08.16.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 16:29:10 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 01:28:51 +0200
Message-Id: <20230608232859.1245497-9-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608232859.1245497-1-romain.naour@gmail.com>
References: <20230608232859.1245497-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686266951; x=1688858951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d3ucrEdqMMVYfy2+2PlzEj+6ju0P8XzsHHWO3NrH960=;
 b=DHuqFukRf+G+moEiZUq5Nm9hjuy0RjUEkV9gU+PnpAo2Uixdt5OTRU16ok1ItPMPa3
 /50Llep3HGQs5Mk498ySYHrqpwoQrkrjObqLqyzxuC79wtLe3NIZuTH3rmRu853yKc7x
 cbEEa5ZYHdvDBbLNO0cIG5ozvnAn8tGGaqyOkDFLvX9U6DqIvOTOZjYuszmIHBxt1fvw
 gtMG93Twh7vKZYyUyeKt82F5JqxyPFzjOYC7NyavWu5rKC1lI1rpVXp7lpSh4UY9tQ1D
 +8DBWHS3DpRp8pKJT5fHuRWxtOxzcbKsJ2pOtAgK3a6NGd+HyLLCHmq3t+TuVlvpMdrB
 wOiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=DHuqFukR
Subject: [Buildroot] [PATCH v2 09/17] support/testing: Test{No, All,
 NonDefaultLimited}Timezone: use base configuration
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

While at it remove Glibc from the test name since all Timezone
now use a Glibc toolchain.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/core/test_timezone.py | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/support/testing/tests/core/test_timezone.py b/support/testing/tests/core/test_timezone.py
index f661519196..0e5009494d 100644
--- a/support/testing/tests/core/test_timezone.py
+++ b/support/testing/tests/core/test_timezone.py
@@ -26,11 +26,9 @@ class TestNoTimezone(infra.basetest.BRTest):
         self.assertEqual(tz[0].strip(), "UTC")
 
 
-class TestGlibcAllTimezone(infra.basetest.BRTest):
-    config = \
+class TestAllTimezone(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_TZ_INFO=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
@@ -48,11 +46,9 @@ class TestGlibcAllTimezone(infra.basetest.BRTest):
         self.assertEqual(tz[0].strip(), "CET")
 
 
-class TestGlibcNonDefaultLimitedTimezone(infra.basetest.BRTest):
-    config = \
+class TestNonDefaultLimitedTimezone(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_TZ_INFO=y
         BR2_TARGET_TZ_ZONELIST="northamerica"
         BR2_TARGET_LOCALTIME="America/New_York"
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
