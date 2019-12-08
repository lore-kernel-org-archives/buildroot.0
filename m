From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 22:49:18 +0100
Subject: [Buildroot] [git commit] package/bitcoin: disable gui
Message-ID: <20191208214104.CED25881CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0215c1d40f3ec5a2dc7f31dd4f77a02ca1224c8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently gui is autodetected so disable it for now

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
