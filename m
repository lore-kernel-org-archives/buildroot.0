Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98F7C44523
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 11:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 378F640553;
	Sun, 19 Jul 2026 11:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yc_481Y0S6jm; Sun, 19 Jul 2026 11:34:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A96040560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784460886;
	bh=grCFKPOxiBTfiC4NgcMFtYjRNf6isdqRwwi6w+eePis=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pdQ3iPH6jZ+Z4EI+6zuvQwK06+FVrAnKirrFzltkeo1WKG3f0AWx1G2gRRp/enJYu
	 qGgW6hjRxl1cwp4TjySDZVGMFEWzyYKhWKIK93cQqZXa9jVKE1GwUaTqSUnb98j4C/
	 JMgII3Y2vNjpqOVI0DOpBwLf9l4G25WZCqmMk7YRIlCa9NJs6+kecozwM/gwmsR+j1
	 4QqgyopWVTh6OQ9MBCX5XAabjz1TBWWA6tYMuBswfFp7MyGyQeGOFUEEY01+o8oPcc
	 OskQOStRUjE/xSEYexivr3dJhQmsg2Z93PPVnq9Zfong3YVq+9GVr5+HTIrKzmMkXg
	 2ZOfOOFSuz2rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A96040560;
	Sun, 19 Jul 2026 11:34:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EBD651F6
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D18A44005D
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6GTBRfBwGZui for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 11:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8700A40058
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8700A40058
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:34:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 489FE88F82; Sun, 19 Jul 2026 11:34:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Jul 2026 13:08:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed51b4b691592a24b2650b24539400e7a1a099f8
X-Git-Newrev: 6688a33296bd72d58a0ae5fb38910d1f3435859e
X-Patchwork-Hint: ignore
Message-Id: <20260719113404.489FE88F82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bitcoin: bump version to 31.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6688a33296bd72d58a0ae5fb38910d1f3435859e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://bitcoincore.org/en/releases/31.1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bitcoin/bitcoin.hash | 6 +++---
 package/bitcoin/bitcoin.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
index b1576d5e8a..3adfc7a5d0 100644
--- a/package/bitcoin/bitcoin.hash
+++ b/package/bitcoin/bitcoin.hash
@@ -1,7 +1,7 @@
-# Hash from: https://bitcoincore.org/bin/bitcoin-core-31.0/SHA256SUMS
+# Hash from: https://bitcoincore.org/bin/bitcoin-core-31.1/SHA256SUMS
 # After checking pgp signature from:
-# https://bitcoincore.org/bin/bitcoin-core-31.0/SHA256SUMS.asc
-sha256  0ba0ef5eea3aefd96cc1774be274c3d594812cfac0988809d706738bb067b3e3  bitcoin-31.0.tar.gz
+# https://bitcoincore.org/bin/bitcoin-core-31.1/SHA256SUMS.asc
+sha256  50411d5b43c7e4c90099394759eb6c2add6e7c2dbe728840893d638b6fc6afc9  bitcoin-31.1.tar.gz
 
 # Hash for license file
 sha256  b028769f3852a9368ab10bd754ff01ebb741f84a2fa658c9aff82a631bc6ecfc  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index d7019f2aa9..857768eba8 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITCOIN_VERSION = 31.0
+BITCOIN_VERSION = 31.1
 BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
 BITCOIN_LICENSE = MIT
 BITCOIN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
