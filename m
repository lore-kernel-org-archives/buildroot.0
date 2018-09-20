From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 21:08:47 +0200
Subject: [Buildroot] [git commit] package/strongswan: install dev headers
Message-ID: <20180920190837.644508865B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=084d53d6e9b9307e9ed4c4518731ba5f928043a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds '--with-dev-headers' configure option to install
development headers into staging.  The package provides
these headers to enable linking against pluggins.

Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/strongswan/strongswan.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 5c597d572a..632a742e9c 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -10,6 +10,7 @@ STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
 STRONGSWAN_LICENSE_FILES = COPYING LICENSE
 STRONGSWAN_DEPENDENCIES = host-pkgconf
+STRONGSWAN_INSTALL_STAGING = YES
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
