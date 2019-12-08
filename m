From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 22:48:54 +0100
Subject: [Buildroot] [git commit] package/bitcoin: disable benchmarks
Message-ID: <20191208214104.B748288D1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff7dd7062caa4ba84e169a9defe3feb86e80b7aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
