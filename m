From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  8 Dec 2019 17:27:25 +0100
Subject: [Buildroot] [PATCH 8/8] package/bitcoin: add optional zeromq
 dependency
In-Reply-To: <20191208162725.2561301-1-fontaine.fabrice@gmail.com>
References: <20191208162725.2561301-1-fontaine.fabrice@gmail.com>
Message-ID: <20191208162725.2561301-8-fontaine.fabrice@gmail.com>
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
index db9e9ab90c..a3ac45e104 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -25,4 +25,11 @@ else
 BITCOIN_CONF_OPTS += --without-miniupnpc
 endif
 
+ifeq ($(BR2_PACKAGE_ZEROMQ),y)
+BITCOIN_DEPENDENCIES += zeromq
+BITCOIN_CONF_OPTS += --with-zmq
+else
+BITCOIN_CONF_OPTS += --without-zmq
+endif
+
 $(eval $(autotools-package))
-- 
2.24.0
