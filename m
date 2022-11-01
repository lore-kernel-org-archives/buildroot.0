Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA7AC4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E291681327;
	Tue,  1 Nov 2022 20:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E291681327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Jfs1r-KGsDC; Tue,  1 Nov 2022 20:20:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 172A58131F;
	Tue,  1 Nov 2022 20:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 172A58131F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 185AA1BF307
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7EE440462
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7EE440462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SV_0fWXJLS1d for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:20:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B89D401C9
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 20:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B89D401C9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0497285C23; Tue,  1 Nov 2022 20:20:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Nov 2022 21:19:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e124a4d1c09ee7ee1f9f33585db1904577feaf35
X-Git-Newrev: 1d797892474b241eb00fca66ef1956e548233276
X-Patchwork-Hint: ignore
Message-Id: <20221101202023.0497285C23@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtorrent-rasterbar: openssl is
 optional, not mandatory
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1d797892474b241eb00fca66ef1956e548233276
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openssl is optional, not mandatory, since the addition of the package in
commit 0393f5d34433e34e49ff7ce0fb998735453ed4fc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
