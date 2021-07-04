From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Jul 2021 21:38:25 +0200
Subject: [Buildroot] [git commit] Revert "package/bitcoin: unset the NDEBUG
 flag"
Message-ID: <20210704190629.0765B8006A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1aa3cb1090676a8af91d664142c968f4b6a22a82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Setting NDEBUG is no longer done by the infra.

This reverts commit f098aff4792a0e792bda4d7d1ec22a5af1381d83.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bitcoin/bitcoin.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index f485e4ee5c..142521835c 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -13,12 +13,6 @@ BITCOIN_CPE_ID_VENDOR = bitcoin
 BITCOIN_CPE_ID_PRODUCT = bitcoin_core
 BITCOIN_DEPENDENCIES = host-pkgconf boost libevent
 BITCOIN_MAKE_ENV = BITCOIN_GENBUILD_NO_GIT=1
-# Bitcoin is using assert(...) extensively with the assumption of it
-# never being a noop at runtime. So we cannot build with NDEBUG.
-BITCOIN_CONF_ENV = \
-	CPPFLAGS="$(TARGET_CPPFLAGS) -UNDEBUG" \
-	CFLAGS="$(TARGET_CFLAGS) -UNDEBUG" \
-	CXXFLAGS="$(TARGET_CXXFLAGS) -UNDEBUG"
 BITCOIN_CONF_OPTS = \
 	--disable-bench \
 	--disable-wallet \
