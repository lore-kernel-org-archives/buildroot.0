From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Dec 2012 00:50:21 -0800
Subject: [Buildroot] [git commit] netatalk: Add missing dependency to
	netatalk
Message-ID: <20121205091359.473658FDC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0507db22c46f4a19398e5476d62e4e242075250
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Netatalk need host-pkgconf, otherwise the configure script is complaining.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netatalk/netatalk.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index c01e360..4063b53 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -7,7 +7,7 @@ NETATALK_VERSION = 3.0
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
 
-NETATALK_DEPENDENCIES = openssl berkeleydb libgcrypt libgpg-error
+NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error
 NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99"
 NETATALK_CONF_OPT += --with-cnid-cdb-backend \
 	--with-bdb=$(STAGING_DIR)/usr \
