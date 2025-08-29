Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2EFCA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7532D612A4;
	Fri, 29 Aug 2025 15:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yqMIIf3dyEKC; Fri, 29 Aug 2025 15:37:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A85D16165F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A85D16165F;
	Fri, 29 Aug 2025 15:37:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3162D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C51636165F
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smb10zLXvT0A for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:37:19 +0000 (UTC)
X-Greylist: delayed 566 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 29 Aug 2025 15:37:18 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EABD1612A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EABD1612A4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=romain.gantois@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EABD1612A4
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:37:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 171561A0D81;
 Fri, 29 Aug 2025 15:27:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E2FC8605F1;
 Fri, 29 Aug 2025 15:27:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DB5371C22A37C; 
 Fri, 29 Aug 2025 17:27:42 +0200 (CEST)
Date: Fri, 29 Aug 2025 17:27:38 +0200
MIME-Version: 1.0
Message-Id: <20250829-bump-6-12-43-v1-1-cbb173f16a63@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOnGsWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyNL3aTS3AJdM11DI10TY12LZKNEC0sjA3OLRDMloJaCotS0zAqwcdG
 xtbUAQhJta14AAAA=
X-Change-ID: 20250829-bump-6-12-43-8c2a892078a6
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Xuanhao Shi <X15000177@gmail.com>, 
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756481269; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=blAYeJQcLThSs+M4etesGFFDrHQXCE/v+2DFj2HuWl4=;
 b=WEMuwXyJBvtLwlOoSHm7FUysDREDL+bXiOdkkxPBkXgsvhhS9pyAjhFNDHzEMI66GfcJvQ
 9TZGcMsqJlW5RcZtoA8CI1I7qVBfU6PxEWvklSugI7dmc0XDfCy3oMHQ+ZQf4qFqd5+LbU
 bAobSi+rBuJeWWrLVJ1VG9MNQ9bRHfZM2vmm7DtWj0mvF28fcEavOZ9xSF4420+pFoE4qJ
 Gc4C156xP62ZbKI60sDddY/UReEaiw6FKiyraNmbuuftIQA6tXez31IrsaGqkBWtQu7g89
 DND/PDe3/rieoeVk5xGYd2a/seJUQzgzsSRfmqDwst8NLoAauBnd7ReT8u/0eg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=WEMuwXyJ
Subject: [Buildroot] [PATCH] configs/ti_am62x_sk: bump Linux to version
 6.12.43
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
From: Romain Gantois via buildroot <buildroot@buildroot.org>
Reply-To: Romain Gantois <romain.gantois@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Cadence QSPI driver is broken in version 6.12.36. It was fixed by a
subsequent patch:

https://lore.kernel.org/all/20250730093234.216392179@linuxfoundation.org/

Which was later backported to the 6.12 stable branch.

Bump the kernel version to the latest 6.12.x stable version to fix QSPI
support.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 board/ti/am62x-sk/patches/linux/linux.hash | 2 +-
 configs/ti_am62x_sk_defconfig              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
index 6c7685ad4d0733770e24d6e15537f6ca1d5ca376..df60f9a5823db0966355d3bff8d5ace4e3b6719b 100644
--- a/board/ti/am62x-sk/patches/linux/linux.hash
+++ b/board/ti/am62x-sk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c  linux-6.12.36.tar.xz
+sha256  0fcbbbbcd456e87bbbfc8bf37af541fda62ccfcce76903503424fd101ef7bdee  linux-6.12.43.tar.xz
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 28e6fc03ba1c1c6e650e7086445b75732350fb5e..211d58a66f3ce032f9ebced7cb3ac523b97dfdde 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.43"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"

---
base-commit: 0461043a51322ebcf7cdd90b0d2f9b59df17bb9c
change-id: 20250829-bump-6-12-43-8c2a892078a6

Best regards,
-- 
Romain Gantois <romain.gantois@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
