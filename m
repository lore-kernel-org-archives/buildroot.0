Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76AAC5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 17:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9186A40694;
	Sat, 15 Aug 2026 17:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zi9tQ_aETryo; Sat, 15 Aug 2026 17:14:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA37640877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786814068;
	bh=oby7RjH+CnZCDT2GKU7jJy2KxBWl26U6YxBBPppYQwc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BmmuEVU87ixYgRgJKX4qwTOHz3/7QYZkXVfFoyk/m5Ynad79bDS2uITa3IHjanhY8
	 Yugg71SogK/D2JI5b2v+droGrVTItQGLFypfmEB5+5c/ePyLJZYTewOrb8iWWDWaMd
	 ZqgXFTzsO2eLxkYyQjhhE8s8wUGA/Kx2wuP8TtjwGEr4GddYPzHvq4mAETPKkTOIFT
	 A2AJN37+cXwdlprWNiFKOVNJCtTGN1R0d65gTWsoEA5GXQfh8x2qUX++jarlvQNapL
	 2GyMVi8huFWh4mXmpIXdBSUgflqyG3psyjVlyJ5ITuylCLDsKdRdr32LJ3ABkLg9Cx
	 F4ouRsmx4X1dQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA37640877;
	Sat, 15 Aug 2026 17:14:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C7EB2BB
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 17:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A3BD80BCE
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 17:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DoyP3WlJAaZ0 for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 17:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3310D80BA8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3310D80BA8
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 17:14:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A95C8D77F; Sat, 15 Aug 2026 17:13:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 18:39:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 299ba1918ecedea9538c13119ca97230cb840837
X-Git-Newrev: e5116ed8c280e380dc78a1318aca02b527b21916
X-Patchwork-Hint: ignore
Message-Id: <20260815171335.7A95C8D77F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.24.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e5116ed8c280e380dc78a1318aca02b527b21916
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.samba.org/samba/history/samba-4.24.6.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 3931e55669..9fccc9bf5e 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.24.5.tar.asc
-sha256  6d5d7ee82f5ce9da4135086c9b184e47a58b4b023565f58abbb1f8c8a922306b  samba-4.24.5.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.24.6.tar.asc
+sha256  810cc955acb367e9bde556dccfb50db177a02b7c553aa1629a0b905fa7616267  samba-4.24.6.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 79551e1ee4..6291cb29b9 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.24.5
+SAMBA4_VERSION = 4.24.6
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
