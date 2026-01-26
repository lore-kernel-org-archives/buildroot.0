Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82819D1951A
	for <buildroot@archiver.kernel.org>; Mon, 26 Jan 2026 21:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 298A460E0C;
	Mon, 26 Jan 2026 21:04:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zN15yyRX-CN; Mon, 26 Jan 2026 21:04:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5787260E1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769461447;
	bh=V2NjO2TMF0ev2KO+IULebEsWBVqvA3EvllnBxdAZr/o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jClPO8EvzxIVWoHb8PE2r9r8ccAmaoZSH3AE8+wAsnt02tyjibXGHJ2jDxRyiEnNl
	 dK2jJXNDCJMC6XlIey9tII8YZBjEGVcZqQQ6FNNNIdFHJGGCfOmRsL0YK0waSqVLIg
	 ebD1FqnashE4/hSK0E/GDgvm5AigbpYBr8y3KGPJhP6Lq86ds513gwpwbyVNI0HEuY
	 8WNJ8NSXvHHU7dUVogp4IRtNTRrRdyVpAZaEIc3h+l6Bwiie7PpmvF3QcumPtmsnGX
	 SRGLem5ypfogKhtQAlVw1dhsOef2FMbjzW6IMod7pNx/e/QrRz6ykH5JX1eVsjOhbL
	 CwyfHxxv1qg0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5787260E1C;
	Mon, 26 Jan 2026 21:04:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 27E9733A
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 21:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46D3460E1C
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 21:04:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OD9KzSPJ7njs for <buildroot@buildroot.org>;
 Mon, 26 Jan 2026 21:04:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4551F60E0C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4551F60E0C
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 21:04:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F0CF87731; Mon, 26 Jan 2026 21:04:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Jan 2026 21:55:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb63637dd0ca3fdd3c45d79525c706ee64ec03d3
X-Git-Newrev: 54153e7ac859a6af36266a24bb49d7f1692b6761
X-Patchwork-Hint: ignore
Message-Id: <20260126210402.2F0CF87731@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/less: bump to version 691
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

commit: https://git.buildroot.net/buildroot/commit/?id=54153e7ac859a6af36266a24bb49d7f1692b6761
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://www.greenwoodsoftware.com/less/news.691.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/less/less.hash | 4 ++--
 package/less/less.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index 881849a42b..49dcaf28ef 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # using DSA key F153A7C833235259
-# https://www.greenwoodsoftware.com/less/less-685.sig
-sha256  2701041e767e697ee420ce0825641cedc8f20b51576abe99d92c1666d332e9dc  less-685.tar.gz
+# https://www.greenwoodsoftware.com/less/less-691.sig
+sha256  88b480eda1bb4f92009f7968b23189eaf1329211f5a3515869e133d286154d25  less-691.tar.gz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/less/less.mk b/package/less/less.mk
index afb6987e73..6f78fb67c7 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LESS_VERSION = 685
+LESS_VERSION = 691
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
