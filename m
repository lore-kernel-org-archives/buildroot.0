From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 22:48:59 +0100
Subject: [Buildroot] [git commit] package/bitcoin: add optional libminiupnpc
 dependency
Message-ID: <20191208214104.C4AB4881CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0c48090f47e7d9baa9f3649f5dd90a3cacb1609
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
