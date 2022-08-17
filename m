Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C87C25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 06:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03C5A6105D;
	Wed, 17 Aug 2022 06:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03C5A6105D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ko8p5aAvxFpe; Wed, 17 Aug 2022 06:42:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FC9260F8E;
	Wed, 17 Aug 2022 06:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FC9260F8E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19C6A1BF9C6
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 06:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7DB261059
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 06:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7DB261059
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YbyQmR50bWK6 for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 06:41:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 272BD60F8E
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 06:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 272BD60F8E
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D8E1A87958; Wed, 17 Aug 2022 06:26:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Aug 2022 07:49:34 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: ae505761d0529c6b2f6734802db973084da00846
X-Git-Newrev: 864b246bd6e0eb250970029c56b284887d077291
X-Patchwork-Hint: ignore
Message-Id: <20220817062655.D8E1A87958@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 package/x11r7/xserver_xorg-server: security bump version to 21.1.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=864b246bd6e0eb250970029c56b284887d077291
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fixes CVE-2022-2319 & CVE-2022-2320:
https://lists.x.org/archives/xorg-announce/2022-July/003192.html

Release notes:
https://lists.x.org/archives/xorg-announce/2022-July/003193.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 948c7b2f2c7fa1a4c466b3331cc182dd90a67d11)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index b5635b9afa..4b2090fa99 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2022-January/003127.html
-sha256  61d6aad5b6b47a116b960bd7f0cba4ee7e6da95d6bb0b127bde75d7d1acdebe5  xorg-server-21.1.3.tar.xz
-sha512  cf5fed023eadda62ae732f8c4d427c272ebe005188341290f3d03147042c103b00cbb94d86a0256da815fb9b9a3da315c21a05ee0c926c1a2ff0c54ab0c0638b  xorg-server-21.1.3.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-July/003193.html
+sha256  5cc4be8ee47edb58d4a90e603a59d56b40291ad38371b0bd2471fc3cbee1c587  xorg-server-21.1.4.tar.xz
+sha512  eb5b8520d02908f72719e6ecfbf7a9bf139acb65ccae04d1db4223a8a2384cd3a94bd5afef10cce327b751b800cc2b79bfaa5ae35c95c3a217f775168082e68f  xorg-server-21.1.4.tar.xz
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 43d2038a8d..18ddd1cb07 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.3
+XSERVER_XORG_SERVER_VERSION = 21.1.4
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
