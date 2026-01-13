Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0F4D30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45F3D82C4D;
	Tue, 13 Jan 2026 20:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ic3nfwqnpu8u; Tue, 13 Jan 2026 20:59:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F290E83E90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337994;
	bh=6LIVKrkQhuLHKyfYQXViJABJceX0VMej7yGoaCFsRZg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gH6Zohl8PqHbgQ4oIYbw9YLmK/vMREu2wyOBBIDlY5Epotn6Qzni7li7aNujtZHNL
	 OEGu7ctf8mFXgtZK6a490hdmmKj0nFMOe2OxZAI9KAwz+2Bskjey+b8HvXLOSWLWOI
	 B3JULAf3xU6gdM4iSgb+VsM5dhcN1cQNi9MjqYd+F8KhKoIPSgmvkZDPVmwIG30CSr
	 K+ReIz82I73i7a0yLQ+p/STW/YlFJC1INRIBr54SMAZeqYKMuMjNBVcxLIfaGrlX68
	 ih4yiNgvHOGvlo0YgRIKsGzFVjBDB34EsEUJZd3kaMliozcSROXxloe0ahrXFiCaT0
	 EhtAmW0XYVZag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F290E83E90;
	Tue, 13 Jan 2026 20:59:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FFF0231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29BFA4073D
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dwo7pXHnyFEf for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B59F40730
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B59F40730
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88B9180F55; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53ec417e40aea0057de037e3bb46bdc3b596effb
X-Git-Newrev: cca00dc4663b31b30ec5389181c58c6119e6feda
X-Patchwork-Hint: ignore
Message-Id: <20260113205848.88B9180F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xclipboard: bump
 version to 1.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=cca00dc4663b31b30ec5389181c58c6119e6feda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-August/003529.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xclipboard/xapp_xclipboard.hash | 6 +++---
 package/x11r7/xapp_xclipboard/xapp_xclipboard.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash b/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash
index d848a47342..9d78920389 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003171.html
-sha256  f43d4560d1464e8ff58e850212f6bdb703989b66d599fb61f351b5f9e077f253  xclipboard-1.1.4.tar.xz
-sha512  efa7800e0c4fb0242362c4263d80182d591bded07d1064a36b157b6202b15b0c82f083658ced2b82392eca905fb57c04a537d67e75c1237a1667ed2ce0cb09fe  xclipboard-1.1.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-August/003529.html
+sha256  8e47a4e18a88d47b14e8eb61a5f298687624a38f9decee9988d8b51a20514c45  xclipboard-1.1.5.tar.xz
+sha512  9962b8d19e6387c9af87a47d66d81577ec3e2ba1d0aa6f6ca8fa89664ccfb0dd20906e143a4d19a303a4eded4f29c4bd40868477fbf754a79cdb48256846a8d3  xclipboard-1.1.5.tar.xz
 # Locally computed
 sha256  f0a362fc1b8e788845b1c0ad7ba9ade58fdfb73da750c3b9780db5d70b947657  COPYING
diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
index c76d5ded3c..a49cee930a 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XCLIPBOARD_VERSION = 1.1.4
+XAPP_XCLIPBOARD_VERSION = 1.1.5
 XAPP_XCLIPBOARD_SOURCE = xclipboard-$(XAPP_XCLIPBOARD_VERSION).tar.xz
-XAPP_XCLIPBOARD_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XCLIPBOARD_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCLIPBOARD_LICENSE = MIT
 XAPP_XCLIPBOARD_LICENSE_FILES = COPYING
 XAPP_XCLIPBOARD_DEPENDENCIES = xlib_libXaw xlib_libXmu xlib_libXt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
