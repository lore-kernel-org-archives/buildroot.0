Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B60D5B86F
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 361F4808C7;
	Mon, 15 Dec 2025 21:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dpUd8C2VmSo1; Mon, 15 Dec 2025 21:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50291808C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765835665;
	bh=zkOMiKT9gbEumvYFAjilC+qPRKsiT4nqYI++g621D4o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YdFr/RAwVhlshR/f+kVkBHnz6c8I2dm1usW49VrbY/4bI1qYsosAPl3LkgNv+6P6L
	 N8gsR7Sd5ut2gL69Dr1HZi0ulbr4YFxaUYkoECBUj0r8tI3LdbV7kt+Acrg11nmOEy
	 WW6PYQ5mSdAk7LckkL1kb5uOAMXf6pjOkeLdYwfLflUJPzEnSWdZ8Zt1PL2b777VCb
	 xhQAuSKki18eIcNaX0ixPyO6PmR4bXLEfc6MLcgpVrcn/jU1dWOVOjCH2A5dC5iIkv
	 UYNj9YhsoLgDmPPefJC4uc0TImCaueOpxjl3XhQi1DiliOiBG79GceKA5YJDOp3EjO
	 t9XhWAeRlTLQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50291808C8;
	Mon, 15 Dec 2025 21:54:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B92F3117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB5A040749
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSdHgcaSnVZd for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:54:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D02740701
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D02740701
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:54:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F236F86FD8; Mon, 15 Dec 2025 21:54:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 22:46:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40e3bc696495809d5bedc523ad3be94178c1b069
X-Git-Newrev: 9a3aa90e8886fd981248f5c4946f48b024d9e24b
X-Patchwork-Hint: ignore
Message-Id: <20251215215422.F236F86FD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ed: bump package to version 1.22.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a3aa90e8886fd981248f5c4946f48b024d9e24b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
1.22.2: https://lists.gnu.org/archive/html/bug-ed/2025-08/msg00015.html
1.22.3: https://lists.gnu.org/archive/html/bug-ed/2025-12/msg00000.html

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
[Julien: add release announce for 1.22.2]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ed/ed.hash | 4 ++--
 package/ed/ed.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index 44d5bc7653..605c4854f7 100644
--- a/package/ed/ed.hash
+++ b/package/ed/ed.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/bug-ed/2025-08/msg00010.html
-sha256  1af541116796d6b9e4b66ef9c45ddce0e15a19ed62bfca362ccd7d472cc1c8fb  ed-1.22.1.tar.lz
+# From https://lists.gnu.org/archive/html/bug-ed/2025-12/msg00000.html
+sha256  47a55ddfc52d4a1ff6f7559fbd00cf948a16b6cf151ec520392761aeae4e97be  ed-1.22.3.tar.lz
 # Locally calculated
 sha256  022e9c2e9cc1aac3622313df6f971fbb39c1d1b0cb45324c16b8a1fe231c5ea6  COPYING
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 10092d513f..3042b3c370 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ED_VERSION = 1.22.1
+ED_VERSION = 1.22.3
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
