Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B80DCD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 420BD41F57;
	Fri, 29 May 2026 08:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNZhQBsJPT-3; Fri, 29 May 2026 08:28:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67E1342150
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043306;
	bh=A81WaCB4/B2yRvdncfXoBgSwTtHV4nBppHaXLUkYCXg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kmI7oPJHsrxAjb6s7qyzBG6gJz0t6mjx3Pq6krVW2PZNVf0xuKJCwFaN00bkyfcpO
	 XEqN4sN4coQgsrpeVav/7N64yMTK7ldN75Dr4XkskNSQqrBpLF15t5bOCxPBcZUgkL
	 10GBlvfn4UiSRkzejFZBx5/Jv9vAWb55ZdOyhpPLdrZVMZpM0ehKDI8MKeekiifRqS
	 6AUH4WScMNbsUTgebLsj5U8ltpx69IpODR8kS/X9z7A3AtBVepFY4IUseqJFN+6dTK
	 EQiqZq60N5zrL89U6BXpNcXJv3PybW1RIwXjtnk1Bv3jCCYbNkj1sMU3AVTr+HEmRA
	 CWOOutUknS56w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67E1342150;
	Fri, 29 May 2026 08:28:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 117B728E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD04261454
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iKvlx4yPbpmF for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A6B46144B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A6B46144B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCB8787334; Fri, 29 May 2026 08:27:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:26:34 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 83b09ce2a34b497ad81d1dbca1dc3355f89b4162
X-Git-Newrev: 01a6c31a688cfd602d6c8d4a2b9d34089a126e4a
X-Patchwork-Hint: ignore
Message-Id: <20260529082748.DCB8787334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/gnupg2: bump
 version to 2.5.19
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/01a6c31a688cfd602d6c8d4a2b9d34089a126e4a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://lists.gnupg.org/pipermail/gnupg-announce/2026q2/000504.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 77aeabb8b5af7ab9012a94c3aa0db1da7c58ee4c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index d607e9bb86..2aab6111b4 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  91c523b172763621c69c0a213bc01b67b37d2298  gnupg-2.5.18.tar.bz2
-sha256  0dbd64e0322fe1a4813360d46539d5f8daf4a8fa235cf5fce464e8b0214a7e4f  gnupg-2.5.18.tar.bz2
+sha1  dbe9ce2aca9d553ed4367692575cee15204a95a6  gnupg-2.5.19.tar.bz2
+sha256  722aa8a426dd9b44e0d194b73bfee3a3e617d65674cd4d1d062e6df29f1788c6  gnupg-2.5.19.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 1f7ff43e07..499532c551 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.5.18
+GNUPG2_VERSION = 2.5.19
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
