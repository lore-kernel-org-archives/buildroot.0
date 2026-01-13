Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF58D30CC0
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A44E140C91;
	Tue, 13 Jan 2026 21:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HTYQf8JO9Aj; Tue, 13 Jan 2026 21:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2D8540DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338014;
	bh=OW3hdA8ubjOpdwiDYtV2gikbRGez0e569XxJhCBHLAA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pp8e8OhVZi3nZQohfTw711w9hZKRhHKIPODDJNYTFmjWz5s14UoDExhdmwOSxaRTq
	 xHFc3ywKBGWVEJndHg3SyVmfOk4t4tu7JBmrw1Wg0ij7PVC2e6nU2/54JM46MQXZLm
	 IafVnwk53vbpARvK5+P2Js1P1K5Bx9V6N15z7arP1XPWN2qUGYFqXd9vxTuuTUIaWi
	 3wkta3GwHP83WW+SS9zjhGhp/XawoYXWFgP4pLsCV5ZQC/fDwNsuKqDRqiaPGJv3BB
	 2QWZwZWisb4cRvmM6rzlhz4QYKriIoaJ2YZaM1172G2aQQupVc9mSBv9BR63+Nfd6E
	 0By63LlDfMEGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2D8540DED;
	Tue, 13 Jan 2026 21:00:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9218F231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4DC9407A7
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QTDxe0flpmbP for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93C8C40759
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93C8C40759
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 925CA81382; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff0e43faa95a48230fa2a377a39c5999c38f8c35
X-Git-Newrev: bbe10c784a02d6ce10fb5a336b05ef30064c59a0
X-Patchwork-Hint: ignore
Message-Id: <20260113205849.925CA81382@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xmessage: bump version
 to 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=bbe10c784a02d6ce10fb5a336b05ef30064c59a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-March/003475.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xmessage/xapp_xmessage.hash | 6 +++---
 package/x11r7/xapp_xmessage/xapp_xmessage.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.hash b/package/x11r7/xapp_xmessage/xapp_xmessage.hash
index 07952220d0..01e5f8b057 100644
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.hash
+++ b/package/x11r7/xapp_xmessage/xapp_xmessage.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003187.html
-sha256  d2eac545f137156b960877e052fcc8e29795ed735c02f7690fd7b439e6846a12  xmessage-1.0.6.tar.xz
-sha512  89deb7a81bd047027f99cb92cd16a47f94479c61a6f9fbac4638e6d642037b3e9bbac2313db59ac8c5544175947c693f6a210537c6df2b88dc3de1c67498cba8  xmessage-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003475.html
+sha256  703fccb7a0b772d61d7e603c189b9739866aa97ba985c727275420f829a30356  xmessage-1.0.7.tar.xz
+sha512  0c44f7973f7ed8d7993aaeb457a8921301cb0de905e45d92bd99d49463223b54c704a28bef376fe6038b4aec7156be873a34294741c8537bb7a5a57e1f152cce  xmessage-1.0.7.tar.xz
 # Locally computed
 sha256  dfd5427188bd6d6647ad1a9a0644428403c6239f6aa7f9d1a17629d8cc0a4ecd  COPYING
diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.mk b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
index 52a9f32631..14e2edaac2 100644
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.mk
+++ b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XMESSAGE_VERSION = 1.0.6
+XAPP_XMESSAGE_VERSION = 1.0.7
 XAPP_XMESSAGE_SOURCE = xmessage-$(XAPP_XMESSAGE_VERSION).tar.xz
-XAPP_XMESSAGE_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XMESSAGE_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XMESSAGE_LICENSE = MIT
 XAPP_XMESSAGE_LICENSE_FILES = COPYING
 XAPP_XMESSAGE_DEPENDENCIES = xlib_libXaw
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
