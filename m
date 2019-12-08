From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 22:49:18 +0100
Subject: [Buildroot] [git commit] package/bitcoin: add optional zeromq
 dependency
Message-ID: <20191208214104.D73E8814AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea199fb5e8e687a6ef035269a7b6191bb05759b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
