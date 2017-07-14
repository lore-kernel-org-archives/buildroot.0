From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 14 Jul 2017 14:15:32 -0400
Subject: [Buildroot] [PATCH 10/15] netsnmp: support libressl
In-Reply-To: <20170714181537.17479-1-aduskett@gmail.com>
References: <20170714181537.17479-1-aduskett@gmail.com>
Message-ID: <20170714181537.17479-10-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/netsnmp/netsnmp.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index abcf63d56..405c28781 100644
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
2.13.0
