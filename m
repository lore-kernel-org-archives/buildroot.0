Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F06EC4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C77E8111F;
	Fri, 17 Jul 2026 15:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kjTzefMsfP4h; Fri, 17 Jul 2026 15:44:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A020380F29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303084;
	bh=mqaO60xIpqXcmVpbgJSMytHm9oaIwWmzvuwCT5qt45U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QEYl4YQVeupsWuEfKxgYgGwjWuFcUA7frLNM+2BiO9Kr3lAnJdW7O6VCCR4qCe/Vr
	 5OgU0bf4F/cKBX0clLqrgR0uol6Siga1mhdZR5RAoetZ/RtwvsYs11HYP8vvDZOonR
	 gxOL5AmKwegaE3Lt62W1qetaaFcmitCatYAqxejHlmmNEIFhx/rz54g1ILyKFNyS1D
	 efFjWjU1oEvjNI6DgsOHPKH6YY7eZMYtiRFYd6w6NKmYf7OPHQv5s2DzbU3bFpSonC
	 ZoE5IcQXRXHBujsj7PrJE9bYg7rnTa50Vt+ejoINChNea4MSJrrLiCejjhUBmHCfl2
	 AsUt1ibVoFVCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A020380F29;
	Fri, 17 Jul 2026 15:44:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 113F5435
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBC6940279
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gOYRipHYryZi for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:44:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECDA9402C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECDA9402C7
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B939088E56; Fri, 17 Jul 2026 15:43:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:06:27 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c03b63fe1ffe6bfb8a649f4187016e1d617de61f
X-Git-Newrev: b7e1513e66a4c7c679ec853a59e3661d4210ded0
X-Patchwork-Hint: ignore
Message-Id: <20260717154343.B939088E56@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/x11r7/xserver_xorg-server: security bump version to 21.1.24
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b7e1513e66a4c7c679ec853a59e3661d4210ded0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://lists.x.org/archives/xorg-announce/2026-July/003718.html
https://lists.x.org/archives/xorg-announce/2026-July/003716.html

Fixes
-  CVE-2026-55999: glamor Font Atlas Heap Buffer Overflow
-  CVE-2026-56000: GLX contextTags Use-After-Free in CommonMakeCurrent()

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3b15bf90f183a8e0e4877a3ffeeff479dd0949d9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 5f10908c8a..1f664e88e4 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2026-June/003703.html
-sha256  e39832e5617dadaf072fdf9f0e19e5d2e1c2a13607ac280bac1aba9f8fe14634  xorg-server-21.1.23.tar.xz
-sha512  7eae854af1b5db1f5d1e59cb9d26b86d98fa176d4f80f70935c707f17982d0446a0a8ad8d29c922edbd208435f995b027604fbb72e62a7bf3ba79f2f570aa0bb  xorg-server-21.1.23.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-July/003718.html
+sha256  1a4eb36ca65cc3b1b936566d677a9786e13c11cd5806e951ac55f3f5ce3984af  xorg-server-21.1.24.tar.xz
+sha512  f51372b04fe21632fc778ff240705161ed2dccc0114dbe3ee25156d8ac85ec945e2ac05d8638bc7d8d54bad4dfc89cb26b6bd2058b7804d54ab7179e1ac2eb13  xorg-server-21.1.24.tar.xz
 # Locally calculated
 sha256  c9f90a6669109aad6c9a7c3b46cc2c574221a73b792afa419336816b49da5c11  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index cecbb821ae..d1596a8a3f 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.23
+XSERVER_XORG_SERVER_VERSION = 21.1.24
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
