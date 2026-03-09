Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0C1FCA17B
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 19:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A22541CA9;
	Mon,  9 Mar 2026 19:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJI7RzKRer30; Mon,  9 Mar 2026 19:35:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E88B341CA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773084945;
	bh=ihK/Qk8BQGthNTdHpQzfFN758d4kQ8SzodGP55QDyYc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NF4ezgCmULiHqeG5VjZqmJkB4qTsBhXpJGDRfnbEGutYkY3v6EhNve4wgirxIF50k
	 F0TSxDsCxKwqd4qVKz4vXyxpi2QX5bCYlDW+6FcyUQQhQcmKRsyJaPzwfcUBn0Pd9C
	 ok0GnacQnv8eQDbQNV/nxWTxC6fmEiWF06p4Ve+A/420T9RTs02E8s0yqNXyUQ03zQ
	 sT1KcFBB7AXNVo1MsHHGXOY17lkWpnXDzG8e7NdYF+y4l14hRd6QxwBkBzdnf0quJW
	 r4O5nzCHpD7lMn6N7kdRnPhLeKllRxgPBmbjQSPNh6omkCMxuXmM/UYJEmOitdhLsz
	 EpFgygSXATBsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E88B341CA4;
	Mon,  9 Mar 2026 19:35:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B9D9158
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 19:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D619401E7
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 19:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7SUIPiTiotT for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 19:35:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3681C40495
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3681C40495
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 19:35:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 472C986208; Mon,  9 Mar 2026 19:35:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 9 Mar 2026 20:32:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dcc0707c1b2d78bda9409aa8e8f60e5f180e3cd7
X-Git-Newrev: 7dfd2feb445c2cf83a2b52057fab96e72e42a071
X-Patchwork-Hint: ignore
Message-Id: <20260309193542.472C986208@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: security bump version
 to 2.8.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7dfd2feb445c2cf83a2b52057fab96e72e42a071
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release announce:
https://lore.kernel.org/linux-nfs/4d58bf28-a3e0-4496-bae8-05387da27054@redhat.com/

This update fixes:
https://www.cve.org/CVERecord?id=CVE-2025-12801

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nfs-utils/nfs-utils.hash | 4 ++--
 package/nfs-utils/nfs-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 9aa9151ebb..bf7c4b61b6 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.5/sha256sums.asc
-sha256  b13ca4a9df44186bdbe107514b22732d4243f785f95daf2fb86afc1edba15bbb  nfs-utils-2.8.5.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.6/sha256sums.asc
+sha256  2bd7b34e809a7eff2f4bc5fc5fd96ebcd66a5458b471a270cbd2dc169b011550  nfs-utils-2.8.6.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index ba87ef813e..7ac0b549cf 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.8.5
+NFS_UTILS_VERSION = 2.8.6
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
