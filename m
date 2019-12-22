From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:22:16 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/bitcoin: disable
 gui
Message-ID: <20191222204327.ED0298D6D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adf62ea44987abf25d288206ff45c9ac4482a8d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Currently gui is autodetected so disable it for now

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0215c1d40f3ec5a2dc7f31dd4f77a02ca1224c8d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
