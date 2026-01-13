Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAFDD30CC2
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 268A483DF7;
	Tue, 13 Jan 2026 20:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6UJ6Pb_pSkc; Tue, 13 Jan 2026 20:59:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CA4983D5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337990;
	bh=00IcZd5EA+xSBbGEJGYrZdsjZwptpzqxUSApW5935Aw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mW2EEHGHvK7iRyd4TJG+8Wno4+HdQaeDc8npO3bNckjTwuA807RbigFXu7POsmsrL
	 vT2WYQGcN5PpRgIHrnHACDibbwQWFQ4tGncyrkQHudG9//LruFuZiQ8ZmPrlpzMx7v
	 bFFtRLWSb7mG7U3bjzKcnRqFDqkdHVEaMq8AUa1OqwJ6KKx/L6r/3gja1aFj/OkAC0
	 nG6ypmHZ0tyTZfW7aUHziutlz3Aqdf5h+BcJ7V8GkegA0JEZScOEvdi1o1TIQue7tf
	 5t5gALGCxadyQJtUicUUEJ8FK6OJP81RA9WlZzkIO3QTXMqyPYVreag0ogeI+TtjOt
	 xMbAQplkpRNlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CA4983D5D;
	Tue, 13 Jan 2026 20:59:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EA705231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8D0040771
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5JHJVtgQRML for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1928407B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1928407B0
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B030E81382; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f8f5689d310c92535bc84d1a3686653cad3244d
X-Git-Newrev: 9d3368e8d7e8b8993ad807c6146476fab8b1fd25
X-Patchwork-Hint: ignore
Message-Id: <20260113205848.B030E81382@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libFS: bump version to
 1.0.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d3368e8d7e8b8993ad807c6146476fab8b1fd25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-August/003524.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libFS/xlib_libFS.hash | 6 +++---
 package/x11r7/xlib_libFS/xlib_libFS.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libFS/xlib_libFS.hash b/package/x11r7/xlib_libFS/xlib_libFS.hash
index 6ca152ac4a..e88e77b2ce 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.hash
+++ b/package/x11r7/xlib_libFS/xlib_libFS.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-August/003200.html
-sha256  597379438b3242ccc7d7b0fc432dc6c844eca0d4a82a7b82518bfeb203fc208a  libFS-1.0.9.tar.xz
-sha512  7d012e62736c6d567931bad982eec221199d296f0fe41e1e7fde5575b8b928e9a8c644aa8746242bdfe72393635320b58774d9a519285765bd26d633588092b8  libFS-1.0.9.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-August/003524.html
+sha256  9babbd3c86069c98563da044045fdc0ece4ec0c93dcdd2c68aa74eb34b4f3b77  libFS-1.0.10.tar.xz
+sha512  f4dc361b7e1dcc1f348ea86e96c5a60ff40c5168b6097f00d8a5db2b86d089cfca12ac13dbde5ce3b53279b7eb8773ed6dcd9c678c2e95363ffa5127ecaacee7  libFS-1.0.10.tar.xz
 # Locally computed
 sha256  5386724e7475b89394dd836b954a6688f875efab99e43e8eb7e8775f5b99a341  COPYING
diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
index 0fbf453ca4..1311c8df7a 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.mk
+++ b/package/x11r7/xlib_libFS/xlib_libFS.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBFS_VERSION = 1.0.9
+XLIB_LIBFS_VERSION = 1.0.10
 XLIB_LIBFS_SOURCE = libFS-$(XLIB_LIBFS_VERSION).tar.xz
 XLIB_LIBFS_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBFS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
