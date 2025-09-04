Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D725ECA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC717605F1;
	Thu,  4 Sep 2025 16:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDOfaP8SXyqq; Thu,  4 Sep 2025 16:14:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA82B6063A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA82B6063A;
	Thu,  4 Sep 2025 16:14:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04702106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83BA080779
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYOrhmxFig5a for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:13:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAB9C80786
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAB9C80786
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8AF287F0E; Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:57:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 608a20d7f36b815968ceb40697b6d7d9fbf15ffc
X-Git-Newrev: e02167acf57e52717441d6bbd954bdbd0153a07b
X-Patchwork-Hint: ignore
Message-Id: <20250904161348.A8AF287F0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/scripts/gen-bootin-toolchains: arcle-750d toolchain has no
 gdbserver
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e02167acf57e52717441d6bbd954bdbd0153a07b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit edac3dba3b5c2a3dfbc53d574f255496966ec7ff)
[Titouan: Fix merge conflicts for 2025.02.x]
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 support/scripts/gen-bootlin-toolchains                                  | 1 +
 .../toolchain-external/toolchain-external-bootlin/Config.in.options     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 502411d4cc..152bb90a85 100755
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
index ef3d23d026..2dac422796 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -353,6 +353,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE
 	depends on BR2_arcle
 	depends on BR2_arc750d
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -378,6 +379,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE
 	depends on BR2_arcle
 	depends on BR2_arc750d
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
