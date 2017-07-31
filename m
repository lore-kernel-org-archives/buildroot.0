From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 31 Jul 2017 08:08:10 -0400
Subject: [Buildroot] [PATCH v2 10/14] netsnmp: support libressl
In-Reply-To: <20170731120815.5315-1-aduskett@gmail.com>
References: <20170731120815.5315-1-aduskett@gmail.com>
Message-ID: <20170731120815.5315-10-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - None.

 package/netsnmp/netsnmp.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index abcf63d56..2c94f6c24 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -60,6 +60,13 @@ NETSNMP_CONF_OPTS += \
 	--with-openssl=$(STAGING_DIR)/usr/include/openssl \
 	--with-security-modules="tsm,usm" \
 	--with-transports="DTLSUDP,TLSTCP"
+# LibreSSL
+else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+NETSNMP_DEPENDENCIES += libressl
+NETSNMP_CONF_OPTS += \
+	--with-openssl=$(STAGING_DIR)/usr/include/openssl \
+	--with-security-modules="tsm,usm" \
+	--with-transports="DTLSUDP,TLSTCP"
 ifeq ($(BR2_STATIC_LIBS),y)
 # openssl uses zlib, so we need to explicitly link with it when static
 NETSNMP_CONF_ENV += LIBS=-lz
-- 
2.13.3
