Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EB4F557FA
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 09:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40615826D5;
	Mon, 20 Apr 2026 09:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Mf9bizk8SBU; Mon, 20 Apr 2026 09:46:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E7FD8269C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776678395;
	bh=vypjoQNXbLNeRGcxhpUszvKWINgKvC3aCiI4p7X0Sew=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=aGgknD+wE5yfsWSS9bGJIk95AXOgBCkgW55EPtHpebhCUXhckcAQh8RP7MIfvXKHP
	 ITtxqiQWgzYqKJxt1oYg1haaA4/kW7DfFNArbe+YrWWWJb4QWwp7FW9zdGe+2hpR8X
	 PSEeIcjpt78rAGFrBDakcHMZY6RfSlpG6DIRvDaI45XKMfxxCMxIX590uN3CnAnwCI
	 fFHzzmyc5gJO0GPDrFzAkx1KFH7DvE+VGllV29JeBQCQSpR9fjEN79WFaYaN/sXG1n
	 oHfX2XC9C2zkT7Yu3jjI0fKw6tPtrEpa+T2LL9/tQ5ZwtWIlq5yTqJP5CgOcUSUC74
	 5LI7+J9JGPNNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E7FD8269C;
	Mon, 20 Apr 2026 09:46:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF4E0355
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 09:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0C0A826A8
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 09:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aswVhzyX_tQd for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 09:46:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E04C82690
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E04C82690
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E04C82690
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 09:46:32 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so38158465e9.2
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 02:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776678390; x=1777283190;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wKSLQ0OSloqweBXYYZ4aUUJNi6QeN2tw1JkNSzqjbA8=;
 b=QaB4Xg7MRXQgQ0OO4sQMEo/Dgv8cWDQ6mw/S5/6zLz3LxjcNVprYKps6s5ZvIzQAf1
 S5nq3IZegePbCW1JrUVu/YaWnVhbOGVvDFIebx8SGLBRq/Ne2f7wrKnEKLhETXQoetdt
 32WYYNj5Q637hC7UpBc5xJ3LhSEgTxiu6fkTE3bjTZLKE1IehA5XQcSiB4htk+/ci1Kp
 Futylo70lETFag4CtWUNvdrX5cn8m+jMCNVpDMTk9KtEIcUwmOocG6vzpunpSgf0iSCc
 UQUJ+R42yxcOvwAYaR/87k2WrMxjR9gVYHz1Qz2hASU3RD/JOqL523d8QhRQKY4YA5Ci
 GolQ==
X-Gm-Message-State: AOJu0YwkOSr07FkvPtmLx5J8kNPZfXIhZ1/Vbw/B29nWJ0zGWLU36/kx
 XprQ6q5tfUOUYMZ9euWUencDGDmmraMcvkFXagH55NY9zRfFOsOSqPDxE3zY1rp/W+wyRrElwEY
 Y0ouABqE=
X-Gm-Gg: AeBDietqwlgiqRtcUDWk6MfmmFX5WnCZHsQ9XKkedIVuCP4wEa2uzeQJXIqb+y49AI+
 exNJs2tNYHc4mbvSSWOgH2hDWIfpLJcyNgZz6iPEFYWx5i9h1bp+TGwypmTvP49ryNRt5Yea/AG
 AQ0eL0j6qMUlG18cyndYeu25eGhpAMbZkzAIqWzbOXQQ0G5JO3WKF2DL7WNOLCZa9NUY4d+tbxk
 Kx9Yh4wg1g+XsFaNPs5rcQIIwsOzoZhrPPWzciCW6lgbjE6X9Mpe4L6o+610T34FJaMzmOfsgv9
 iL1yGlr67od3K47B3q8Uf1FdgOh8lQuqobjuQRVoKxPPM0eS+khn2KVXFX1cxSd7KmR4PZRrVg+
 aMJYdi7aBSrxk4NcWKYZ6fKxJnWt6887f+33jqw5Y7vQdzS7Om6aMNu6McZwvbQdCoQ+MzQ6UVo
 /KJjdl6QTkI0muG0ElnQok2BkIza4mWq/UvsWYdeGaZfyGAdCo5vWqLPOI/cIxKGY5KMJkBaYYz
 S1Jwbc0cGxRxgf789vS0rZOEVNbxe8=
X-Received: by 2002:a05:600c:a318:b0:488:966f:70a7 with SMTP id
 5b1f17b1804b1-488fb746c49mr128997785e9.2.1776678389582; 
 Mon, 20 Apr 2026 02:46:29 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891c318636sm69942495e9.7.2026.04.20.02.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 02:46:29 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Mon, 20 Apr 2026 11:46:22 +0200
Message-ID: <20260420094622.349566-1-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776678390; x=1777283190; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wKSLQ0OSloqweBXYYZ4aUUJNi6QeN2tw1JkNSzqjbA8=;
 b=e8bVBzaacEB9Q7oduLDITWvb2ifincldN/42cPYTgvY787ISPMkh9xLR6BXUXemVYr
 KGPJ2V+iKrS8u7jiga6zTzz6863pp3TFeiXaY2tq4ZPrmnuri+rhmskHyVxhIsKrnTgV
 x/J+Pvl1QFc9XBxrSVBzgk1b0WmjPvau53QV4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=e8bVBzaa
Subject: [Buildroot] [PATCH v2 1/1] support/testing : test_openjdk : Bump
 kernel version to last LTS (6.18)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This change depends on the following pending patch series:
https://lore.kernel.org/buildroot/20260313195744.991927-1-bernd@kuhls.net/T/#u

And updates the kernel version used for the test_openjdk test to the last LTS version (6.18.21)
instead of 5.10.3, which is quite old and may not be compatible with the latest OpenJDK versions.

This change was tested by running the openjdk test.

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/testing/tests/package/test_openjdk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_openjdk.py b/support/testing/tests/package/test_openjdk.py
index 3bf89f9efe..0dc69b7c49 100644
--- a/support/testing/tests/package/test_openjdk.py
+++ b/support/testing/tests/package/test_openjdk.py
@@ -12,7 +12,7 @@ class TestOpenJdk(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.34"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
