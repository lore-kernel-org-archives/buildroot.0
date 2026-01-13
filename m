Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4744D30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB38640DA3;
	Tue, 13 Jan 2026 21:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JmD0JcyXbbL; Tue, 13 Jan 2026 21:00:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAF7440E28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338027;
	bh=FLp6iqa8URZpqKPJSjS6MALaYbeMmO0oZXaiNVKhyMk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PQLiA+Yb7ajoFC+7nCI1lrpZb/UF83S7UJnPXAJ4EXuGZx5qa1jCreZMp5icPGmH4
	 /jP/Jv2uBjjtQtXn+dvEU/f/7Aj8/Hw2hin5TIxqC0d0/NGDPJfPmC47MesIFjrGzk
	 OJ4lEXjk0G5SwMUEIlFlJJoe/PVOySWreFCtV7A1ueY+p3r6baUuTVvyeXLgJ3vlRb
	 5Cil3TOyM4wlfeSkLEPwzVcAcT4SfrVqroJX4RGuodvITRS5ZL+p/PW3oEOlu6h2H0
	 HkfhPYmaga8OPEw+P6Xb8VtPQguHicTQEc1+HiSeJl4AGXrejC3ntPZVqC/iIQtHaj
	 Ag/grtHlBzvEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAF7440E28;
	Tue, 13 Jan 2026 21:00:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 56F131CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 21:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2632740772
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MNuIQ219FLdI for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77311407D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77311407D8
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75EAD80E26; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88d6e75a53c0cab855e0c4b70cfa8496ef59de75
X-Git-Newrev: dec410c63633a40f74caa51e214761178b821a27
X-Patchwork-Hint: ignore
Message-Id: <20260113205850.75EAD80E26@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/x11r7/xdriver_xf86-video-siliconmotion: bump version to 1.7.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=dec410c63633a40f74caa51e214761178b821a27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2023-September/003421.html

Switched tarball to xz.

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../xdriver_xf86-video-siliconmotion.hash                           | 5 +++--
 .../xdriver_xf86-video-siliconmotion.mk                             | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash
index eeff39fed1..bc664d85d6 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2017-January/002763.html
-sha256  d0f3c691e71108d27a061beb62bf78b36ec35bd755905692734dd68cfb3359bc  xf86-video-siliconmotion-1.7.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-September/003421.html
+sha256  16059c7833a288da43b1d179f5edd2b633e3b102bc5113488c5d41dd71158fc0  xf86-video-siliconmotion-1.7.10.tar.xz
+sha512  d8bb90e636598ed20a32bdc049fe42420d9e6093429f09c3a886a7e78d3813c8533abf67c4fed084be97dd7553a1934c49aa9f94d1083dfa64ab36867ae55fca  xf86-video-siliconmotion-1.7.10.tar.xz
 # Locally calculated
 sha256  e1e3ce7ce1f63fff96444206e09c8490ad7a4af7457c81ea6cdee4f1fee1f960  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
index 65fd846535..e84173d120 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION = 1.7.9
-XDRIVER_XF86_VIDEO_SILICONMOTION_SOURCE = xf86-video-siliconmotion-$(XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION = 1.7.10
+XDRIVER_XF86_VIDEO_SILICONMOTION_SOURCE = xf86-video-siliconmotion-$(XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_SILICONMOTION_LICENSE = MIT
 XDRIVER_XF86_VIDEO_SILICONMOTION_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_SILICONMOTION_DEPENDENCIES = xserver_xorg-server xorgproto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
