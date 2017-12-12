From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Tue, 12 Dec 2017 16:19:38 -0600
Subject: [Buildroot] [PATCH v3] package/strongswan: Install libraries to
 /usr/lib
Message-ID: <1513117178-10061-1-git-send-email-sam.voss@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install strongswan ipsec libraries into /usr/lib instead of
/usr/lib/ipsec to place them in preferred library common location.

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>

--

v2->v3
 - Update description to not include RPATH issue as it could not be
    reproduced.
v1->v2
 - Specify plugindir and imcvdir to keep default values to avoid them
    moving when ipseclibdir changes.
---
 package/strongswan/strongswan.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 1070eea..9fccd99 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -36,7 +36,10 @@ STRONGSWAN_CONF_OPTS += \
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
-- 
1.9.1
