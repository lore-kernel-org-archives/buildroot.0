Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8F4C02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 20:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A819419F5;
	Wed, 15 Jan 2025 20:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4uaTg6Hb_qLp; Wed, 15 Jan 2025 20:35:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD3D341A15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD3D341A15;
	Wed, 15 Jan 2025 20:35:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 386EBB89
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 20:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 268B884AAA
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 20:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-pHLjTtjZMd for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 20:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A9F884A99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A9F884A99
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 20:35:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3120D85DA3; Wed, 15 Jan 2025 20:35:30 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 15 Jan 2025 21:30:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ddc5808cd19f577917566ad83e2a3835d6d43b9
X-Git-Newrev: e56ae61ff9f29fb0b3713001f8df3134612b95e6
X-Patchwork-Hint: ignore
Message-Id: <20250115203530.3120D85DA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/config-fragments: remove nios2
 toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=e56ae61ff9f29fb0b3713001f8df3134612b95e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The nios2 architecture was deprecated in gcc-14 and has been removed
in the upcoming gcc-15 [1][2].

Our last and only nios2 defconfig "qemu_nios2_10m50_defconfig" was
removed in 2024.11 due to nios2 removal from Qemu 9.1.0 [3].

Remove nios2 testing from Buildroot autobuilders.

[1] https://sourceware.org/pipermail/binutils/2024-April/133675.html
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e876acab6cdd84bb2b32c98fc69fb0ba29c81153
[3] f96b4c176f6e9d6c4374a0d322de672bf44c35bf

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Julien Olivain <ju.o@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/config-fragments/autobuild/bootlin-nios2-glibc.config | 4 ----
 support/config-fragments/autobuild/toolchain-configs.csv      | 1 -
 2 files changed, 5 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-nios2-glibc.config b/support/config-fragments/autobuild/bootlin-nios2-glibc.config
deleted file mode 100644
index 575a1b30ed..0000000000
--- a/support/config-fragments/autobuild/bootlin-nios2-glibc.config
+++ /dev/null
@@ -1,4 +0,0 @@
-BR2_nios2=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 654f11e28b..047b22a9fa 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -28,7 +28,6 @@ support/config-fragments/autobuild/bootlin-m68k-5208-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-microblazeel-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-mipsel-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-mipsel32r6-glibc.config,x86_64
-support/config-fragments/autobuild/bootlin-nios2-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-openrisc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-powerpc64le-power8-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-powerpc-e500mc-uclibc.config,x86_64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
