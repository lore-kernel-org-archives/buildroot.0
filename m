Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D169C71143
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F01126139F;
	Thu, 12 Jun 2025 08:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzUthxAv8gTX; Thu, 12 Jun 2025 08:39:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB9F4613A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB9F4613A5;
	Thu, 12 Jun 2025 08:39:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 147E227A
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 103C140E48
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xLlp4DdLs8H for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46967405B2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46967405B2
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4350E82D97; Thu, 12 Jun 2025 08:38:27 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 18:51:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5f14d65cb420685ea636c8541f98eff3b2f3630
X-Git-Newrev: a4d774781ffef71fea3aae81b4201dd9a6803205
X-Patchwork-Hint: ignore
Message-Id: <20250612083827.4350E82D97@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc-bare-metal: bump to gcc 15.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4d774781ffef71fea3aae81b4201dd9a6803205
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps gcc-bare-metal to gcc 15.1.0.

See here for changes:
https://gcc.gnu.org/gcc-15/changes.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/gcc-bare-metal/14.2.0            | 1 -
 package/gcc-bare-metal/15.1.0            | 1 +
 package/gcc-bare-metal/gcc-bare-metal.mk | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc-bare-metal/14.2.0 b/package/gcc-bare-metal/14.2.0
deleted file mode 120000
index 0737236850..0000000000
--- a/package/gcc-bare-metal/14.2.0
+++ /dev/null
@@ -1 +0,0 @@
-../gcc/14.2.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/15.1.0 b/package/gcc-bare-metal/15.1.0
new file mode 120000
index 0000000000..669da9e956
--- /dev/null
+++ b/package/gcc-bare-metal/15.1.0
@@ -0,0 +1 @@
+../gcc/15.1.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index ec245db35b..17232a8ef1 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GCC_BARE_METAL_VERSION = 14.2.0
+GCC_BARE_METAL_VERSION = 15.1.0
 GCC_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_BARE_METAL_VERSION)
 GCC_BARE_METAL_SOURCE = gcc-$(GCC_BARE_METAL_VERSION).tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
