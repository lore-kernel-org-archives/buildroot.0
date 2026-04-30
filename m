Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F66ACD343A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7228A844AF;
	Mon,  4 May 2026 14:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id scnENdtR9j7R; Mon,  4 May 2026 14:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98165845AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906017;
	bh=qPSJTVe/Ml3gHnMgPRx2IxxYJs7v0Ev7a3DS6f9RtSk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gdWNbyBpLVKLEBWD+6tDLJtUYiywtmkj0i5SXJLj2EtWQcMVwvwDwyc3pL+zUQfaF
	 ZEtno6FhPh6fr+E/VyxArTw9VHEkJgFWM6aUBo5KNqyqN7lKZ8s5U/SCXOVBWuvbMu
	 odW4S3epSjwoqz0rDtazNTKh7gmIg8EQ7ohFh9Bykx7edD6uLSgjeig0+oLMQnvibX
	 8CLquhoHmYc2PdvRjrfl0gXJzbJeanx2PwSLzPSUjS6rX9+ZPRNY8BGhZJeROebfT+
	 t9EUERnos1C+qiKojCZ+qJjcVKc+hYrdQCMXFG76VXnMlDGLfYaSH9pQkfaHPeBLiG
	 nFHS883WnkKkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98165845AC;
	Mon,  4 May 2026 14:46:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 33E0125D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 163BF845AB
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A05IsGVhIaiP for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6107845AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6107845AC
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA6168427E; Mon,  4 May 2026 14:46:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 14:08:18 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 63ae2c9f7585b4fb20c2ac8702051c4657a763e7
X-Git-Newrev: 5570c93b8a33ba784a5ff82b7214c88bf88974a0
X-Patchwork-Hint: ignore
Message-Id: <20260504144643.BA6168427E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/btrfs-progs:
 remove unnecessary autoreconf
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5570c93b8a33ba784a5ff82b7214c88bf88974a0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Commit 1c11f9020ad98db11e6d67066d0fdb2cfab27605 removed the patch
changing configure.ac with the bump to 6.10, so it is no longer
needed.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9fd8a1cf4993de9299487e73459b942a67b3a161)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/btrfs-progs/btrfs-progs.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 273c7e37f2..8691a5710e 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -13,9 +13,6 @@ BTRFS_PROGS_LICENSE = GPL-2.0, LGPL-2.1+ (libbtrfsutil)
 BTRFS_PROGS_LICENSE_FILES = COPYING libbtrfsutil/COPYING
 BTRFS_PROGS_INSTALL_STAGING = YES
 
-# 0002-btrfs-progs-add-uClibc-ng-compatibility-for-printf-f.patch
-BTRFS_PROGS_AUTORECONF = YES
-
 # Doesn't autodetect static-only and tries to build both
 ifeq ($(BR2_STATIC_LIBS),y)
 BTRFS_PROGS_MAKE_OPTS = static
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
