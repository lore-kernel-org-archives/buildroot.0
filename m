From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 14:06:43 +0100
Subject: [Buildroot] [git commit] package/strongswan: Install libraries to
 /usr/lib
Message-ID: <20171213131337.310E482B97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=738435ad76f6cb4a21841d52612908feb4501b2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install strongswan ipsec libraries into /usr/lib instead of
/usr/lib/ipsec to place them in preferred library common location.

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/strongswan/strongswan.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 30bbc6c..65618af 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -37,7 +37,10 @@ STRONGSWAN_CONF_OPTS += \
 	--enable-scepclient=$(if $(BR2_PACKAGE_STRONGSWAN_SCEP),yes,no) \
 	--enable-scripts=$(if $(BR2_PACKAGE_STRONGSWAN_SCRIPTS),yes,no) \
 	--enable-vici=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
-	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no)
+	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
+	--with-ipseclibdir=/usr/lib \
+	--with-plugindir=/usr/lib/ipsec/plugins \
+	--with-imcvdir=/usr/lib/ipsec/imcvs
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 STRONGSWAN_CONF_ENV += LIBS='-latomic'
