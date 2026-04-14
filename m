Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3B3F9D0F3
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 19:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65E4F61BC9;
	Tue, 14 Apr 2026 19:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QVJX4-P8cagI; Tue, 14 Apr 2026 19:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7564361BD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776195690;
	bh=3p8mAnwKs3T3jpXHb32AVIc7stMujQsectqnHmZNnEQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YdVgloIfmrPJhj3mA79XMUz67eB1zS94he7jD7qoWzIl/WAxZnjmHeGxpYYMd34e/
	 ohSn+d2TwP2MvrRYVqxGwjOPZSsDDA0zQv3M/nnl5H/A1OHFakKqeHGGfp5F3R8trz
	 WWGYRmBhR52kThE4RLpF0h7yWJQye5HDhHe1083B20c395YlGJxUUpIIZjrUleRmF8
	 /A+XQFiGGWe5mVhVKbPQwjR5r3QUxdR8nLRtuqHdCr5hQaMEY+aQyJFA+vbFhZhES0
	 y0pRU9wJ8y0Q7dFp6V24ZqJ2E6BGycHEh9ucN30aBnt7LKcyP6qBYGwXQ1pEIyVy2g
	 HS7Fs9ERfF9iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7564361BD8;
	Tue, 14 Apr 2026 19:41:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F061375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90E6D42A51
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-fW1YNjYCQN for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 19:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE04E42AB4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE04E42AB4
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:41:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4612E81524; Tue, 14 Apr 2026 19:41:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 21:25:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7518efc192069262e181578ff5e8c8ff06d445f5
X-Git-Newrev: 0136eba1108ff87cee9c8e6173bec422ee23ba82
X-Patchwork-Hint: ignore
Message-Id: <20260414194126.4612E81524@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server:
 security bump version to 21.1.22
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0136eba1108ff87cee9c8e6173bec422ee23ba82
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.x.org/archives/xorg-announce/2026-April/003678.html

Updated license hash due to upstream commits:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/3069f64d691db5396706c1ec1182bd8db52ffb22
https://gitlab.freedesktop.org/xorg/xserver/-/commit/dd924b160c9b434ff7687d1e1d2a9058cdefb6b8

Fixes the following CVEs:

* CVE-2026-33999: XKB Integer Underflow in XkbSetCompatMap()
* CVE-2026-34000: XKB Out-of-bounds Read in CheckSetGeom()
* CVE-2026-34001: XSYNC Use-after-free in miSyncTriggerFence()
* CVE-2026-34002: XKB Out-of-bounds read in CheckModifierMap()
* CVE-2026-34003: XKB Buffer overflow in CheckKeyTypes()

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 8 ++++----
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index ceca9c215b..b7adf1559d 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2025-November/003643.html
-sha256  c0cbe5545b3f645bae6024b830d1d1154a956350683a4e52b2fff5b0fa1ab519  xorg-server-21.1.21.tar.xz
-sha512  bb2eb4e6756eb9e38b61bd47c017da44bcf5f45f2b7a906b4bb3a56b3d791cec64abb9bf37b224efe1e4fab9cc296f3672c9b2f8e00e1cdfc54337bef63cd16c  xorg-server-21.1.21.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-April/003678.html
+sha256  1a242c8917c49ba29ccc1f6021613d8a2b9805dd0d271a66ae9d09f4b0bb06b3  xorg-server-21.1.22.tar.xz
+sha512  6cb37ff971e10eb4a7dfcb3e8071afd769c7632d50e4ad8bc948b810dc4847e152b8a05ec135f55e0695b35908abd07e7728ef85dd3135456fd532e919f440f4  xorg-server-21.1.22.tar.xz
 # Locally calculated
-sha256  abbb7969df55e399e91104ded4d0a20a1b67de7c01138e63d61b7ed4f81fec0d  COPYING
+sha256  c9f90a6669109aad6c9a7c3b46cc2c574221a73b792afa419336816b49da5c11  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 0dc3a4a5c6..d1e7267c27 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.21
+XSERVER_XORG_SERVER_VERSION = 21.1.22
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
