From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 10:16:27 -0500
Subject: [Buildroot] [PATCH 1/2] package/strongswan: install dev headers
Message-ID: <1537456588-17627-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds '--with-dev-headers' configure option to install
development headers into staging.  The package provides
these headers to enable linking against pluggins.

Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/strongswan/strongswan.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 5c597d5..f2e70a3 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -10,6 +10,7 @@ STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
 STRONGSWAN_LICENSE_FILES = COPYING LICENSE
 STRONGSWAN_DEPENDENCIES = host-pkgconf
+STRONGSWAN_INSTALL_STAGING=YES
 STRONGSWAN_CONF_OPTS += \
 	--without-lib-prefix \
 	--enable-led \
@@ -36,7 +37,8 @@ STRONGSWAN_CONF_OPTS += \
 	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
 	--with-ipseclibdir=/usr/lib \
 	--with-plugindir=/usr/lib/ipsec/plugins \
-	--with-imcvdir=/usr/lib/ipsec/imcvs
+	--with-imcvdir=/usr/lib/ipsec/imcvs \
+	--with-dev-headers=/usr/include
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 STRONGSWAN_CONF_ENV += LIBS='-latomic'
-- 
1.9.1
