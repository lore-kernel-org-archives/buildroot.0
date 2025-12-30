Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A41CE95A77
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 11:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18F3D60B15;
	Tue, 30 Dec 2025 11:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id obpJkmye85J3; Tue, 30 Dec 2025 11:14:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E253606B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767093287;
	bh=ukTtnscbCzMdBDK4zeEJOR4FPn1urwQLo6sx8aRovys=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=evfMSeqeilIKLSDzB0HEbGHljg+sDEcgVS3nb0K6VsHsH41Fxq663KBK6WGehosAC
	 RPwwIxjsaVhI1qE238pUAr2vn2fbNuZz1O5Uqk9FOIqG0M6dw4hVXntm6dDkjK1UJJ
	 We7g0H+O3fUxU0UZD5v0ik/4yrG6Z/UODpgxaCRZeYuZ7Z7kq71cXIy0Wibb2Y6Q3B
	 f8Xy7OTO6zxVQoTqUUSzaAl2jUTFRtwTU8jEWhoBBgSKqx7XPBEKG06hpXSpBu6jNW
	 XmFu9iu0c1KpAGngPfAkCe4aIyFI8uNCocG286egjdY1S9FwCSNl0VO82qyJLtLQGQ
	 UQBBgyWL9HVrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E253606B1;
	Tue, 30 Dec 2025 11:14:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F972372
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 564C2606EB
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4wkqbUY5_r9e for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 11:14:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AE2160619
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AE2160619
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:14:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8941E87C24; Tue, 30 Dec 2025 11:14:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 11:57:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac47f65186d775ae98fda7429e007ff59e278c51
X-Git-Newrev: 60fa1d6981093c77c29bd1074dca8b898c0f3fea
X-Patchwork-Hint: ignore
Message-Id: <20251230111444.8941E87C24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpqxx: bump version to 7.10.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=60fa1d6981093c77c29bd1074dca8b898c0f3fea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/jtv/libpqxx/blob/7.10.4/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpqxx/libpqxx.hash | 2 +-
 package/libpqxx/libpqxx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpqxx/libpqxx.hash b/package/libpqxx/libpqxx.hash
index 5fb93cbe63..067a2c8d2a 100644
--- a/package/libpqxx/libpqxx.hash
+++ b/package/libpqxx/libpqxx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  cfbbb1d93a0a3d81319ec71d9a3db80447bb033c4f6cee088554a88862fd77d7  libpqxx-7.10.1.tar.gz
+sha256  e578677d0c1b0f7ad37ac2d9ac373bc9738a3732083c70672da5f2c3028e6b03  libpqxx-7.10.4.tar.gz
 sha256  2ccd31347a87796860a6600f57bf97ff4d54c203ecce4ea040425ba79774cf5f  COPYING
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index 4364dd09a9..f19420dc41 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPQXX_VERSION = 7.10.1
+LIBPQXX_VERSION = 7.10.4
 LIBPQXX_SITE = $(call github,jtv,libpqxx,$(LIBPQXX_VERSION))
 LIBPQXX_INSTALL_STAGING = YES
 LIBPQXX_DEPENDENCIES = postgresql
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
