Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EEDD30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33C9F83DE8;
	Tue, 13 Jan 2026 21:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efhPgy4cxaQq; Tue, 13 Jan 2026 21:00:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48F3D83EC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338010;
	bh=1JiAO4hgfOZ7mXLzoUI6+CI4uwuaUM3sKlSUF7Pi96c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NWX24Wo8D4jxAlNrBwV9w2tKZaBDTLTfc33XMqeFnkNnnvGbEqNk3ZOua1Bnkl4uU
	 qeD/QJ2p7Jq6B19eLEFbDY+mkwdjEq1vJivNjlBFsvLwqzzXMnq6fVZrY2kRqYfflf
	 waPtfFg6M5QKRG8k/4M5GtzV3xDoaRFb8KA4Ean9dK/HN6biVI4RjDd0xZcHM1v29S
	 37FoY3G1QowFfhz8/PkODjXoGwzKH1bRzyoSVu6i3IRyw4QCN/mAAKUWvp7vCCfYcL
	 6TnYBYhkX9HKRbMUyVxWmDHYfmpGULEBs+SQrISFoPVx2blWBd+4ltUGwzRriIOz14
	 jZ9SDLHGi9VSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48F3D83EC8;
	Tue, 13 Jan 2026 21:00:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5311F231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 699314078E
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FbOzphbopIyc for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 780B640786
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 780B640786
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B1C181382; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6576a349bf06e5eb2a8200520ba9e4907af66be1
X-Git-Newrev: 70d7bed695fdc12f0ddaa3248e697b9cd335e81f
X-Patchwork-Hint: ignore
Message-Id: <20260113205848.4B1C181382@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xmag: bump version to
 1.0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=70d7bed695fdc12f0ddaa3248e697b9cd335e81f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-October/003536.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xmag/xapp_xmag.hash | 6 +++---
 package/x11r7/xapp_xmag/xapp_xmag.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xmag/xapp_xmag.hash b/package/x11r7/xapp_xmag/xapp_xmag.hash
index c0cfbcfa68..abd564dec8 100644
--- a/package/x11r7/xapp_xmag/xapp_xmag.hash
+++ b/package/x11r7/xapp_xmag/xapp_xmag.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003191.html
-sha256  009936cc5a2706084079127b26cf55c713767650a34cb69e5682d60e33ce7461  xmag-1.0.7.tar.xz
-sha512  d35ac5d977b9f3bd03fb919bf178f68bdbc6ef2a57915b407d836fce0582f5cb78d0b79043bb6f8d015464ca113deb09469c3b724aed03901a4c3fc4a9982984  xmag-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-October/003536.html
+sha256  326d3c583d795bb53ac609d144e7f7fb1499baba7eaec14b8e6cd232ea069532  xmag-1.0.8.tar.xz
+sha512  d4dbf6bf60a5a3ac88309cdc8f07284a20bd3b044795cd54e002ee5956fa317a09e5f21a9469a6fd9a786f109d8592d8b8e5128ac86850391a6445ccc1f7a11c  xmag-1.0.8.tar.xz
 # Locally computed
 sha256  ef8744e617719339c4934579f8558ee4a5aec4396bebd6af02562b63a7c16d27  COPYING
diff --git a/package/x11r7/xapp_xmag/xapp_xmag.mk b/package/x11r7/xapp_xmag/xapp_xmag.mk
index 0e8831d25b..5e7e2c7688 100644
--- a/package/x11r7/xapp_xmag/xapp_xmag.mk
+++ b/package/x11r7/xapp_xmag/xapp_xmag.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XMAG_VERSION = 1.0.7
+XAPP_XMAG_VERSION = 1.0.8
 XAPP_XMAG_SOURCE = xmag-$(XAPP_XMAG_VERSION).tar.xz
-XAPP_XMAG_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XMAG_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XMAG_LICENSE = MIT
 XAPP_XMAG_LICENSE_FILES = COPYING
 XAPP_XMAG_DEPENDENCIES = xlib_libXaw
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
