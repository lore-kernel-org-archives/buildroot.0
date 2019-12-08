From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  8 Dec 2019 17:27:24 +0100
Subject: [Buildroot] [PATCH 7/8] package/bitcoin: disable gui
In-Reply-To: <20191208162725.2561301-1-fontaine.fabrice@gmail.com>
References: <20191208162725.2561301-1-fontaine.fabrice@gmail.com>
Message-ID: <20191208162725.2561301-7-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently gui is autodetected so disable it for now

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bitcoin/bitcoin.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index c01cacb0df..db9e9ab90c 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -15,7 +15,8 @@ BITCOIN_CONF_OPTS = \
 	--disable-wallet \
 	--disable-tests \
 	--with-boost-libdir=$(STAGING_DIR)/usr/lib/ \
-	--disable-hardening
+	--disable-hardening \
+	--without-gui
 
 ifeq ($(BR2_PACKAGE_LIBMINIUPNPC),y)
 BITCOIN_DEPENDENCIES += libminiupnpc
-- 
2.24.0
