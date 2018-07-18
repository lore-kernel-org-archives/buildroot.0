From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 18 Jul 2018 21:53:04 +0300
Subject: [Buildroot] [PATCH 2/2] bind: fix build with zlib
In-Reply-To: <f6a81f45eeaea33eaa9015355bd7c63779f7b881.1531939984.git.baruch@tkos.co.il>
References: <f6a81f45eeaea33eaa9015355bd7c63779f7b881.1531939984.git.baruch@tkos.co.il>
Message-ID: <86b9b3c29162e451879854fe975eb7c4ba96945b.1531939984.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The bind configure.in now checks for "${with_zlib}/include/zlib.h".
Remove the redundant "include/".

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/bind/bind.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index e71eddcd7f00..d478a7f6e12c 100644
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
-- 
2.18.0
