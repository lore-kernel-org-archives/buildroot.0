Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B11FF885E
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 19:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35DE284D9E;
	Sun, 26 Apr 2026 19:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VOu3WDXn3e5C; Sun, 26 Apr 2026 19:13:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6122284DEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777230836;
	bh=YL4EEUZYrbIeBSTxq3o1LNwSEOucTafjzWNT5cGjIOs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cJ2a7duNDt6/eaBFh1VUk/DLf9ts/zVFLYM7mx+ZFkLQ3zp3VuzS3O905zdKhCI7u
	 Eci4jOynH1fuxyZULLcJFUk2O6hYopARVlVSX3D004qyvhCpgLUKMD6f9Lb18ukLuW
	 sd0Crak2/QsThHmfFa/QkELTXl62tVUZTNrQiicrJrVrTQ3gVbTGGkHeWuKZIfIS/i
	 mpAI+QcIPV/z9pAYmQBXNmqs+7NWk73KNDNqtFlODU8HN6qVfgvphwY4aLhOCBFFYQ
	 jj53Evp4xI5LtlEXVDHlMfpKIM/I0rhHbOcUk7gQgiYwgSmf7ymXXkeA5TNBCVB4M+
	 RXCnCo6rCQeVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6122284DEA;
	Sun, 26 Apr 2026 19:13:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 90490231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 19:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81EFC84DEA
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 19:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFMHr8p1h_Bg for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 19:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AE0584D9E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AE0584D9E
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 19:13:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 490E6836ED; Sun, 26 Apr 2026 19:13:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 20:58:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77aeabb8b5af7ab9012a94c3aa0db1da7c58ee4c
X-Git-Newrev: c41092cc9851b689f803114e88ee5d0f1c39af58
X-Patchwork-Hint: ignore
Message-Id: <20260426191354.490E6836ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpg-error: bump version to 1.60
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c41092cc9851b689f803114e88ee5d0f1c39af58
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://dev.gnupg.org/T8112

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libgpg-error/libgpg-error.hash | 4 ++--
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index ede1a2113e..1e52e78d22 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  a9876a9e4cb54298960bd4202baf891642060428  libgpg-error-1.58.tar.bz2
-sha256  f943aea9a830a8bd938e5124b579efaece24a3225ff4c3d27611a80ce1260c27  libgpg-error-1.58.tar.bz2
+sha1  851a1619aee8f7723ed50f09cb6a186c483c280c  libgpg-error-1.60.tar.bz2
+sha256  11b2a738e212f3eab0fe8637bc341d3181ca964e97bb2654de91aab7dae4ce09  libgpg-error-1.60.tar.bz2
 
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 5207d926df..808339b935 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.58
+LIBGPG_ERROR_VERSION = 1.60
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
