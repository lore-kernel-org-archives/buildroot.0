Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D83CC4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 22:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A4B340BD6;
	Wed, 14 Dec 2022 22:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A4B340BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YLUVWf3iIpye; Wed, 14 Dec 2022 22:15:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 737F440BC4;
	Wed, 14 Dec 2022 22:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 737F440BC4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B04AB1BF947
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 22:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 954A760C09
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 22:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 954A760C09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lx4LzHaLSAZ2 for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 22:14:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7EE560F2C
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 22:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7EE560F2C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1C34866F8; Wed, 14 Dec 2022 22:14:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 23:14:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa409d82fc64ee28e7ef9a649875fc577c33f01b
X-Git-Newrev: f62d409cb8d1bcd015b9ca4aeca31b2d1c8dbf02
X-Patchwork-Hint: ignore
Message-Id: <20221214221445.A1C34866F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xhost: bump version to
 1.0.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=f62d409cb8d1bcd015b9ca4aeca31b2d1c8dbf02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2022-December/003301.html

Updated license hash due to copyright year bump:
https://gitlab.freedesktop.org/xorg/app/xhost/-/commit/167ad7fa3a339da96798da49d05c3125045a87c2

Switched tarball to xz, updated _SITE.

Added optional support for gettext:
https://gitlab.freedesktop.org/xorg/app/xhost/-/commit/167ad7fa3a339da96798da49d05c3125045a87c2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xhost/xapp_xhost.hash | 10 ++++------
 package/x11r7/xapp_xhost/xapp_xhost.mk   |  9 +++++----
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/x11r7/xapp_xhost/xapp_xhost.hash b/package/x11r7/xapp_xhost/xapp_xhost.hash
index 71eabccc44..fea2588c6d 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.hash
+++ b/package/x11r7/xapp_xhost/xapp_xhost.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002950.html
-md5  a48c72954ae6665e0616f6653636da8c  xhost-1.0.8.tar.bz2
-sha1  971670858a464d4f8eeb6f4e182f9fcd94149790  xhost-1.0.8.tar.bz2
-sha256  a2dc3c579e13674947395ef8ccc1b3763f89012a216c2cc6277096489aadc396  xhost-1.0.8.tar.bz2
-sha512  55581f9bc45a70a73b13fe718ca83c4cb0a6116d26addc0f07659ebeb5bf7d2379e84cab5a1702ae77a298a66f42ae03f41ddc7d5acd61c6f18448e58ad7cb6b  xhost-1.0.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003301.html
+sha256  ea86b531462035b19a2e5e01ef3d9a35cca7d984086645e2fc844d8f0e346645  xhost-1.0.9.tar.xz
+sha512  d281a0df0a036d693ce7dbe0d1d53839110d203f42454bf4d33a49fbfddec078149969b6ad76641e40e207ddc8317ea563088c59025fc57d8245e5ed27f79818  xhost-1.0.9.tar.xz
 # Locally computed
-sha256  7e69bed6fcfff05ecf454d7e4b29cd265172385833f1978f04b638f92f2cfecf  COPYING
+sha256  d3106697fb05dea4e9899b9e782ae7c3c17086d5b3dc7966494fc83fda9e468e  COPYING
diff --git a/package/x11r7/xapp_xhost/xapp_xhost.mk b/package/x11r7/xapp_xhost/xapp_xhost.mk
index e9fb155216..55f7ca5cc7 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.mk
+++ b/package/x11r7/xapp_xhost/xapp_xhost.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-XAPP_XHOST_VERSION = 1.0.8
-XAPP_XHOST_SOURCE = xhost-$(XAPP_XHOST_VERSION).tar.bz2
-XAPP_XHOST_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XHOST_VERSION = 1.0.9
+XAPP_XHOST_SOURCE = xhost-$(XAPP_XHOST_VERSION).tar.xz
+XAPP_XHOST_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XHOST_LICENSE = MIT
 XAPP_XHOST_LICENSE_FILES = COPYING
-XAPP_XHOST_DEPENDENCIES = xlib_libX11 xlib_libXmu
+XAPP_XHOST_DEPENDENCIES = xlib_libX11 xlib_libXmu $(TARGET_NLS_DEPENDENCIES)
+XAPP_XHOST_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
