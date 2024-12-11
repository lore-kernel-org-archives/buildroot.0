Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9730FE7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 13:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ED4D60AFA;
	Wed, 11 Dec 2024 13:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Beh9tLJpEKuk; Wed, 11 Dec 2024 13:25:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6840060BCF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6840060BCF;
	Wed, 11 Dec 2024 13:25:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 585A8ED2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A90080B2A
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TrpmiiPTyEBW for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 13:25:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8F2F80C6A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8F2F80C6A
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:25:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95F5186CA1; Wed, 11 Dec 2024 13:25:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 14:13:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65f268e21cbe450e1addb64cca1b9de73c420076
X-Git-Newrev: b948c2597818595c8b4be15b2d99c65343479e28
X-Patchwork-Hint: ignore
Message-Id: <20241211132524.95F5186CA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: use
 BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_SUPPORTS
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b948c2597818595c8b4be15b2d99c65343479e28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow to enable BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
option on aarch64 hosts using HOST_ARM_GNU_TOOLCHAIN_SUPPORTS, in order
to build an ATF firmwares that require a pre-built bare metal toolchain
(rockpro64_defconfig).

[Romain: improve commit log]
Signed-off-by: Bryce Johnson <bryce@redpinelabs.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/arm-trusted-firmware/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 5ba4e08370..4a5c7dc89c 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -249,7 +249,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
 	bool "Needs arm-none-eabi toolchain"
 	depends on BR2_aarch64
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_SUPPORTS
 	help
 	  Select this option if your ATF board configuration requires
 	  an ARM32 bare metal toolchain to be available.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
