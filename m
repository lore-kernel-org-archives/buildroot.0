Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D1BCCD1A5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 16:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C997E606D9;
	Sun, 26 Oct 2025 16:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 23w2BcZxM9wI; Sun, 26 Oct 2025 16:22:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C93AB608FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C93AB608FD;
	Sun, 26 Oct 2025 16:22:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A74C743F
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 16:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A50E482D12
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 16:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YGJwgDMyWrpk for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 16:22:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE74782CF9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE74782CF9
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 16:22:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEBE580FA8; Sun, 26 Oct 2025 16:22:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Oct 2025 17:06:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 632aade2c5830b2d07df7d81f978ffa17a06a0f4
X-Git-Newrev: fabcd7c8cc44e7e03c68bfcd2b4e2d10331a93f6
X-Patchwork-Hint: ignore
Message-Id: <20251026162236.BEBE580FA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bitcoin: bump to version 30.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=fabcd7c8cc44e7e03c68bfcd2b4e2d10331a93f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://bitcoincore.org/en/releases/29.0/
https://bitcoincore.org/en/releases/30.0/

License file hash changed, due to year update in upstream commit:
https://github.com/bitcoin/bitcoin/commit/b537a2c02a9921235d1ecf8c3c7dc1836ec68131

Switch build system to CMake.

https://bitcoincore.org/en/releases/29.0/
- The minimum required CMake version is 3.22.
- In-source builds are not allowed.
- MiniUPnPc and libnatpmp have been removed as dependencies

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bitcoin/Config.in    |  1 +
 package/bitcoin/bitcoin.hash |  8 ++++----
 package/bitcoin/bitcoin.mk   | 35 +++++++++++------------------------
 3 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index 425e99ce8b..3240462f56 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_BITCOIN
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_USE_WCHAR
+	select BR2_HOST_CMAKE_AT_LEAST_3_22
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_FILESYSTEM
diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
index c7dad34d0a..4f4061ed77 100644
--- a/package/bitcoin/bitcoin.hash
+++ b/package/bitcoin/bitcoin.hash
@@ -1,7 +1,7 @@
-# Hash from: https://bitcoincore.org/bin/bitcoin-core-28.0/SHA256SUMS
+# Hash from: https://bitcoincore.org/bin/bitcoin-core-30.0/SHA256SUMS
 # After checking pgp signature from:
-# https://bitcoincore.org/bin/bitcoin-core-28.0/SHA256SUMS.asc
-sha256  700ae2d1e204602eb07f2779a6e6669893bc96c0dca290593f80ff8e102ff37f  bitcoin-28.0.tar.gz
+# https://bitcoincore.org/bin/bitcoin-core-30.0/SHA256SUMS.asc
+sha256  9b472a4d51dfed9aa9d0ded2cb8c7bcb9267f8439a23a98f36eb509c1a5e6974  bitcoin-30.0.tar.gz
 
 # Hash for license file
-sha256  779d9beab4eef2340bb1e86e91f8f55dea9b0985a2d03fbcbb52bd713e091e1b  COPYING
+sha256  7c4a87f43afaf667b4c2187af92ebdd27310a24cec113f973e058e3300a76002  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index 9a5f4d6494..e23ef45050 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -4,48 +4,35 @@
 #
 ################################################################################
 
-BITCOIN_VERSION = 28.0
+BITCOIN_VERSION = 30.0
 BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
-BITCOIN_AUTORECONF = YES
 BITCOIN_LICENSE = MIT
 BITCOIN_LICENSE_FILES = COPYING
 BITCOIN_CPE_ID_VENDOR = bitcoin
 BITCOIN_CPE_ID_PRODUCT = bitcoin_core
 BITCOIN_DEPENDENCIES = host-pkgconf boost libevent
+BITCOIN_SUPPORTS_IN_SOURCE_BUILD = NO
 BITCOIN_MAKE_ENV = BITCOIN_GENBUILD_NO_GIT=1
-# Berkeley Database (bdb) support is always disabled. It is only
-# needed for legacy wallet format. New wallets are using SQLite.
 BITCOIN_CONF_OPTS = \
-	--disable-bench \
-	--disable-tests \
-	--with-boost-libdir=$(STAGING_DIR)/usr/lib/ \
-	--disable-hardening \
-	--without-bdb \
-	--without-gui
+	-DBUILD_BENCH=OFF \
+	-DBUILD_TESTS=OFF \
+	-DBUILD_GUI=OFF \
+	-DENABLE_IPC=OFF
 
 ifeq ($(BR2_PACKAGE_BITCOIN_WALLET),y)
 BITCOIN_DEPENDENCIES += sqlite
 BITCOIN_CONF_OPTS += \
-	--enable-wallet \
-	--with-sqlite
+	-DENABLE_WALLET=ON
 else
 BITCOIN_CONF_OPTS += \
-	--disable-wallet \
-	--without-sqlite
-endif
-
-ifeq ($(BR2_PACKAGE_LIBMINIUPNPC),y)
-BITCOIN_DEPENDENCIES += libminiupnpc
-BITCOIN_CONF_OPTS += --with-miniupnpc
-else
-BITCOIN_CONF_OPTS += --without-miniupnpc
+	-DENABLE_WALLET=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_ZEROMQ),y)
 BITCOIN_DEPENDENCIES += zeromq
-BITCOIN_CONF_OPTS += --with-zmq
+BITCOIN_CONF_OPTS += -DWITH_ZMQ=ON
 else
-BITCOIN_CONF_OPTS += --without-zmq
+BITCOIN_CONF_OPTS += -DWITH_ZMQ=OFF
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
