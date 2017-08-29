From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Tue, 29 Aug 2017 16:30:20 -0500
Subject: [Buildroot] [PATCH 1/1] package/strongswan: Install libraries to
	/usr/lib
Message-ID: <1504042220-54681-1-git-send-email-sam.voss@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install strongswan ipsec libraries into /usr/lib instead of
/usr/lib/ipsec in an effort to not need a custom RPATH for this package.

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
---
 package/strongswan/strongswan.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 1070eea..febb33f 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -36,7 +36,8 @@ STRONGSWAN_CONF_OPTS += \
 	--enable-scepclient=$(if $(BR2_PACKAGE_STRONGSWAN_SCEP),yes,no) \
 	--enable-scripts=$(if $(BR2_PACKAGE_STRONGSWAN_SCRIPTS),yes,no) \
 	--enable-vici=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
-	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no)
+	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
+	--with-ipseclibdir=/usr/lib
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 STRONGSWAN_CONF_ENV += LIBS='-latomic'
-- 
1.9.1
