Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2071ECD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 22:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0BE860EB3;
	Wed, 10 Apr 2024 22:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gj23n80DMMDk; Wed, 10 Apr 2024 22:18:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0D0F60EBF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0D0F60EBF;
	Wed, 10 Apr 2024 22:18:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F0891BF40A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 22:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B96D4058D
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 22:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3MtslQcIQJSD for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 22:18:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 19A5B4046C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19A5B4046C
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19A5B4046C
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 22:18:10 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-416a8ec0239so1706075e9.0
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 15:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712787489; x=1713392289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2QdP2z5C8u9WHyzjql+oyoK4yuQTUJQNqOB6NQgDnUs=;
 b=xAZlzxk9dQHP1M2F4E95MoE/FZyiJEJGbRJL/n4KJXyIK5uccqHd3dI58qVBhmjicN
 OFC+vh78cw36y/ZQApVu3bfCzI1XlTcsCoSBEzki96e3a098VIwIgUHBUirNC3oXXxh6
 N7kXqIgpuFXmC6x3mWGKKXT8A0UJRm7oXDruSqxqvNnI0XaZl+w+Yti+Cus1fzv0tSVb
 lNTY8qkB6z8Qcbz7zzZHYpwqvq4Bh2giP6FNfmaPOqhkORQ+ctqlo0U/Ei6Nw3giE88H
 FlsXvsjMhbqGq22YVWoXF9t/oE73LY+ApZluf6OEZa8M4uX4WXpzGaAD7KZhe43+n0SB
 rjFA==
X-Gm-Message-State: AOJu0YzTgvDmNw3sv7ZFOopdKhUBv30u2oW8cd6x6nV8r3cmZffaUzC5
 UU+mckQpmH6qI0REZJsAJtM5So9CBwcyIUOihdFvbcCE3LOhYoF7FeCPXo3bYgFylha0OVED7xy
 L
X-Google-Smtp-Source: AGHT+IFW0GVsDcWjw0swA0wet+f0hFFLtaU1Zw/gNPFjLzwHo94/NfqwV+KFY86cpwSXA7KDeHAL6A==
X-Received: by 2002:a05:600c:3587:b0:416:2bb6:cbea with SMTP id
 p7-20020a05600c358700b004162bb6cbeamr678219wmq.19.1712787488933; 
 Wed, 10 Apr 2024 15:18:08 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c3b9500b00416928e239csm354025wms.35.2024.04.10.15.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 15:18:08 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 00:18:04 +0200
Message-ID: <20240410221806.89203-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410221806.89203-1-romain.naour@smile.fr>
References: <20240410221806.89203-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712787489; x=1713392289;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2QdP2z5C8u9WHyzjql+oyoK4yuQTUJQNqOB6NQgDnUs=;
 b=ijQbIsfuIf+On0e7Wr9HRA+0ZVWcYebyckI8NgtdQXAnSnbBaKJtAFIYwamj9/0OyC
 c2E7pmuF7eZXhuTZ8px5KuTuGfoPNSzzB1YOu2z7zzED2w2R3OMG95DHo/qEVslFZlQE
 eGOraffJU/V354zAzUku8lsMGEim65ybVTzVwK7DdY3mJorXSayjRG63XRE0S8XGoAsR
 iS0dWsFhNVV/JP0KZsn7DiO1JxYNtaIuEdPO7AK3dKnCb3Tbg+5U5Iem+9bmUS+bMLQH
 VOepbBRX7OXfvEFgPxUv2Q2332zSd5bvYAroIbAtR6j5ZkiaRvT/f+PYccXTctvwuWKs
 l8pQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ijQbIsfu
Subject: [Buildroot] [PATCH] support/testing: sync TestATFAllwinner with
 orangepi_zero_plus2_defconfig
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

u-boot-2021.04 seems to be broken when pylibfdt support is enabled
and the latest python3/setuptools are used.

Since the TestATFAllwinner is using bananapi_m64 as u-boot defconfig
but the Buildroot defconfig of this board was removed in 2022.11 [1]
update TestATFAllwinner to use a newer BSP. Use the one provided
by orangepi_zero_plus2_defconfig.

[1] daf3c6661f823e566b6310042884c36c1d73f1de

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6477656317 (TestATFAllwinner)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/boot/test_atf.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index 4fcb9b241c..1995f83a54 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -34,15 +34,15 @@ class TestATFAllwinner(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
         # BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP is not set
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
         BR2_TARGET_UBOOT=y
         BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
         BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
-        BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m64"
+        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+        BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus2"
         BR2_TARGET_UBOOT_NEEDS_DTC=y
         BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
         BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
