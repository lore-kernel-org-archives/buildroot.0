From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:22:09 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/bitcoin: add
 optional libminiupnpc dependency
Message-ID: <20191222204327.E37878D6ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4338c5c5474c730330ca045ed0ecacaa1e46bcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e0c48090f47e7d9baa9f3649f5dd90a3cacb1609)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
