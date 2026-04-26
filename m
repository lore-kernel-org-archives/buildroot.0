Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFC9FF885E
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 19:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6E7E84DEA;
	Sun, 26 Apr 2026 19:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZe0g4xhPmwJ; Sun, 26 Apr 2026 19:13:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D2D884E1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777230837;
	bh=sPYjUe0JiL5TCLupVSBzBURxiNn6Tac+1O9bl6sU0MM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FZTGhEcnJA0Os8GWxe/67JKeE5cRKd29qTQLnyXV2Iqti/Nemk5IGlTN35klT1+AB
	 DQc4Om93UpWsLmKO/fX6pWpCbQUWjsOEfJX/sN0fY6hcpOIkyA/BvweG9DlET49bj3
	 BzvYNTYhLDRnR9A7gAiWx/0RERpYLhuvmXSqama6za+V7mbSpoYdz98j9EbV2PNtBo
	 3jLBinMN5W77Voi7GGhF5Yq317k4My/IkR76nwq5+AVD0JogrDPOUv2/MDICS8SpQ6
	 spNQxH0wNxZ1rKnocjNLTflDD3J/39B+U559GmwrvDzKg6pq6pkcmVXudOSpQhcYlW
	 hosV/wKXtqMhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D2D884E1C;
	Sun, 26 Apr 2026 19:13:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94F18363
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 19:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 871E440362
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 19:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MhlA97N8pVIf for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 19:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97D2740331
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97D2740331
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 19:13:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5885A836FA; Sun, 26 Apr 2026 19:13:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 20:58:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 838c36679049b778a7b2188dcf4a9aee286c83da
X-Git-Newrev: 9ae39a4d57c8ea8abe0cd12183c26b1266def274
X-Patchwork-Hint: ignore
Message-Id: <20260426191354.5885A836FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpgme: bump to version 1.24.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9ae39a4d57c8ea8abe0cd12183c26b1266def274
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/gpg/gpgme/blob/gpgme-1.24.3/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libgpgme/libgpgme.hash | 4 ++--
 package/libgpgme/libgpgme.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index 64099df4c3..1db2f86950 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  b3a938939a9fb2182684aa9ba094c8e8ecd6167b  gpgme-1.23.2.tar.bz2
-sha256  9499e8b1f33cccb6815527a1bc16049d35a6198a6c5fae0185f2bd561bce5224  gpgme-1.23.2.tar.bz2
+sha1  e7f9be4b461907c00dfd21d23da872ba0638f6ee  gpgme-1.24.3.tar.bz2
+sha256  bfc17f5bd1b178c8649fdd918956d277080f33df006a2dc40acdecdce68c50dd  gpgme-1.24.3.tar.bz2
 # Locally calculated
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LESSER
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 635aea4955..80fc25198c 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.23.2
+LIBGPGME_VERSION = 1.24.3
 LIBGPGME_SITE = https://gnupg.org/ftp/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
