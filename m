Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC784C04A6A
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 16:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83DA361244;
	Wed,  2 Aug 2023 16:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83DA361244
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3A-IX9n9s4Xy; Wed,  2 Aug 2023 16:48:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4CC36124C;
	Wed,  2 Aug 2023 16:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4CC36124C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 306371BF3A0
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 16:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9315340315
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 16:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9315340315
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i7bAnlneGkmS for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 16:47:37 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58BDB41DCE
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 16:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58BDB41DCE
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso25834f8f.0
 for <buildroot@buildroot.org>; Wed, 02 Aug 2023 09:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690994855; x=1691599655;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a9fHII5r3Tg2/WF/UHyggQ2Z4zrxGUSHa4uXTSL8foU=;
 b=JiFCY4rEKTjD5NtvbmaxeB9RbtL4PA8H6FH3RHqfesP+TaQo6SsYqyfz+0CxFhKT0L
 tYqR1UHvPKkI+JCxiE/OP9x7Ft7LeSNUB+CvMmBOmTh6pYX5P8wRe8aWp8tn5AoQf/aS
 x1rXOUahEunY0hxVkavFLxS+LP1gJQ6FK3NyobHYcaCeODIwoKoVxuTP+rZ5lwGsdogX
 OSVOMKGgwPhXYoEVmNsnh8xrRq7XHqVbwKMJb5J9O9ft8o59VuHknPDNMe7ByEF4X0D+
 ARkRdwvEsarH+25c05in+kENZ1D5VWaWyxTXMG6QitZ248tvrahay11wQOmA5ssAStTJ
 FsyQ==
X-Gm-Message-State: ABy/qLbTTq91EHyEMXIfGAFdfmCm+czj2mPzDxFQinsoZkP/e0xJiq8K
 wsoQa+EkL8ZfUckgIRkK761CcpnItg0=
X-Google-Smtp-Source: APBJJlHHfQAXVlb9hoopbpbVIpayv4z3ys6FIfQOuUDryzJ0Wv7qK221D7sK7C1S16CvIP62EJY1fg==
X-Received: by 2002:adf:f9c3:0:b0:317:66c0:9d82 with SMTP id
 w3-20020adff9c3000000b0031766c09d82mr5276486wrr.64.1690994854938; 
 Wed, 02 Aug 2023 09:47:34 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e00eeca726b991c1980.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:eeca:726b:991c:1980])
 by smtp.gmail.com with ESMTPSA id
 y1-20020adfd081000000b003179d5aee63sm11349703wrh.91.2023.08.02.09.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 09:47:34 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Aug 2023 18:46:27 +0200
Message-ID: <20230802164628.389812-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690994855; x=1691599655;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a9fHII5r3Tg2/WF/UHyggQ2Z4zrxGUSHa4uXTSL8foU=;
 b=f07X4IdJggCJKlgKsSz8LDh1CHmLjyFq87oTgCtcMTKUwJMmtbmH4YpU2GkRvy/QwI
 vGerb2C96oR91zn9GI8YnvGqttCFCJWUo91bdsUx34OmHqc+tr3dgaksa26/hQI0BLYF
 U7YUswzs69UQ5LOZOEyfsOIs4g0GGyB7R8rBOKp7gB+8wdWSFYvSULkTpWH9eBB9KcXx
 9ydPLSK3NjLizmZN4ylC0VMUN4q9L1nCeVwk50MFQ/bHz/NoqqGYYxN9pPEoEfY0lN6T
 xY8nabHi10XKj/v2cKFUNBlx8BMhyCyMlgZo9gDY6vgxDZ5vKMPNpMlsCuX5rXn3fDKk
 ik2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=f07X4IdJ
Subject: [Buildroot] [PATCH 1/2] support/testing: TestLxc switch to the Arm
 Bootlin toolchain
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

TestLxc uses systemd as init but the recent update to systemd v254
requires a toolchain w/ linux headers >= 4.14 to provide
LOOP_SET_BLOCK_SIZE [1] (added in systemd v253 [2]).

Since no other toolchain that the Bootlin one is available
switch to it.
(ARM Arm toolchain requires BR2_ARM_CPU_HAS_NEON enabled)

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=89e4fdecb51cf5535867026274bc97de9480ade5
[2] https://github.com/systemd/systemd/commit/1163ddb386ef46f63942171e6eab0ca64eb818e4

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561390

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/package/test_lxc.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/package/test_lxc.py b/support/testing/tests/package/test_lxc.py
index f66b31f3ba..5be4782e2d 100644
--- a/support/testing/tests/package/test_lxc.py
+++ b/support/testing/tests/package/test_lxc.py
@@ -10,6 +10,7 @@ class TestLxc(infra.basetest.BRTest):
             BR2_cortex_a9=y
             BR2_ARM_ENABLE_VFP=y
             BR2_TOOLCHAIN_EXTERNAL=y
+            BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
             BR2_LINUX_KERNEL=y
             BR2_LINUX_KERNEL_CUSTOM_VERSION=y
             BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.38"
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
