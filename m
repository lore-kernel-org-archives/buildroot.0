Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A52CD37BE
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 17:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07ABE40728;
	Mon, 11 May 2026 17:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IIDFZ6ysx9pS; Mon, 11 May 2026 17:16:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20C8340729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778519816;
	bh=wDl55iBN9MnOv1BLqllA88oe+nvp9LaVQFSGIC5FkMQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IFfiGyPvl4cYpuP1p931Q5S4In9ubnwJzj6b9i5io3e6L9XqChzv+ISCCr6zON0sN
	 Z4Z71xM85qO8zwJXcce8mglLFA9kunoBTkbUc3NpvvmYbvv3E+x47Xk5l5SC4U9Qn4
	 /PGz3soDZ3yYkaDwnQSxQJ9cYjvvBmL52I/N3/L3t6m3cAkpIMaJ5IuomC9tywyRlE
	 8g0u63sCSiYwGaHdyXK0NmdSTZooENBwne6qHMKrhmoydPIOz7qSv9/mckXFsY4quS
	 iDelg1aIdoAkWXnQuVyRD4t5d+pUwUnMvviN46r1uy1pEL3gkk38xGFmPMx95VvhZy
	 0OuIZwiEM162A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20C8340729;
	Mon, 11 May 2026 17:16:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC4AA223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 17:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A8FB60633
 for <buildroot@buildroot.org>; Mon, 11 May 2026 17:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6OyiQ1ofDxNa for <buildroot@buildroot.org>;
 Mon, 11 May 2026 17:16:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C86B96062B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C86B96062B
 for <buildroot@buildroot.org>; Mon, 11 May 2026 17:16:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A57B185E29; Mon, 11 May 2026 17:16:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 19:10:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91c79494e6e9de172202be864067aaf72dd3ea9a
X-Git-Newrev: 4ecf88dc4e3812f3e5cc6f956bd6b437b9fe184c
X-Patchwork-Hint: ignore
Message-Id: <20260511171647.A57B185E29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libksba: bump to version 1.7.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4ecf88dc4e3812f3e5cc6f956bd6b437b9fe184c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/gpg/libksba/blob/libksba-1.7.0/NEWS
https://dev.gnupg.org/T8121

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libksba/libksba.hash | 4 ++--
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index b7e1e2f9f5..afb9e5756d 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  ff1705f512ab18323571e009d8ead407f7d0279f  libksba-1.6.8.tar.bz2
-sha256  0f4510f1c7a679c3545990a31479f391ad45d84e039176309d42f80cf41743f5  libksba-1.6.8.tar.bz2
+sha1  789ca7db1b1dcb87bca3eb2f53d5e6729810e943  libksba-1.7.0.tar.bz2
+sha256  e1d3a5745911f5a663fddecf526541c4241052a9e4cafbc92dc7f4096c7efdac  libksba-1.7.0.tar.bz2
 
 # Hash for license files:
 sha256  078dca2d4a2a5d19788b18dc05e039f7a63cb789f6f0b6f9e3fbe6284e6968bd  AUTHORS
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index f43693872e..10ec0ab2d5 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.6.8
+LIBKSBA_VERSION = 1.7.0
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = https://gnupg.org/ftp/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
