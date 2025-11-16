Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2ABCD4F3E
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 18:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CC8A60B6E;
	Sun, 16 Nov 2025 18:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pg9ckVEKiKp9; Sun, 16 Nov 2025 18:51:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC54860ABB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC54860ABB;
	Sun, 16 Nov 2025 18:51:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B565DD5
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 18:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C327822BB
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 18:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCLD3tS_MS8o for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 18:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E35DF821D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E35DF821D2
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 18:51:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D425484723; Sun, 16 Nov 2025 18:51:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 16 Nov 2025 19:17:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2496f5fde286f57ccb9f930fca2e479e8f850cdb
X-Git-Newrev: a7a56546e299312fb1c47a7526171750abda9dc0
X-Patchwork-Hint: ignore
Message-Id: <20251116185140.D425484723@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdvdnav: bump version to 7.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7a56546e299312fb1c47a7526171750abda9dc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://code.videolan.org/videolan/libdvdnav/-/blob/7.0.0/ChangeLog

Updated _SITE, switched tarball to xz and build system to meson.
Removed unneeded _CONF_ENV.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: fix check-package error in hash file]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libdvdnav/libdvdnav.hash | 8 ++++----
 package/libdvdnav/libdvdnav.mk   | 9 ++++-----
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/libdvdnav/libdvdnav.hash b/package/libdvdnav/libdvdnav.hash
index 61d64b8ee3..e7663cd67f 100644
--- a/package/libdvdnav/libdvdnav.hash
+++ b/package/libdvdnav/libdvdnav.hash
@@ -1,7 +1,7 @@
-# From http://download.videolan.org/pub/videolan/libdvdnav/6.1.1/libdvdnav-6.1.1.tar.bz2.sha1
-sha1  7ac76aa95d046db715763da23b7053b65cbc7540  libdvdnav-6.1.1.tar.bz2
-# From http://download.videolan.org/pub/videolan/libdvdnav/6.1.1/libdvdnav-6.1.1.tar.bz2.sha256
-sha256  c191a7475947d323ff7680cf92c0fb1be8237701885f37656c64d04e98d18d48  libdvdnav-6.1.1.tar.bz2
+# From https://download.videolan.org/pub/videolan/libdvdnav/7.0.0/libdvdnav-7.0.0.tar.xz.sha1
+sha1  186c7846d31f474bfecc213bc483f0064d0d7cdf  libdvdnav-7.0.0.tar.xz
+# From https://download.videolan.org/pub/videolan/libdvdnav/7.0.0/libdvdnav-7.0.0.tar.xz.sha256
+sha256  a2a18f5ad36d133c74bf9106b6445806fa253b09141a46392550394b647b221e  libdvdnav-7.0.0.tar.xz
 
 # Hash for license file:
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index e34c0710bc..c4325c4711 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-LIBDVDNAV_VERSION = 6.1.1
-LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.bz2
-LIBDVDNAV_SITE = http://www.videolan.org/pub/videolan/libdvdnav/$(LIBDVDNAV_VERSION)
+LIBDVDNAV_VERSION = 7.0.0
+LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.xz
+LIBDVDNAV_SITE = https://download.videolan.org/pub/videolan/libdvdnav/$(LIBDVDNAV_VERSION)
 LIBDVDNAV_INSTALL_STAGING = YES
-LIBDVDNAV_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 LIBDVDNAV_DEPENDENCIES = libdvdread host-pkgconf
 LIBDVDNAV_LICENSE = GPL-2.0+
 LIBDVDNAV_LICENSE_FILES = COPYING
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
