From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:22:00 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/bitcoin: disable
 benchmarks
Message-ID: <20191222204327.D79288D6D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=274c47ed76d842791dc78b07c582425539d15c45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ff7dd7062caa4ba84e169a9defe3feb86e80b7aa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
