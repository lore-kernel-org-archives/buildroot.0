Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CF7CA0EE4
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 17:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A17D14129C;
	Wed, 20 Aug 2025 17:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Tow_fcNXFce; Wed, 20 Aug 2025 17:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A90C412A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A90C412A2;
	Wed, 20 Aug 2025 17:07:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EE1EE7AD
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 17:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4A8E83BD3
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 17:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fFVzykSe34MF for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 17:07:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0840C83BBB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0840C83BBB
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 17:07:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0240E87797; Wed, 20 Aug 2025 17:07:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Aug 2025 19:06:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce5d1735710d11b135fc6cb235e976b306833e7d
X-Git-Newrev: e002ec3773452a14180b9be686d909ccb2e61a5d
X-Patchwork-Hint: ignore
Message-Id: <20250820170752.0240E87797@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: enable
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL on a few more architectures
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e002ec3773452a14180b9be686d909ccb2e61a5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit is an extension of
5dae966a30c5485e45b94f750a739d36810cba4c ("linux: select
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL when needed"), which solves
autobuilder issues by making sure that
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL is automatically enabled on some
architecture if the default architecture defconfig is used and the
latest kernel is built (which is what happens in the autobuilders).

This new commit adds BR2_or1k and BR2_riscv to the list to fix
autobuilder issues.

Fixes:

  https://autobuild.buildroot.org/results/1a739eee39bdef8986279a9e21f8637fbe263353/ (or1k)
  https://autobuild.buildroot.org/results/acb62b7a486f3f8e99c6cc2b52b0c259bfa18a0e/ (riscv)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7f90c566b0..27321eee50 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -176,7 +176,8 @@ config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
 	# version. This is mainly needed to fix autobuilder testing.
 	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
 	       BR2_LINUX_KERNEL_LATEST_VERSION && \
-	       (BR2_aarch64 || BR2_aarch64_be || BR2_arcle || BR2_arceb || BR2_sparc || BR2_x86_64)
+	       (BR2_aarch64 || BR2_aarch64_be || BR2_arcle || BR2_arceb || \
+	        BR2_or1k || BR2_riscv || BR2_sparc || BR2_x86_64)
 	help
 	  This option will use the default configuration for the
 	  selected architecture. I.e, it is equivalent to running
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
