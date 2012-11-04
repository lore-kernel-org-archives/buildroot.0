From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  4 Nov 2012 20:25:22 +0100
Subject: [Buildroot] [PATCH 1/2] Add missing dependency to netatalk
Message-ID: <1352057123-7137-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Netatalk need pkg-config, otherwise the configure script is complaining.
---
 package/netatalk/netatalk.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index c01e360..4aa179e 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -7,7 +7,7 @@ NETATALK_VERSION = 3.0
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2

-NETATALK_DEPENDENCIES = openssl berkeleydb libgcrypt libgpg-error
+NETATALK_DEPENDENCIES = host-pkg-config openssl berkeleydb libgcrypt libgpg-error
 NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99"
 NETATALK_CONF_OPT += --with-cnid-cdb-backend \
 	--with-bdb=$(STAGING_DIR)/usr \
--
1.7.10.4
