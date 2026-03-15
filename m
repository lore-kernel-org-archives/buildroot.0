Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44305D58B1A
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 10:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC403606E7;
	Sun, 15 Mar 2026 10:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQUAlNtEEZ-W; Sun, 15 Mar 2026 10:26:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 062D960718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773570415;
	bh=HitPY2wpFXDrRx3AsXHWrIiGIsS6UbnhswHWiUPFqOs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Eedr1RuDsq4VjeLddiM2L2kV7d8UsYiE/EV83jItZ2Gpfie2XRdVJaKh6XP3C9ICO
	 wI48hrvlF6u3GYC7JsA1XT7NWLsday7pf9UAPjHnms9iXgbZpoNgCWl6HL3AAIiwT8
	 SzMv6XCFvJxgSyfGmpFlgeC2BxkuBU+bjEBrkpSvA0YYuwgT1ObkVgrmkRjB2gvApY
	 lLXiO4bDBXGvSCiiDPI4ZYDM+0Fg2XiXF4ETEx8U8N34aqsdare3vKecLCsikQBPSe
	 k1hWJ7UkuPGf3lPauiisqDz/m9T6e4BBtZdQzP9oFp0gllLLuDnqDQESQ9F2xboKYc
	 holG+C8HnI1CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 062D960718;
	Sun, 15 Mar 2026 10:26:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88C68357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 10:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A6E540264
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 10:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EzkzxgtDwXr1 for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 10:26:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8188B400DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8188B400DA
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 10:26:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2F9C85584; Sun, 15 Mar 2026 10:26:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 11:20:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e2d0389188681a5bedac73b8fb9ba6147e48887
X-Git-Newrev: 04473f555909284ad9ea65c384fdd26d073a0780
X-Patchwork-Hint: ignore
Message-Id: <20260315102652.A2F9C85584@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/sqlite: bump version to
 3.52.0"
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/04473f555909284ad9ea65c384fdd26d073a0780
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This reverts commit 04dbf7a38f4e83a1c6444b910209a0e3a350b14c.

Upstream withdrew this release:
https://www.sqlite.org/releaselog/3_52_0.html

"Due to backwards-compatibility issues associated with some new
 features, the 3.52.0 release has been withdrawn."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 9ed3781dca..055e935a4e 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f6b50b0c103392af32a8be15b2b9d25959de9a00a70c3979128aafeaa5338b3f  sqlite-autoconf-3520000.tar.gz
+sha256  fbd89f866b1403bb66a143065440089dd76100f2238314d92274a082d4f2b7bb  sqlite-autoconf-3510200.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 4b334714ff..795bc32dbf 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.52.0
-SQLITE_TAR_VERSION = 3520000
+SQLITE_VERSION = 3.51.2
+SQLITE_TAR_VERSION = 3510200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
