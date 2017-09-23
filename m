From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Sep 2017 11:19:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/libshout: enable optional
	dependency for libressl
Message-ID: <20170923091949.2269-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libshout uses pkgconfig currently only to check for openssl paths, to
fix the build error we pass our STAGING_DIR as parameter to
--with-openssl

Fixes
http://autobuild.buildroot.net/results/72a/72aa07d48d6b1d7dea046b88ee4aa943534ffad4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libshout/libshout.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
index 8fd850fb13..4f209081a4 100644
--- a/package/libshout/libshout.mk
+++ b/package/libshout/libshout.mk
@@ -31,6 +31,9 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBSHOUT_CONF_OPTS += --with-openssl
 LIBSHOUT_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+LIBSHOUT_CONF_OPTS += --with-openssl=$(STAGING_DIR)/lib
+LIBSHOUT_DEPENDENCIES += libressl
 else
 LIBSHOUT_CONF_OPTS += --without-openssl
 endif
-- 
2.11.0
