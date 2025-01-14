Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FCFE77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 22:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D0C940497;
	Tue, 14 Jan 2025 22:13:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSZFEU6RNCqV; Tue, 14 Jan 2025 22:13:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B60B4049B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B60B4049B;
	Tue, 14 Jan 2025 22:13:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB008B8B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 22:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95BD180E57
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 22:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGmxtJZjRVmT for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 22:13:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A86A380E4D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A86A380E4D
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 22:13:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F15785CB4; Tue, 14 Jan 2025 22:13:22 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 14 Jan 2025 22:16:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92ec676fcc19528272bd1360a173db0da2f00609
X-Git-Newrev: 203abefcf6c0ca54d28523bcd8ac7c56c249fefe
X-Patchwork-Hint: ignore
Message-Id: <20250114221322.8F15785CB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-arm-arm: fix
 BR2_ARCH_NEEDS_GCC_AT_LEAST_X guard
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=203abefcf6c0ca54d28523bcd8ac7c56c249fefe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_ARCH_NEEDS_GCC_AT_LEAST_X guards has been introduced by [1] to
prevent selecting an external toolchain that did not support the GCC
arch tuning the user had selected.

But it was not updated while updating to version 13.2-rel1.

Fixes: 0dd599d171df7852ae801173c8212976e50b09e1

[1] eed1670d8a6f0899f5fdfc26bd6d1609ebc19c7a

Cc: Antoine Coutant <antoine.coutant@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 toolchain/toolchain-external/toolchain-external-arm-arm/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index b110885a96..683854e05e 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -9,7 +9,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	depends on BR2_ARM_CPU_HAS_NEON
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
