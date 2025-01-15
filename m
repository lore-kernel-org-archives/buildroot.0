Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EC7C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7EEB4F9D1;
	Fri, 28 Feb 2025 16:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WsjRJAMQuJC6; Fri, 28 Feb 2025 16:59:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7065750350
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7065750350;
	Fri, 28 Feb 2025 16:59:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17D7A68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2F9742E10
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67-pv5jas9Ea for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31E9A42474
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31E9A42474
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C071818ED; Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 15 Jan 2025 21:30:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 237bd32f0bf9aaf3b24e494b0bdaa63f8dbc3069
X-Git-Newrev: a24bb5f703fd05a5fbdf0e5963ab26fa80711047
X-Patchwork-Hint: ignore
Message-Id: <20250228163012.2C071818ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] toolchain: remove remaining
 BR2_nios2 from toolchain bugs
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

commit: https://git.buildroot.net/buildroot/commit/?id=a24bb5f703fd05a5fbdf0e5963ab26fa80711047
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 toolchain/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 86ab3710a0..d6ed25ff96 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -89,7 +89,6 @@ config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
 config BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	bool
 	default y
-	depends on !BR2_nios2
 	depends on !BR2_ARM_CPU_ARMV4
 	depends on !BR2_ARM_CPU_ARMV5
 	depends on !BR2_sparc_v8
@@ -221,7 +220,6 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_107728
 	bool
 	default y if BR2_microblazebe || BR2_microblazeel \
 		|| BR2_mips || BR2_mipsel \
-		|| BR2_nios2 \
 		|| BR2_or1k \
 		|| BR2_sh
 	depends on BR2_TOOLCHAIN_USES_GLIBC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
