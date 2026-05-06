Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF85CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 21:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BECF41009;
	Wed,  6 May 2026 21:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqOMdnhPqNOm; Wed,  6 May 2026 21:12:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8276241005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778101952;
	bh=DzTtK/tV6J+r/b+fL7EZzWoawDRgeAxP/w4LZ5iEnDI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FQzuxrsyV4y6oCqlfmaZZG7olH24bLDqO/yVfuyROhqYZJH3g5EAtKxSBw2c53btN
	 Bockbw63TPzrkrN9V4KFTjVRCms3OQS8DnqwS1ormhFrxLmL7urNAFyTherhFIeON9
	 DozKYGptHCrtvq9NzyCefW6I9mcWW+8EYrGRVxWevwbG5/fEWrzkWsWp6LpQSr2z+D
	 73jxPCf/YA01j1gIzNa9XUzKrlxjdNILahq7BdLbCqH2t1sUAm09VseGiB11C3pTHm
	 Qpd2eU52bbs0taUTOKqbcz5rnDQKdO7bFEXsNJM6aBrVnrJMrDn7bBCsTcRsHRIbn3
	 kjqo0nYmR3e1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8276241005;
	Wed,  6 May 2026 21:12:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 39A3D11B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 21:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FD0D822DC
 for <buildroot@buildroot.org>; Wed,  6 May 2026 21:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxYDSTvjg2Gq for <buildroot@buildroot.org>;
 Wed,  6 May 2026 21:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 709D683077
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 709D683077
 for <buildroot@buildroot.org>; Wed,  6 May 2026 21:12:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F43D84AC1; Wed,  6 May 2026 21:12:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 May 2026 23:02:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3aa75c99c13caf0816c69f57245c2950d40f3895
X-Git-Newrev: 0f2e9cc8784715bdf18e72c433fe9bece4537f85
X-Patchwork-Hint: ignore
Message-Id: <20260506211229.0F43D84AC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnl: bump to 3.12.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0f2e9cc8784715bdf18e72c433fe9bece4537f85
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes: https://github.com/thom311/libnl/compare/libnl3_11_0...libnl3_12_0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnl/libnl.hash | 4 ++--
 package/libnl/libnl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index caf75616fe..c5a5712145 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,4 +1,4 @@
-# From https://github.com/thom311/libnl/releases/download/libnl3_11_0/libnl-3.11.0.tar.gz.sha256sum
-sha256  2a56e1edefa3e68a7c00879496736fdbf62fc94ed3232c0baba127ecfa76874d  libnl-3.11.0.tar.gz
+# From https://github.com/thom311/libnl/releases/download/libnl3_12_0/libnl-3.12.0.tar.gz.sha256sum
+sha256  fc51ca7196f1a3f5fdf6ffd3864b50f4f9c02333be28be4eeca057e103c0dd18  libnl-3.12.0.tar.gz
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index b1254d2ba0..2dcb594141 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNL_VERSION = 3.11.0
+LIBNL_VERSION = 3.12.0
 LIBNL_SITE = https://github.com/thom311/libnl/releases/download/libnl$(subst .,_,$(LIBNL_VERSION))
 LIBNL_LICENSE = LGPL-2.1+
 LIBNL_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
