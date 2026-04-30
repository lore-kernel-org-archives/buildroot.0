Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB68CD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9DA441C76;
	Mon,  4 May 2026 14:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mjq-2fvXwJQ4; Mon,  4 May 2026 14:48:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 538D241C63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906112;
	bh=F+hdaSMmj/sTDRuyOFMZd9BbgCH+YuG3ItnsHeen/jI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gAxUoOCQFZCg/DoI5SSYOBa2d8UmOdDNmnjkJmfjNhjqxYmlaROVzUzj9r13P01Cw
	 pX/9Dij/nwklzVcq/XTgDHYOt2X6OBGkT2XAYqh+dtvocwlsqo3oequnxiL3lwgCml
	 voy32YtATKfIH3PWQDS7b9ZjBxbhMFE5XlKTiF+FdP4j0CQ6GQMtBzaaBWlViMf5EF
	 M3x01KwDQGNBhH7Ku2y+NJnB2BUAr6VJQjXzspEW9WNcLLVpBtyEnChHT1skOsSSRP
	 7TLClrqNuKQ6HzR8A06Q8dKDiTTQK4Jk9A6pRBBcZ9H30FrG4RcUFmRfCs9IGNYNlA
	 +N9INfVo3VFYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 538D241C63;
	Mon,  4 May 2026 14:48:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D622225D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC4CE84619
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EIMhWMvdKuVO for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E95F78469C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E95F78469C
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6C1D7FB24; Mon,  4 May 2026 14:48:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 13:41:23 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 152acddfa73d0befd2dc822b9ce98f4d1a4bdc77
X-Git-Newrev: 6b2ec193400a5a0609fe564b4ba418b0a87761d4
X-Patchwork-Hint: ignore
Message-Id: <20260504144829.C6C1D7FB24@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/util-linux:
 security bump to 2.41.4
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6b2ec193400a5a0609fe564b4ba418b0a87761d4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Security fixes:

 CVE-2026-27456 - mount(8) TOCTOU symlink attack via loop device.
   The SUID mount follows symlinks when resolving loop backing file
   paths. On systems where non-root users are permitted to mount loop
   devices (via 'user' option in fstab), this allows access to
   arbitrary files.

 CWE-190 - Integer overflow in libblkid parse_dos_extended().
   A crafted MBR disk image can cause uint32_t wraparound in EBR
   chain processing, causing reported partitions to not match the
   on-disk layout. Tools like udisks may then register a partition
   at logical sector 0.

Full release notes: https://www.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41.4-ReleaseNotes

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit cd52acda141d621b6c5774defe1427be29fe6ac1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/util-linux/util-linux.hash | 2 +-
 package/util-linux/util-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index eab8a0c3b5..5a5656212c 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/sha256sums.asc
-sha256  3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b  util-linux-2.41.3.tar.xz
+sha256  a8c213cc06048862602a42b2d299b340001f6d05c4407b549f3e03521df83688  util-linux-2.41.4.tar.xz
 # License files, locally calculated
 sha256  4c2db318192bda62f3f8fcf71488bb5e602ae4385eba281d711b46cc13a40bb3  README.licensing
 sha256  527f738966ca396cd5a68c1509390de2a780c6b614d9ee57f7544a6161938ed1  Documentation/licenses/COPYING.BSD-2-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 7617041a46..1271bc7dc0 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,7 +8,7 @@
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
 UTIL_LINUX_VERSION_MAJOR = 2.41
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).3
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).4
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
