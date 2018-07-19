From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 23:40:38 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] bind: fix build with zlib
Message-ID: <20180719214017.B0FC9890A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=edb8e9ff59774ca7f94a72ef58b38eb3f8b2aece
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

The bind configure.in now checks for "${with_zlib}/include/zlib.h".
Remove the redundant "include/".

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ba3c7e806d3ebeb1fa66fe7ba0ee9a70447b49b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index e71eddcd7f..d478a7f6e1 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -33,7 +33,7 @@ BIND_CONF_OPTS = \
 	--enable-filter-aaaa
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-BIND_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr/include
+BIND_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
 BIND_DEPENDENCIES += zlib
 else
 BIND_CONF_OPTS += --without-zlib
