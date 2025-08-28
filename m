Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF26DCA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 20:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C322183F64;
	Thu, 28 Aug 2025 20:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FkxjOcsprXj; Thu, 28 Aug 2025 20:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E24883F61
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E24883F61;
	Thu, 28 Aug 2025 20:48:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2CED92D
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B48AB411C5
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZM69xiQba83 for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 20:48:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C7B7411AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C7B7411AE
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:48:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFB3487C84; Thu, 28 Aug 2025 20:48:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Aug 2025 22:40:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47181a164cbfc888d81931e6e3950c379db2f786
X-Git-Newrev: edac3dba3b5c2a3dfbc53d574f255496966ec7ff
X-Patchwork-Hint: ignore
Message-Id: <20250828204843.EFB3487C84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/gen-bootin-toolchains:
 arcle-750d toolchain has no gdbserver
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=edac3dba3b5c2a3dfbc53d574f255496966ec7ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the build of gdbserver for ARC 750D is broken, Bootlin
toolchains since 2024.05 no longer provide gdbserver for ARC, causing
build failures when the autobuilders try to use it. Let's fix this by
telling gen-bootlin-toolchains that the arcle-750d toolchains don't
have gdbserver.

Fixes:

  https://autobuild.buildroot.net/results/77c865f941612e99d8b6a7f66b5bc06f90d6b7db/

Cc: Yuriy Kolerov <yuriy.kolerov@synopsys.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 support/scripts/gen-bootlin-toolchains                                  | 1 +
 .../toolchain-external/toolchain-external-bootlin/Config.in.options     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 42e1c995f5..78123ed1a7 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -36,6 +36,7 @@ arches = {
     'arcle-750d': {
         'conditions': ['BR2_arcle', 'BR2_arc750d'],
         'prefix': 'arc',
+        'gdbserver': False,
     },
     'arcle-hs38': {
         'conditions': ['BR2_arcle', 'BR2_archs38'],
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 157f288421..e98ee023cb 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -353,6 +353,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE
 	depends on BR2_arcle
 	depends on BR2_arc750d
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -378,6 +379,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE
 	depends on BR2_arcle
 	depends on BR2_arc750d
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
