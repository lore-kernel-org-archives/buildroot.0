Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615FDD30CC0
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3733061019;
	Tue, 13 Jan 2026 21:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cybs9r_ctJ7T; Tue, 13 Jan 2026 21:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DFA861034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338022;
	bh=71K1z8qYMji1YIUcISPPj7G+2Vy9INSKyjY8YL1TicU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DgBOd+Y4n58/eTg7HhTPYLwGy13GEsINO2SqC0krvYW9z2Ladyk4UhdrxXySzGfWn
	 Zig/0fFOnxQomOfzo7BywEaTBHksVAtIIVVdjST7dZejGo5GoF0q+s5jMCEkmEXo39
	 2MXkEgFroTE4QWf35Ue/D81kiUMx69LcYe8AHQo6xwv8yBlnQnf+qZr3p91LDmhfkv
	 ow6ihCvIGZnUX3j1aWxdkk+RtTO5YgWwxlurExC2lF5d7/WrNRPhUH8MTjhSx9eWXp
	 /qdXepEOTWVXrKz6sNg8uDkrGs28fNMLgqFX7iRdV5N2TePhQpywh7UJVf0G+vYW3e
	 XD9Q7WX5RBkuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DFA861034;
	Tue, 13 Jan 2026 21:00:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F4C21CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76A03407BE
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6205earhgfq for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B521407D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B521407D0
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29C1081124; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e55fa544604e1a4ae7ac9f537056140e9a2751ac
X-Git-Newrev: 789649b2880a91930d0f90e012cea630e390da32
X-Patchwork-Hint: ignore
Message-Id: <20260113205850.29C1081124@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXext: bump version
 to 1.3.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=789649b2880a91930d0f90e012cea630e390da32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-February/003454.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libXext/xlib_libXext.hash | 6 +++---
 package/x11r7/xlib_libXext/xlib_libXext.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXext/xlib_libXext.hash b/package/x11r7/xlib_libXext/xlib_libXext.hash
index 2ab509598b..77284e2b37 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.hash
+++ b/package/x11r7/xlib_libXext/xlib_libXext.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003241.html
-sha256  db14c0c895c57ea33a8559de8cb2b93dc76c42ea4a39e294d175938a133d7bca  libXext-1.3.5.tar.xz
-sha512  fd9805982dabfb14b1526c0cb71f94508003fa3fcd60560d387465afd891c1dca61927ae86278436d53f4b840cacd1f412071fdc3dce1d6f730610a9c163d59b  libXext-1.3.5.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-February/003454.html
+sha256  edb59fa23994e405fdc5b400afdf5820ae6160b94f35e3dc3da4457a16e89753  libXext-1.3.6.tar.xz
+sha512  fd7693b5698cc4f5e80002a2cd4bd88e5d52c755c19a0417ee73029bd65f9d77b0969e765a1febc4d8fce1ba5dfb7278717f47be742e33d8fc5eb941e769792e  libXext-1.3.6.tar.xz
 # Locally computed
 sha256  fd62910be4b13829d94e76c1447cf840953f0e225c4dc6c79349c84dd0557f22  COPYING
diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
index 0bb3efa31f..bb35244b01 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXEXT_VERSION = 1.3.5
+XLIB_LIBXEXT_VERSION = 1.3.6
 XLIB_LIBXEXT_SOURCE = libXext-$(XLIB_LIBXEXT_VERSION).tar.xz
 XLIB_LIBXEXT_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXEXT_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
