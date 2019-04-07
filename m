From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Apr 2019 21:58:31 +0200
Subject: [Buildroot] [PATCH 4/6] package/lldpd: add optional libxml2
 dependency
In-Reply-To: <20190407195833.9275-1-fontaine.fabrice@gmail.com>
References: <20190407195833.9275-1-fontaine.fabrice@gmail.com>
Message-ID: <20190407195833.9275-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lldpd/lldpd.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 4e62f56c5d..050f45491e 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -29,7 +29,6 @@ LLDPD_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
 
 LLDPD_CONF_OPTS = \
 	--without-embedded-libevent \
-	--without-xml \
 	--without-seccomp \
 	--without-libbsd \
 	--disable-hardening \
@@ -43,6 +42,13 @@ LLDPD_CONF_OPTS = \
 	$(if $(BR2_PACKAGE_LLDPD_DOT3),--enable-dot3,--disable-dot3) \
 	$(if $(BR2_PACKAGE_LLDPD_CUSTOM_TLV),--enable-custom,--disable-custom)
 
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+LLDPD_CONF_OPTS += --with-xml
+LLDPD_DEPENDENCIES += libxml2
+else
+LLDPD_CONF_OPTS += --without-xml
+endif
+
 ifeq ($(BR2_PACKAGE_NETSNMP),y)
 LLDPD_CONF_OPTS += --with-snmp
 LLDPD_DEPENDENCIES += netsnmp
-- 
2.20.1
