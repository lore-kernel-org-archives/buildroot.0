Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8259CD30CC4
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AAAB84015;
	Tue, 13 Jan 2026 21:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LY6qLgXRTi6x; Tue, 13 Jan 2026 21:00:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F60284021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338023;
	bh=4fRpil/TPA0kHajOvTBcQmKBm1HZcjG4dxLhtcNrQZQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GkveylDgM26sWENL+yJIopOCwQgOJOM4XDtkvVa+bM68H+k4lRIaQd/IqUxgMTl+H
	 2/ZhRNlrVa3sFTb5XGxOvlJOawDEH3e9U8VZyIjLuBLN94pEs57AhxbuPszFc+z4sY
	 t3CCy28XWEI60NZ5yjiPG9osumkMp85tyG4lSwIvAo0Z59QFm0U4pxAe+fEw5mOkUs
	 FhC011JKCn73ePYljXm0EoLoerr8hI7MutAqosI0Yev/cRCPDq9pRfNY4Hq0vyPs5k
	 1NrdpvmnoDZKpX1k6sUxziQEJ32xIe2Hv5eAoNmxxUHBBW3+qx7rTWdCwbr4nef0YV
	 sT3U5M5sV7fYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F60284021;
	Tue, 13 Jan 2026 21:00:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45ECA231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4D13407C2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5C0KjIjzR0V for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85E1340795
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85E1340795
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84F8E80F55; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 112cb83455f5f591de17c5ed2fec519b41dfdedd
X-Git-Newrev: ff0e43faa95a48230fa2a377a39c5999c38f8c35
X-Patchwork-Hint: ignore
Message-Id: <20260113205849.84F8E80F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xmh: bump version to
 1.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff0e43faa95a48230fa2a377a39c5999c38f8c35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-March/003476.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xmh/xapp_xmh.hash | 6 +++---
 package/x11r7/xapp_xmh/xapp_xmh.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xmh/xapp_xmh.hash b/package/x11r7/xapp_xmh/xapp_xmh.hash
index f0c9fa9567..d917c5a6ec 100644
--- a/package/x11r7/xapp_xmh/xapp_xmh.hash
+++ b/package/x11r7/xapp_xmh/xapp_xmh.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-August/003208.html
-sha256  e82c425a4c4156eee2e344d2e952f3fd816e03973005cd656ec1e9acf6f329db  xmh-1.0.4.tar.xz
-sha512  03bba7d3e7c2070b03378335aed0188dd0fd0a488f19dc5ad3f26674a9b38e6599377d082328041dd3ab72123ed60acae32cff19d7149517545b80e1339db26a  xmh-1.0.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003476.html
+sha256  2e8055b065e0492450a2c0bd8842b48ba7b0f0f377736a219b1752d0eec64c70  xmh-1.0.5.tar.xz
+sha512  fbf5c7e7994832b1df0db9464aacddba6a445c6fe6b8d2e09c311dc27edb96f6e198816ee21b5ee361fb9637302ce54da2691c784e03ab5c1af8590f00b48bab  xmh-1.0.5.tar.xz
 # Locally computed
 sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
diff --git a/package/x11r7/xapp_xmh/xapp_xmh.mk b/package/x11r7/xapp_xmh/xapp_xmh.mk
index db6102eb75..92b2bd2217 100644
--- a/package/x11r7/xapp_xmh/xapp_xmh.mk
+++ b/package/x11r7/xapp_xmh/xapp_xmh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XMH_VERSION = 1.0.4
+XAPP_XMH_VERSION = 1.0.5
 XAPP_XMH_SOURCE = xmh-$(XAPP_XMH_VERSION).tar.xz
 XAPP_XMH_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XMH_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
