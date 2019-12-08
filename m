From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 22:48:46 +0100
Subject: [Buildroot] [git commit] package/bitcoin: add host-pkgconf
 dependency
Message-ID: <20191208214104.A77667F901@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8f91e6a989178ca3b9f458e0c80aa2330deb65d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pkg-config can used to retrieve openssl and libevent dependencies

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bitcoin/bitcoin.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index eefde1df96..7335c10187 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -9,7 +9,7 @@ BITCOIN_SITE = $(call github,bitcoin,bitcoin,v$(BITCOIN_VERSION))
 BITCOIN_AUTORECONF = YES
 BITCOIN_LICENSE = MIT
 BITCOIN_LICENSE_FILES = COPYING
-BITCOIN_DEPENDENCIES = boost openssl libevent
+BITCOIN_DEPENDENCIES = host-pkgconf boost openssl libevent
 BITCOIN_CONF_OPTS = \
 	--disable-wallet \
 	--disable-tests \
