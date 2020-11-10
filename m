From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 10 Nov 2020 21:17:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/bitcoin: set BITCOIN_GENBUILD_NO_GIT
Message-ID: <20201110201707.517081-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set BITCOIN_GENBUILD_NO_GIT which is available since version 0.15.0 and
https://github.com/bitcoin/bitcoin/commit/e98e3dde6a976a2c8f266ee963d6931fd4b37262

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bitcoin/bitcoin.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index d5e3973d9c..9d2094c02c 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -10,6 +10,7 @@ BITCOIN_AUTORECONF = YES
 BITCOIN_LICENSE = MIT
 BITCOIN_LICENSE_FILES = COPYING
 BITCOIN_DEPENDENCIES = host-pkgconf boost libevent
+BITCOIN_MAKE_ENV = BITCOIN_GENBUILD_NO_GIT=1
 BITCOIN_CONF_OPTS = \
 	--disable-bench \
 	--disable-wallet \
-- 
2.28.0
