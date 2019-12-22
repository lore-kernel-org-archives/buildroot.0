From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:21:50 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/bitcoin: add
 host-pkgconf dependency
Message-ID: <20191222204327.CDE3D8D6D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76c5f19799e9e1a126d428d77fa3d87530c07afe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

pkg-config can used to retrieve openssl and libevent dependencies

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b8f91e6a989178ca3b9f458e0c80aa2330deb65d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
