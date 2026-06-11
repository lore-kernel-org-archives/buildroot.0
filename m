Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0B3CD8C9D
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 20:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B070280E76;
	Thu, 11 Jun 2026 20:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTMcK7F5jp1b; Thu, 11 Jun 2026 20:49:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE63F80E52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781210984;
	bh=9ocH4y6Gbft8aJ3UNvkV6EnlMWcZuEx9jkzPcYbNYmg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FI3n7Ja/CnuoOjO2BuIDWj70VppOvFNmFy7AIf4D/vaTi3KA1t7ziuuKxS0wE4MmY
	 nNVJ8YMSCA4h1oi+XMRuM57lBZxdmZGtbRCpnxHmDPXEAYoZYcPoifLeiNmqpbI+fZ
	 0JapErO1hWT2DqP+6dn6HBQWZoLVZyeJR0sTgG3LVjx2IN9VUZ4G4NQ1uXLd//1V+I
	 uIKE6gRHa9OQKa44QxcShGYvbZSKqh+XM1K/BFNukdPMa1W39xxuyEecY1qqFJve6t
	 kw4egLo/HuzPDHMLF3+YOuufkOdcOw6bBxHSjL09Ahyk4ZPXDf6iCYMl3KfB7KefFM
	 i7d4TYHREuU6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE63F80E52;
	Thu, 11 Jun 2026 20:49:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 20E6B12F
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1093460C00
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 14a7tOV-EL-0 for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 20:49:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4652760BFC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4652760BFC
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:49:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53EFC8803B; Thu, 11 Jun 2026 20:49:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 22:45:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39c935852ac8e4a0c9583f8040c559d4f88456f0
X-Git-Newrev: df53284720d4529652cef174d554498b912413b1
X-Patchwork-Hint: ignore
Message-Id: <20260611204922.53EFC8803B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/less: bump to version 704
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/df53284720d4529652cef174d554498b912413b1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://www.greenwoodsoftware.com/less/news.704.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/less/less.hash | 4 ++--
 package/less/less.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index 8eafceabce..8d29dbc87d 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # using DSA key AE27252BD6846E7D6EAE1DD6F153A7C833235259
-# https://www.greenwoodsoftware.com/less/less-702.sig
-sha256  242a64c00f02d96f8ee208cf638ae1728b727c7f5fdf82a7d4f4cae32fb084e2  less-702.tar.gz
+# https://www.greenwoodsoftware.com/less/less-704.sig
+sha256  20a0b0a2bb2525fa53c7eee9beb854b4c9cf172eabb209af7020743547bfe9fb  less-704.tar.gz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/less/less.mk b/package/less/less.mk
index 91c853009a..d8ffadb8d2 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LESS_VERSION = 702
+LESS_VERSION = 704
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
