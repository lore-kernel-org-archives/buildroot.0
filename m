Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C64E9D41A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57D7A61169;
	Wed,  4 Feb 2026 17:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-GKpV6cf-Si; Wed,  4 Feb 2026 17:07:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B2BB6116A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224855;
	bh=vxZtLoD1m5rcTNjk7Fpm+OxsE9C0I3qOMeye7EZaKro=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=etAY5vludblQG/+PvyuARKysYmDPGvEUkjU9UdqMitNgCJmIh8tay3LUHXmYnipjV
	 xJwo6+5Ql5Ev1wFnv6gqYEbRyzf/UC2EeDR2XBL54lwFkuwkCX1GT4nXec+JIXBFIn
	 KD6of9nWvwLmOH3UAnh4oR4NzNKaUr89TYWJJvcbRuueEWR3C+4dCZrDIDCkH0GCO4
	 wMYBkd0W9f8u52CZHcxi5qWAe0UAh3tVWHF0txKqVJqFW/jtrd5mfuQUo9AW5gqGqG
	 Nyt5CFY3T0fskG6rlyKS2zNbGXawBNBT595X9+7lCke7pH7Ne6xNJeia9HrVlru8gq
	 4SF1vleEEOSkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B2BB6116A;
	Wed,  4 Feb 2026 17:07:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DB0FF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E26B83D4C
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dp9D7WGSFmPk for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA0F083DEC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA0F083DEC
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF43886975; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:35:18 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 428d7a977a2a538702c3b2f37617ce68f76e318b
X-Git-Newrev: 494a7d391b19299e26f613833facb86f27c3b2c9
X-Patchwork-Hint: ignore
Message-Id: <20260204170637.DF43886975@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 board/stmicroelectronics/stm32f769-disco: exit post-build.sh on error
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/494a7d391b19299e26f613833facb86f27c3b2c9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 42411aa324f5e70dc42e9b83824cb8758207158a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/stmicroelectronics/stm32f769-disco/post-build.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/stmicroelectronics/stm32f769-disco/post-build.sh b/board/stmicroelectronics/stm32f769-disco/post-build.sh
index 4510050941..293bf30cb3 100755
--- a/board/stmicroelectronics/stm32f769-disco/post-build.sh
+++ b/board/stmicroelectronics/stm32f769-disco/post-build.sh
@@ -1,4 +1,6 @@
 #!/bin/sh
+set -eu
+
 BOARD_DIR="$(dirname "$0")"
 
 # Kernel is built without devpts support
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
