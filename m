Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB41D30CC3
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83D4D83D4A;
	Tue, 13 Jan 2026 21:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5JkPaYNrhykO; Tue, 13 Jan 2026 21:00:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85FE783EBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338003;
	bh=XVTcd6E4nRCrFYSEi6rrxDUCQ4H7nNQ8jGEr3hlOY8c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fiakeUIZKbs78ykGl44Na5uVsQdCUL448MyTH+2w3XH6Cff2vLHItpA7VQJzmbk/Z
	 EuYcCBiHxpQeaCKu4aeyMNYVseTzOilLv9aP5Z+P4O9NAOB9iXkzKzURK/K44lrj0m
	 1OKlbw6tuz51bW0D1GOivNv/UDzj3gILBQ2Gxy49WEGw5TTWVYnFm3pioWQeH1p4ES
	 sTQcd6Ti4EqfvPFBgdl/FXIcvoVSjWY4PFuQ+D86ljUDdUlUPlD/CO/OaobOHPTGjE
	 6RxbqaOOSq5bng5CTQ84FT3vH4RWzX88Qr7I0NfzRHZ6z4r0gG5EQIf2D/YveFGIDZ
	 CeAwsMdxm+/HA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85FE783EBA;
	Tue, 13 Jan 2026 21:00:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54F5A1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E588440794
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0rNMMeuXdw7x for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47889407BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47889407BD
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 463A98254B; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4dfa4f609ca239886ac3abcdc1b27811b7c4cee0
X-Git-Newrev: 735bd8bd9f74d7e10cbfc834adfef243f281094b
X-Patchwork-Hint: ignore
Message-Id: <20260113205849.463A98254B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_iceauth: bump version
 to 1.0.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=735bd8bd9f74d7e10cbfc834adfef243f281094b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-March/003480.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_iceauth/xapp_iceauth.hash | 6 +++---
 package/x11r7/xapp_iceauth/xapp_iceauth.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_iceauth/xapp_iceauth.hash b/package/x11r7/xapp_iceauth/xapp_iceauth.hash
index 694b6beaa1..fca34fbcb3 100644
--- a/package/x11r7/xapp_iceauth/xapp_iceauth.hash
+++ b/package/x11r7/xapp_iceauth/xapp_iceauth.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003140.html
-sha256  2cb9dfcb545683af77fb1029bea3fc52dcc8a0666f7b8b2d7373b6ed4c408c05  iceauth-1.0.9.tar.xz
-sha512  16b2f58008587cf1544037ca8b1c76dbb75eb043b3048b3064e66ba6b147962233f1453c2cf18bfb136dd6dd21d3e27b5219e17e1ab7b81dbe93fb6aff801a72  iceauth-1.0.9.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003480.html
+sha256  3deefb7da26af9dc799b5628d929d91c9af68c78575639944db3b955f29aa029  iceauth-1.0.10.tar.xz
+sha512  cfadac03a3f72f3c0bb58f67984a033847c76e7e3fdd9ebce583c0554d7f9484faf5053d878f5a82a543cdcc8e2ef8acecadb8830bd3c53584d7ec950cb51cc3  iceauth-1.0.10.tar.xz
 # Locally computed
 sha256  fdd9ba8ccb92af2f31f542e7b7a18c27257e6cdce147d231bc9ba3654ad84976  COPYING
diff --git a/package/x11r7/xapp_iceauth/xapp_iceauth.mk b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
index ba1f522911..fa65775e00 100644
--- a/package/x11r7/xapp_iceauth/xapp_iceauth.mk
+++ b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_ICEAUTH_VERSION = 1.0.9
+XAPP_ICEAUTH_VERSION = 1.0.10
 XAPP_ICEAUTH_SOURCE = iceauth-$(XAPP_ICEAUTH_VERSION).tar.xz
-XAPP_ICEAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_ICEAUTH_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_ICEAUTH_LICENSE = MIT
 XAPP_ICEAUTH_LICENSE_FILES = COPYING
 XAPP_ICEAUTH_DEPENDENCIES = xlib_libICE xlib_libX11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
