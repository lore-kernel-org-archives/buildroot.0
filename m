From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  8 Dec 2019 17:27:23 +0100
Subject: [Buildroot] [PATCH 6/8] package/bitcoin: add optional libminiupnpc
 dependency
In-Reply-To: <20191208162725.2561301-1-fontaine.fabrice@gmail.com>
References: <20191208162725.2561301-1-fontaine.fabrice@gmail.com>
Message-ID: <20191208162725.2561301-6-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bitcoin/bitcoin.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index 7373bf4106..c01cacb0df 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -17,4 +17,11 @@ BITCOIN_CONF_OPTS = \
 	--with-boost-libdir=$(STAGING_DIR)/usr/lib/ \
 	--disable-hardening
 
+ifeq ($(BR2_PACKAGE_LIBMINIUPNPC),y)
+BITCOIN_DEPENDENCIES += libminiupnpc
+BITCOIN_CONF_OPTS += --with-miniupnpc
+else
+BITCOIN_CONF_OPTS += --without-miniupnpc
+endif
+
 $(eval $(autotools-package))
-- 
2.24.0
