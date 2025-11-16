Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1392CD4F3E
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 18:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79CB882324;
	Sun, 16 Nov 2025 18:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xV_8tj3p81Nb; Sun, 16 Nov 2025 18:51:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C980B822BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C980B822BB;
	Sun, 16 Nov 2025 18:51:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC7BA223
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 18:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D7FA40693
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 18:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90SF7rgKsI6r for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 18:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECA4140534
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECA4140534
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 18:51:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB8F084719; Sun, 16 Nov 2025 18:51:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 16 Nov 2025 19:17:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd3a2f0ff35346ad5fd6a9867113260addccf127
X-Git-Newrev: 2496f5fde286f57ccb9f930fca2e479e8f850cdb
X-Patchwork-Hint: ignore
Message-Id: <20251116185140.CB8F084719@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdvdread: bump version to 7.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2496f5fde286f57ccb9f930fca2e479e8f850cdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://code.videolan.org/videolan/libdvdread/blob/7.0.1/NEWS

Updated _SITE, switched tarball to xz and build system to meson.
Removed unneeded _CONF_ENV.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libdvdread/libdvdread.hash |  8 ++++----
 package/libdvdread/libdvdread.mk   | 11 +++++------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/libdvdread/libdvdread.hash b/package/libdvdread/libdvdread.hash
index 7fe0210727..5fb51ff47c 100644
--- a/package/libdvdread/libdvdread.hash
+++ b/package/libdvdread/libdvdread.hash
@@ -1,7 +1,7 @@
-# From http://download.videolan.org/pub/videolan/libdvdread/6.1.3/libdvdread-6.1.3.tar.bz2.sha1
-sha1  5e5721ff6ed01a9af9214be0d6563303e8bf2bed  libdvdread-6.1.3.tar.bz2
-# From http://download.videolan.org/pub/videolan/libdvdread/6.1.3/libdvdread-6.1.3.tar.bz2.sha256
-sha256  ce35454997a208cbe50e91232f0e73fb1ac3471965813a13b8730a8f18a15369  libdvdread-6.1.3.tar.bz2
+# From https://download.videolan.org/pub/videolan/libdvdread/7.0.1/libdvdread-7.0.1.tar.xz.sha1
+sha1  aaba59e0e04fa12704fab4230344549d8ae4b2e3  libdvdread-7.0.1.tar.xz
+# From https://download.videolan.org/pub/videolan/libdvdread/7.0.1/libdvdread-7.0.1.tar.xz.sha256
+sha256  2e3e04a305c15c3963aa03ae1b9a83c1d239880003fcf3dde986d3943355d407  libdvdread-7.0.1.tar.xz
 
 # Hash for license file:
 sha256  d6cb0e9e560f51085556949a84af12b79a00f10ab8b66c752537faf7cd665572  COPYING
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index bc486891ce..cc515606b2 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-LIBDVDREAD_VERSION = 6.1.3
-LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.bz2
-LIBDVDREAD_SITE = http://www.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_VERSION)
+LIBDVDREAD_VERSION = 7.0.1
+LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.xz
+LIBDVDREAD_SITE = https://download.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_VERSION)
 LIBDVDREAD_INSTALL_STAGING = YES
 LIBDVDREAD_LICENSE = GPL-2.0+
 LIBDVDREAD_LICENSE_FILES = COPYING
-LIBDVDREAD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
-LIBDVDREAD_CONF_OPTS = --with-libdvdcss
+LIBDVDREAD_CONF_OPTS = -Dlibdvdcss=enabled
 LIBDVDREAD_DEPENDENCIES = libdvdcss host-pkgconf
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
