Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08195F43680
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 09:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2BBE60D76;
	Fri, 17 Apr 2026 09:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oY4m533WdvLC; Fri, 17 Apr 2026 09:00:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68E1760DE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416404;
	bh=OrKhyCVhRAhH6cG0nWCGt7Ag+09vYGOWT5kk46VmqhY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jvrLzcCis7KCfaPugk1UVnjKpUwEerlhpfKwZ0w3/3M8PHr8UZYHng2AkDJem57NY
	 H/rMAkhGZoeaPm4YpAf3FJwjfxfktceLZRR381gjdX06pCxxXZrDuf5VGoIknQbaDj
	 yRx+e6LjRkNgpkh8J+9na3bHboGc05eyBZurKL2TP9GEPWYiauxO41RDc5w8VL6ZH+
	 LklH7azoW07DhxxQNLdHTjIYX6E00jfjlllPRjMXw+jcR8hdkyyC8CBvwIdFBVKLi3
	 KaZ4JZceeQMJNWIuguj3ZINCmHPFHhgTcBkt162Zrl7eIcr9U6rHwKxArGqQLTtlQi
	 5BwZbHBw6xXSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68E1760DE4;
	Fri, 17 Apr 2026 09:00:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 013AE259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EE3440CDF
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYn6oJUbdH09 for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5BAAB40CFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BAAB40CFB
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BAAB40CFB
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:53 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4888375f735so4869645e9.3
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416391; x=1777021191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=k6Vp6mpds6BN56AaSETcCu6ZJzcJwV/zkGqwO6YAmZw=;
 b=pvGq01DLUXvlFX0qdrcFiDL+6HD5EJrKwq7r+6iN/W1Sjj3TdYnMGGFKFTR0TugPMu
 leR/A8AHgNWsGFw7MYNT5mcb3zXneyb2RvWh9ECXPROno4qCQi2qOLQMfHU/MOQxpEB7
 gZAVSi2x9F2WV7F3YfiEqssU4PBlhtbKKSw3cuYPld+F1xRY0Q8Vk7/TElMqmEf7toJl
 tI68elG7pyipGfIQRxGftRISlKis9TaEOee/TJkxVSDghCoG+9kVMY3SUmJ4xbEyxkIh
 sHmpS0YfJbVvrBx4cEjXUaUDWHvUC2cwh63Ik2X5oGNa1FE7PBWEIZwAfLxM9R2fgjGz
 g3eA==
X-Gm-Message-State: AOJu0Yw1ddmkvDQljkO1w4687Va2yRqziTo8/K1bnN2WTSqDEDkfD0e7
 6Z0oRzUK1ks6kxl73kY61jwuAOievL4Kj4plSUWhXiHFnvGiBgOn05q2CWD50Bfdr5tONDFb6+F
 chTuqSS0=
X-Gm-Gg: AeBDieuHBFBgPp7t8ieHXOo+D3s+R3ZuKX7Ds8Tfs8Ivly+KTJPalZY8zHkT/cNpPNb
 wB6twTAJBrea6C1KmeABY/1j1x6zwS+8TuHcRZsV8c9zBpMnw69DEc7X51utlya5Hki1e59MyNl
 ONlGeg4ZuLKPHC+/+v7JmnofyxFr4uqtNFGHOo6+btjgLUAmkjPPPIw5gRlItLrjgaQDlluASRc
 WaDja3PZTT5pDMaBlPCz4QtrEhZk1vhuGLgCa3fv4pBbH54jL6eAn3jbDiwbUVrXuCkB7IIi0e4
 W9SHJGQICCSStOVWc1xsltbSIdGtOZmdvpbQLExuAylAVgygiSTxDre0JLb3PqqVAgECFs7IvcD
 7ttvv2Jm4FK2cC37/i2UvTIKW7wmBzawl4wAvIVMLtF6gCiZzqucCQFinKN848DMvSidXt0ZXKA
 1SNuSU3a9e1gF8Pgu/YGZ6aDwkASPfdPubsDQrh+PqFOwhcLkI/ce1KAi3Pg3sGGmR23AytLGsw
 hSttizEasgmOM2oM3q3PhNltt88ocU=
X-Received: by 2002:a05:600c:3150:b0:480:3ad0:93bf with SMTP id
 5b1f17b1804b1-488fb7930famr27174465e9.24.1776416390994; 
 Fri, 17 Apr 2026 01:59:50 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:50 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:29 +0200
Message-ID: <20260417085936.200528-15-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416391; x=1777021191; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k6Vp6mpds6BN56AaSETcCu6ZJzcJwV/zkGqwO6YAmZw=;
 b=j4D6W2znIifzfk42uhpuzBy0GJBrOQ7xTgoH1oJbFvIXP2x67ef1k/xvaz8w1jYTCG
 H2PdiHSwKlnnodNAi8+Fs/tWDEc6juJNN2boAnGUyIRmzQLw2D7Urg7bJa0JKvQpUg0Z
 CVMPPWuc1IRh9aWd0SHG3/ub8IGGeQV1J5XAI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=j4D6W2zn
Subject: [Buildroot] [PATCH v1 14/21] support/testing : test_lxc : Bump
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

Update the Device Tree name for the vexpress platform to match the
new directory structure introduced in Linux 6.5.

Since kernel 6.5, the 'arch/arm/boot/dts/' directory was restructured
to avoid having thousands of files in a single folder. Device Trees
for ARM (32-bit) are now organized into subdirectories. For the
Versatile Express platform, the DTS file moved to the 'arm/'
subdirectory.

The build was failing with:
make[3]: *** No rule to make target 'arch/arm/boot/dts/vexpress-v2p-ca9.dtb'. Stop.

Adjust BR2_LINUX_KERNEL_INTREE_DTS_NAME from "vexpress-v2p-ca9" to
"arm/vexpress-v2p-ca9".

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/testing/tests/package/test_lxc.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_lxc.py b/support/testing/tests/package/test_lxc.py
index 0d03087a2c..5d5f2fb9b4 100644
--- a/support/testing/tests/package/test_lxc.py
+++ b/support/testing/tests/package/test_lxc.py
@@ -13,10 +13,10 @@ class TestLxc(infra.basetest.BRTest):
             BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
             BR2_LINUX_KERNEL=y
             BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-            BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.38"
+            BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
             BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
             BR2_LINUX_KERNEL_DTS_SUPPORT=y
-            BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+            BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/vexpress-v2p-ca9"
             BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
             BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
             BR2_INIT_SYSTEMD=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
