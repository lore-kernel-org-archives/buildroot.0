From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 09:04:57 +0200
Subject: [Buildroot] [git commit] bind: fix build with zlib
Message-ID: <20180719070020.BFC1088DDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba3c7e806d3ebeb1fa66fe7ba0ee9a70447b49b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bind configure.in now checks for "${with_zlib}/include/zlib.h".
Remove the redundant "include/".

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
