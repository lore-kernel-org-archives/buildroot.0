Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F00C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 20:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D55D8414E6;
	Tue, 16 Aug 2022 20:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D55D8414E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J63kkSAjKwWO; Tue, 16 Aug 2022 20:15:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98228408D2;
	Tue, 16 Aug 2022 20:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98228408D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFEA71BF470
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C61CF81493
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C61CF81493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1zdV-QNdqGPv for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 20:12:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D6AF81494
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 20:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D6AF81494
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CF99E8788D; Tue, 16 Aug 2022 19:58:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 22:10:09 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 9cc76357b58373dd9673a0bd956165476739056b
X-Git-Newrev: 3abcae9d56ca35eb734be3b1967fbff63b5f9bc9
X-Patchwork-Hint: ignore
Message-Id: <20220816195810.CF99E8788D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rustc: fix target
 names for i586 and i686
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3abcae9d56ca35eb734be3b1967fbff63b5f9bc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit d69d40c029dc (package/rustc: add support for Tier 1 and Tier 2
platforms) misspelled the config options for i586 and i686.

They are BR2_x86_i586 and BR2_x86_i686, not BR2_i586 or BR2_i686.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Romain Naour <romain.naour@smile.fr>

---
Changes v1 -> v2:
  - in commit log: s/BR2_i386_/BR2_x86_/g  (Baruch)

(cherry picked from commit b4e706a6e320d5035cf05e8af3c6d9b8bb74fc33)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rustc/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 4669be852d..13b866345b 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -16,7 +16,7 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER1_PLATFORMS
 	# aarch64-unknown-linux-gnu
 	default y if BR2_aarch64 && BR2_TOOLCHAIN_USES_GLIBC
 	# i686-unknown-linux-gnu
-	default y if (BR2_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX) && BR2_TOOLCHAIN_USES_GLIBC
+	default y if (BR2_x86_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX) && BR2_TOOLCHAIN_USES_GLIBC
 	# x86_64-unknown-linux-gnu
 	default y if BR2_x86_64 && BR2_TOOLCHAIN_USES_GLIBC
 
@@ -82,11 +82,11 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
 	# userspace
 	default y if BR2_arm && BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_MUSL
 	# i586-unknown-linux-gnu
-	default y if BR2_i586 && BR2_TOOLCHAIN_USES_GLIBC
+	default y if BR2_x86_i586 && BR2_TOOLCHAIN_USES_GLIBC
 	# i586-unknown-linux-musl
-	default y if BR2_i586 && BR2_TOOLCHAIN_USES_MUSL
+	default y if BR2_x86_i586 && BR2_TOOLCHAIN_USES_MUSL
 	# i686-unknown-linux-musl
-	default y if (BR2_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX) && BR2_TOOLCHAIN_USES_MUSL
+	default y if (BR2_x86_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX) && BR2_TOOLCHAIN_USES_MUSL
 	# mips-unknown-linux-musl
 	default y if BR2_mips && BR2_TOOLCHAIN_USES_MUSL && !BR2_MIPS_CPU_MIPS32R6
 	# mips64-unknown-linux-muslabi64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
