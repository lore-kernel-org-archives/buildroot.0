Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222AEE8FDA7
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA13260A3E;
	Fri, 26 Dec 2025 18:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDHrMoI4ycFZ; Fri, 26 Dec 2025 18:21:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 245CD60A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773293;
	bh=1JO13oJO9gLNRYT2DZ6WqZuhwbsiVPgIhMBiInukc4U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mFpeBna5dLvRUlxmqPfvSnJVeY1g3bLidRH5qcjXZyO/BMJ5ycAV9Iykn1qWZBr7q
	 EGHC605UBwXsgaLeKVSVbs+45nUHNFZ5DBSV/llj8Mowb6XBYemBZ25iE8imjPwkuY
	 6oJqKXV8UA0Bh7oaz2STB/okkeiEtdZa8T4vvDk6fB/dxV+nGP4CuqO/oxhrGqI9eV
	 1E2Gh88lyVOAYvLOBotGXGUiSgHW1+TEIQ9dkzrDkgyJl55mMp6VrH7Oy/IxnFkU63
	 /2/Qy1IG6D9tNTLxbEWkxI6a2PVg4brm3ra/Lch6ZrT1VOA74vwpyoCnxu4Xd19ycw
	 yX1DrL1OJWW8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 245CD60A4E;
	Fri, 26 Dec 2025 18:21:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B605B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E8D780C23
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bve1X859XDId for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFE4C80C68
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFE4C80C68
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD95A81840; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 972358973fef8c8e2d314d77eaf9a6b6229eb64a
X-Git-Newrev: f183a97de64cf8f3549f8544f572537a590d58e6
X-Patchwork-Hint: ignore
Message-Id: <20251226182055.DD95A81840@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-savage:
 bump version to 2.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f183a97de64cf8f3549f8544f572537a590d58e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2024-March/003490.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash  | 6 +++---
 .../x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash
index 4482ff5991..c7a3aadfc5 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-April/003381.html
-sha256  b36cf02cfdd08a39423bb977c45397fbca5813267c727f0fd3c963ac38b601fd  xf86-video-savage-2.4.0.tar.xz
-sha512  a4db097c200f1430887e4c52bbe14aeaaa2c73dfc392beeed104c682114bd067f89b69994d649829cdc5d188cdbe7a41b22c82b0b49e3a02cdf366013ebbc161  xf86-video-savage-2.4.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003490.html
+sha256  674191160c61982199c582233c5f1df5163a09f3ecbcb3d5bb5079b31a7d10af  xf86-video-savage-2.4.1.tar.xz
+sha512  7928dafa148340e4a6c0ecd2324a69a67aa8fec55d316468c7e68fd79d1a388fd0e1f593d39b6dab0c8a5876b23e7c65c037a3285d340fa82b27ec7c2d5c8713  xf86-video-savage-2.4.1.tar.xz
 # Locally calculated
 sha256  611f4020815e3d5011a39a58f0958262715cd3becd9cb1ef14cc166fd84ec5a6  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
index 03983d5cdc..ceca5a38a1 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SAVAGE_VERSION = 2.4.0
+XDRIVER_XF86_VIDEO_SAVAGE_VERSION = 2.4.1
 XDRIVER_XF86_VIDEO_SAVAGE_SOURCE = xf86-video-savage-$(XDRIVER_XF86_VIDEO_SAVAGE_VERSION).tar.xz
 XDRIVER_XF86_VIDEO_SAVAGE_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_SAVAGE_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
