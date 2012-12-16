From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 11:34:20 +0100
Subject: [Buildroot] [git commit] netatalk : Fix BerkeleyDB library path
Message-ID: <20121216105435.46CCD9A1E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43ef60dc6aea3bd716de2a8cd0b379f1d184721e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fix is needed for the 64bits build because Netatalk will assume the library
are stored in [..]/lib64/ instead of [..]/lib/

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netatalk/netatalk.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 4063b53..23c2a95 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -8,7 +8,7 @@ NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NET
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
 
 NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error
-NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99"
+NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99" BDB_LIB=$(STAGING_LIB)/usr/lib
 NETATALK_CONF_OPT += --with-cnid-cdb-backend \
 	--with-bdb=$(STAGING_DIR)/usr \
 	--disable-zeroconf \
