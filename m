From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  8 Dec 2019 17:27:22 +0100
Subject: [Buildroot] [PATCH 5/8] package/bitcoin: disable benchmarks
In-Reply-To: <20191208162725.2561301-1-fontaine.fabrice@gmail.com>
References: <20191208162725.2561301-1-fontaine.fabrice@gmail.com>
Message-ID: <20191208162725.2561301-5-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bitcoin/bitcoin.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index 7335c10187..7373bf4106 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -11,6 +11,7 @@ BITCOIN_LICENSE = MIT
 BITCOIN_LICENSE_FILES = COPYING
 BITCOIN_DEPENDENCIES = host-pkgconf boost openssl libevent
 BITCOIN_CONF_OPTS = \
+	--disable-bench \
 	--disable-wallet \
 	--disable-tests \
 	--with-boost-libdir=$(STAGING_DIR)/usr/lib/ \
-- 
2.24.0
