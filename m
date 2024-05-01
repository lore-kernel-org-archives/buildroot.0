Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8CEC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BA7680B38;
	Wed,  1 May 2024 19:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9MOXqxAgitFb; Wed,  1 May 2024 19:58:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2902180EA4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2902180EA4;
	Wed,  1 May 2024 19:58:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16B321BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CB85404C6
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEcFRbika--l for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24609407B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24609407B3
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:58:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CDD886484; Wed,  1 May 2024 19:58:24 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 21:54:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16463a00affa0ba4814e583bcd544174528f371e
X-Git-Newrev: 65fe2a8f02c694975065c890c0e6038619c025ff
X-Patchwork-Hint: ignore
Message-Id: <20240501195824.0CDD886484@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/config-fragments: remove
 sourcery-nios2.config
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

commit: https://git.buildroot.net/buildroot/commit/?id=65fe2a8f02c694975065c890c0e6038619c025ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Sourcery CodeBench Nios-II 2018.05 external toolchain will be
removed, first remove it from toolchain-configs.csv used by test-pkg
and genrandconfig scripts.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/config-fragments/autobuild/sourcery-nios2.config | 3 ---
 support/config-fragments/autobuild/toolchain-configs.csv | 1 -
 2 files changed, 4 deletions(-)

diff --git a/support/config-fragments/autobuild/sourcery-nios2.config b/support/config-fragments/autobuild/sourcery-nios2.config
deleted file mode 100644
index d58407d513..0000000000
--- a/support/config-fragments/autobuild/sourcery-nios2.config
+++ /dev/null
@@ -1,3 +0,0 @@
-BR2_nios2=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 2c4fa45fe7..47d5fddfbd 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -65,4 +65,3 @@ support/config-fragments/autobuild/linaro-aarch64-be.config,x86
 support/config-fragments/autobuild/linaro-arm.config,x86
 support/config-fragments/autobuild/sourcery-mips64.config,x86
 support/config-fragments/autobuild/sourcery-mips.config,x86
-support/config-fragments/autobuild/sourcery-nios2.config,x86
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
