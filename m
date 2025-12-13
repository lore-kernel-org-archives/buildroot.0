Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B0DD5B169
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 21:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A117040935;
	Sat, 13 Dec 2025 21:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PQGaohBCtBT; Sat, 13 Dec 2025 21:27:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E0FD408DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765661262;
	bh=txNusMtcvOYwvcUKT98oD8VHE+Y6O5S2EzCNXbp9HBE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TM20pLWSE73zD+YRzrfaQKlxOSKD34OyeAkDxqg9eaBER3EADBCrhZe3n6wIKg+hZ
	 gOr56+SkNWNQ0HIOL3GQnniRvUTz1rOugaUHAifZ4ditMBgg5urjiKLvz9mAZD2fbt
	 pEcH5OvIqEuVYYQX0TLvgwnpgnkK3+ApxBWaxAJR5TlRveCR+tE8zIkIFvJPXB5/dx
	 lvGw+8MkQ6ms5x2VylwlvzNUxFRNEKSGizCgcBaHluaMcKzyZdcfafsP2Ed0Z6hQtO
	 knmGmAQiDkpGk4xIsBf+/3hwGn7xIsmvW/X61PNPtbrz1HZWJIGJWUgbe4DLCrvghE
	 80dmArU08YDCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E0FD408DB;
	Sat, 13 Dec 2025 21:27:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B99B72C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0910606BB
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGYgzAXVcgac for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 21:27:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E32E0606A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E32E0606A5
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:27:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3C1A86DC0; Sat, 13 Dec 2025 21:27:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 22:09:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25fe2c4d28f49024b3bb9d48422b462575b7e7db
X-Git-Newrev: d39ec850916d17b28ccba614f0ef5d03a2878042
X-Patchwork-Hint: ignore
Message-Id: <20251213212739.D3C1A86DC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.23.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=d39ec850916d17b28ccba614f0ef5d03a2878042
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.samba.org/samba/history/samba-4.23.4.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index ec28ced087..363c6c26eb 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.23.3.tar.asc
-sha256  06cdbb27a6956978b045455fe0696d998ffbac8d24ba24de87a4ef8200813320  samba-4.23.3.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.23.4.tar.asc
+sha256  af429d078a86f1ce16d0d1ecee35c42a3610790b47b84468f31284a8c4060140  samba-4.23.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 439e5452af..7976e9ae05 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.23.3
+SAMBA4_VERSION = 4.23.4
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
