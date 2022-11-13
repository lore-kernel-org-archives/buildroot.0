Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A60C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 17:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1F02813A3;
	Sun, 13 Nov 2022 17:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1F02813A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q-A3hoChSXIg; Sun, 13 Nov 2022 17:04:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C980A81343;
	Sun, 13 Nov 2022 17:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C980A81343
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A587E1BF2CB
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 17:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E1DB60BD2
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 17:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E1DB60BD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5WhVQE5NS3W for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 17:04:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C93260BCD
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 17:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C93260BCD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 747818376B; Sun, 13 Nov 2022 17:04:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 18:02:42 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 2e96a4c983edaef79a9d274f7bc7b6b99299f3b6
X-Git-Newrev: 2ea33143716c2c3024c1f0012b8618d4080a584e
X-Patchwork-Hint: ignore
Message-Id: <20221113170422.747818376B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x]
 package/libtorrent-rasterbar: openssl is optional, not mandatory
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ea33143716c2c3024c1f0012b8618d4080a584e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

openssl is optional, not mandatory, since the addition of the package in
commit 0393f5d34433e34e49ff7ce0fb998735453ed4fc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1d797892474b241eb00fca66ef1956e548233276)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtorrent-rasterbar/Config.in               | 1 -
 package/libtorrent-rasterbar/libtorrent-rasterbar.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/libtorrent-rasterbar/Config.in b/package/libtorrent-rasterbar/Config.in
index fe9a9fc027..459edc1be5 100644
--- a/package/libtorrent-rasterbar/Config.in
+++ b/package/libtorrent-rasterbar/Config.in
@@ -18,7 +18,6 @@ config BR2_PACKAGE_LIBTORRENT_RASTERBAR
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_SYSTEM
-	select BR2_PACKAGE_OPENSSL
 	help
 	  libtorrent is a feature complete C++ bittorrent implementation
 	  focusing on efficiency and scalability.
diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
index 914e0cbca3..085b38343c 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
@@ -11,7 +11,7 @@ LIBTORRENT_RASTERBAR_LICENSE = BSD-3-Clause
 LIBTORRENT_RASTERBAR_LICENSE_FILES = COPYING
 LIBTORRENT_RASTERBAR_CPE_ID_VENDOR = libtorrent
 LIBTORRENT_RASTERBAR_CPE_ID_PRODUCT = libtorrent
-LIBTORRENT_RASTERBAR_DEPENDENCIES = host-pkgconf boost openssl
+LIBTORRENT_RASTERBAR_DEPENDENCIES = host-pkgconf boost
 LIBTORRENT_RASTERBAR_INSTALL_STAGING = YES
 LIBTORRENT_RASTERBAR_CONF_OPTS = \
 	--with-boost-libdir=$(STAGING_DIR)/usr/lib \
@@ -37,4 +37,11 @@ else
 LIBTORRENT_RASTERBAR_CONF_OPTS += --without-libiconv
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBTORRENT_RASTERBAR_DEPENDENCIES += openssl
+LIBTORRENT_RASTERBAR_CONF_OPTS += --enable-encryption
+else
+LIBTORRENT_RASTERBAR_CONF_OPTS += --disable-encryption
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
