From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:22:25 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/bitcoin: add
 optional zeromq dependency
Message-ID: <20191222204328.031038D6D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f94ecfae23df919da18f04a55bca52decba5230
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ea199fb5e8e687a6ef035269a7b6191bb05759b9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
