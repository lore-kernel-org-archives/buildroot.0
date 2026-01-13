Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CCCD30CC4
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D83A84023;
	Tue, 13 Jan 2026 21:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BdZi7ITQAPa; Tue, 13 Jan 2026 21:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A613184032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338026;
	bh=vmesWY919CvV3gCe3XsQ1UFa4baajwQA9KBH87kxRgc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PoXq8dLK9ZVawmCCru9snL27KUVxD/H9wQIe8bCy8OqzcfOnfJwPnDd3aEYBTnECt
	 Uf9GcrFLy0Nr0HoPVSQsg4TUG4rLxR7L/rmQc5ooLFACUBvGhfyK4aaLbQ9wTEuIm4
	 XVJAzleVnj3z5h+5a1N2N7uR+T7OXwOUXLlpS9IskOO9MJwKSMIhN7I/WTO0ek84Tm
	 gxYdrwLPWHJGaI27ddiQq1Ugx5Z4ZSv9fceXk/yEfUj0OXFioIl1+d6/1dYGElcBjw
	 1FMTTFU86eWzr2ZUk1qUUpIS71vXCW1XaedufRUxgIzx+zW5JXG9RT0CXbRlenQKd5
	 bIb47rdNWAkLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A613184032;
	Tue, 13 Jan 2026 21:00:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1994B1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 21:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 052EF40799
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E476p1Z_yOjA for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6E16407AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6E16407AF
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A536B80F55; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3db688e649ad7ae30a859d6cbf76c8f2ef32a526
X-Git-Newrev: 6f8f5689d310c92535bc84d1a3686653cad3244d
X-Patchwork-Hint: ignore
Message-Id: <20260113205848.A536B80F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXtst: bump version
 to 1.2.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f8f5689d310c92535bc84d1a3686653cad3244d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-August/003525.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libXtst/xlib_libXtst.hash | 6 +++---
 package/x11r7/xlib_libXtst/xlib_libXtst.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.hash b/package/x11r7/xlib_libXtst/xlib_libXtst.hash
index 7bdcdb9c17..5d4b60b31d 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.hash
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-September/003214.html
-sha256  84f5f30b9254b4ffee14b5b0940e2622153b0d3aed8286a3c5b7eeb340ca33c8  libXtst-1.2.4.tar.xz
-sha512  f2f4e01239b892b8e26284cede90feb4fe7738beb243bca0f6adb349029f8bf87b5a482911edcd2401733c92ef78eec07fcd455b92e5b8c4828374769e60098d  libXtst-1.2.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-August/003525.html
+sha256  b50d4c25b97009a744706c1039c598f4d8e64910c9fde381994e1cae235d9242  libXtst-1.2.5.tar.xz
+sha512  848fa580d7abccd48c9ca3440f92e299839ada0912ed60d38d4d4f5bf37431cd02d7059265ab4e524c3e2cb9c368b9b90b863d1ed97d74979ef8811fc5e635a9  libXtst-1.2.5.tar.xz
 # Locally computed
 sha256  940190489c7a0e5ae3d83fc4fcbd79e0cd1b765bf1a4efd408293c1ee0332ceb  COPYING
diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index 47103377aa..4e019f75dd 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXTST_VERSION = 1.2.4
+XLIB_LIBXTST_VERSION = 1.2.5
 XLIB_LIBXTST_SOURCE = libXtst-$(XLIB_LIBXTST_VERSION).tar.xz
 XLIB_LIBXTST_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXTST_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
