Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8114AC4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 22:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 107C8605AF;
	Mon, 15 Apr 2024 22:02:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Va-wfbiYS4TF; Mon, 15 Apr 2024 22:02:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 180836061A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 180836061A;
	Mon, 15 Apr 2024 22:02:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 476B81BF355
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 22:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FC3C81282
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 22:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFqRA3MfQQBr for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 22:02:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C2C2A81279
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2C2A81279
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2C2A81279
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 22:02:54 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 34A8EB0055E;
 Tue, 16 Apr 2024 00:02:49 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 16 Apr 2024 00:02:37 +0200
Message-ID: <20240415220237.333222-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713218571;
 bh=JJA0afHP0mo93BDpUH2C+drF8WghrmEGnMOjJ9RwLlU=;
 h=From:To:Cc:Subject:Date:From;
 b=MF5ko6Go+NTwfEYA9Fm+vULQI/5k6A9Xun9XPR/1IXhKTPsrzgRwUgUVMP7eT1O1O
 7IpSJH51aD3J8LLWTepousgTVMJlyb2Vh9hNto/w5ViHskBawl1aSq6ZjY6kti8b+F
 zvXW7Yt/TzprvvAWzudNSSWeiRs5quA18xYkzkWOCmC0QRL4hexhJHCZdpDtoWhmPh
 q9pvt+4X4SSVlImKrf9Yhq4TMWAvWgcVMyeXFrTab/RCadCHNGL1lksNEH5jMXzvl4
 GY5WJ6qroX9E2xcoy+N+rY+oUx+HzWRR5XHwhMi36dwFqrItC1osu722mlGaKwTJA3
 zi9uvm1WSHLFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MF5ko6Go
Subject: [Buildroot] [PATCH 1/1] package/gnu-efi: add BR2_RISCV_64 in
 _ARCH_SUPPORTS
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gnu-efi RISC-V 64bit support was introduced in commit [1], first
included in version 3.0.14.

This commit adds this architecture in _ARCH_SUPPORTS.

[1] https://sourceforge.net/p/gnu-efi/code/ci/b95f138fa1550040e68ac3dd34cfce7d148d7984

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gnu-efi/Config.in  | 1 +
 package/gnu-efi/gnu-efi.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/gnu-efi/Config.in b/package/gnu-efi/Config.in
index d456a23837d..4f44cf9f648 100644
--- a/package/gnu-efi/Config.in
+++ b/package/gnu-efi/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
 	bool
 	default y if BR2_ARM_CPU_HAS_ARM
+	default y if BR2_RISCV_64
 	default y if BR2_aarch64
 	default y if BR2_aarch64_be
 	default y if BR2_i386
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 96caaeb9336..2eed4e40d2d 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -24,6 +24,8 @@ else ifeq ($(BR2_arm)$(BR2_armeb),y)
 GNU_EFI_PLATFORM = arm
 else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 GNU_EFI_PLATFORM = aarch64
+else ifeq ($(BR2_RISCV_64),y)
+GNU_EFI_PLATFORM = riscv64
 endif
 
 GNU_EFI_MAKE_OPTS = \
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
