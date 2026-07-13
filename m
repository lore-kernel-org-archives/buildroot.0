Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4746C44509
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 10:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DAE981028;
	Mon, 13 Jul 2026 10:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZyGjmGiPc09x; Mon, 13 Jul 2026 10:33:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 921CB81029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783938795;
	bh=BvZfxRgCssU5QgJ3xy8kY3ad7nH3GvQBEpFzpWhS1LY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SCJit6a82J8XBvMS2dwuiLUy6HLRIHAinaCeMV31en05U3S4E0Yrn39afCA1mAzUn
	 i6PxQCgOI8bIQ8gRzkjk7wYcSe0hGifZg99UOb4/e0MXSPJDdPXV+r8MLtiN6vHMa7
	 hB8wWpVKy1ooal3mqsfrI+m3YrhLBU0I9zffLl64CcKn01elgC4hFoUkdzXBcQr/Tg
	 jzSJuPZJ1acId+JhYwGtL3NetbPKI8Z7bakNcpJdeaX6xR9ybzSkRgZTUs5LcaiLEf
	 Bd0N+31FLE7+Aci7yvMe7uxAh3fF5wyz1P4w5n5ehHtRQjRioAdYJSQLCMfHuhJt2M
	 VQsGypzuP7kjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 921CB81029;
	Mon, 13 Jul 2026 10:33:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C7C20438
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9EAE401BB
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QshDIE_WR7hn for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 10:33:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07217401B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07217401B9
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:33:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B27AF887BA; Mon, 13 Jul 2026 10:32:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Jul 2026 12:26:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4325c62d419f4223cfabed43a6d77c25f240e340
X-Git-Newrev: 3b15bf90f183a8e0e4877a3ffeeff479dd0949d9
X-Patchwork-Hint: ignore
Message-Id: <20260713103238.B27AF887BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server:
 security bump version to 21.1.24
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3b15bf90f183a8e0e4877a3ffeeff479dd0949d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.x.org/archives/xorg-announce/2026-July/003718.html
https://lists.x.org/archives/xorg-announce/2026-July/003716.html

Fixes
-  CVE-2026-55999: glamor Font Atlas Heap Buffer Overflow
-  CVE-2026-56000: GLX contextTags Use-After-Free in CommonMakeCurrent()

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
