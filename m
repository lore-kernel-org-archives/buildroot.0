From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 19:31:24 +0200
Subject: [Buildroot] [git commit] package/lldpd: add optional libxml2
 dependency
Message-ID: <20190410172749.813908E1D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a966255e44e484b5bc671d2397681731920db449
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
