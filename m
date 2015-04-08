From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 21:13:10 +0200
Subject: [Buildroot] [git commit] strongswan: kill unnecessary whitespace
Message-ID: <20150408191441.2487B818C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50f30864f59d9b63bde0dff0497606653f3d6599
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/strongswan/strongswan.mk |   92 +++++++++++++++++++-------------------
 1 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 2d23383..059955d 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -10,63 +10,63 @@ STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPLv2+
 STRONGSWAN_LICENSE_FILES = COPYING LICENSE
 STRONGSWAN_DEPENDENCIES = host-pkgconf
-STRONGSWAN_CONF_OPTS +=                                                              \
-	--without-lib-prefix                                                         \
-	--enable-pkcs11=yes                                                          \
-	--enable-kernel-netlink=$(if $(BR2_INET_IPV6),yes,no)                        \
-	--enable-socket-default=$(if $(BR2_INET_IPV6),yes,no)                        \
-	--enable-openssl=$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),yes,no)              \
-	--enable-gcrypt=$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),yes,no)                \
-	--enable-gmp=$(if $(BR2_PACKAGE_STRONGSWAN_GMP),yes,no)                      \
-	--enable-af-alg=$(if $(BR2_PACKAGE_STRONGSWAN_AF_ALG),yes,no)                \
-	--enable-curl=$(if $(BR2_PACKAGE_STRONGSWAN_CURL),yes,no)                    \
-	--enable-charon=$(if $(BR2_PACKAGE_STRONGSWAN_CHARON),yes,no)                \
-	--enable-tnccs-11=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),yes,no)            \
-	--enable-tnccs-20=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_20),yes,no)            \
-	--enable-tnccs-dynamic=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC),yes,no)  \
-	--enable-eap-sim-pcsc=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),yes,no)    \
-	--enable-unity=$(if $(BR2_PACKAGE_STRONGSWAN_UNITY),yes,no)                  \
-	--enable-stroke=$(if $(BR2_PACKAGE_STRONGSWAN_STROKE),yes,no)                \
-	--enable-sql=$(if $(BR2_PACKAGE_STRONGSWAN_SQL),yes,no)                      \
-	--enable-pki=$(if $(BR2_PACKAGE_STRONGSWAN_PKI),yes,no)                      \
-	--enable-scepclient=$(if $(BR2_PACKAGE_STRONGSWAN_SCEP),yes,no)              \
-	--enable-scripts=$(if $(BR2_PACKAGE_STRONGSWAN_SCRIPTS),yes,no)              \
-	--enable-vici=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no)                    \
+STRONGSWAN_CONF_OPTS += \
+	--without-lib-prefix \
+	--enable-pkcs11=yes \
+	--enable-kernel-netlink=$(if $(BR2_INET_IPV6),yes,no) \
+	--enable-socket-default=$(if $(BR2_INET_IPV6),yes,no) \
+	--enable-openssl=$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),yes,no) \
+	--enable-gcrypt=$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),yes,no) \
+	--enable-gmp=$(if $(BR2_PACKAGE_STRONGSWAN_GMP),yes,no) \
+	--enable-af-alg=$(if $(BR2_PACKAGE_STRONGSWAN_AF_ALG),yes,no) \
+	--enable-curl=$(if $(BR2_PACKAGE_STRONGSWAN_CURL),yes,no) \
+	--enable-charon=$(if $(BR2_PACKAGE_STRONGSWAN_CHARON),yes,no) \
+	--enable-tnccs-11=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),yes,no) \
+	--enable-tnccs-20=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_20),yes,no) \
+	--enable-tnccs-dynamic=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC),yes,no) \
+	--enable-eap-sim-pcsc=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),yes,no) \
+	--enable-unity=$(if $(BR2_PACKAGE_STRONGSWAN_UNITY),yes,no) \
+	--enable-stroke=$(if $(BR2_PACKAGE_STRONGSWAN_STROKE),yes,no) \
+	--enable-sql=$(if $(BR2_PACKAGE_STRONGSWAN_SQL),yes,no) \
+	--enable-pki=$(if $(BR2_PACKAGE_STRONGSWAN_PKI),yes,no) \
+	--enable-scepclient=$(if $(BR2_PACKAGE_STRONGSWAN_SCEP),yes,no) \
+	--enable-scripts=$(if $(BR2_PACKAGE_STRONGSWAN_SCRIPTS),yes,no) \
+	--enable-vici=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
 	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no)
 
 ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP),y)
-STRONGSWAN_CONF_OPTS +=               \
-	--enable-eap-sim              \
-	--enable-eap-sim-file         \
-	--enable-eap-aka              \
-	--enable-eap-aka-3gpp2        \
-	--enable-eap-simaka-sql       \
+STRONGSWAN_CONF_OPTS += \
+	--enable-eap-sim \
+	--enable-eap-sim-file \
+	--enable-eap-aka \
+	--enable-eap-aka-3gpp2 \
+	--enable-eap-simaka-sql \
 	--enable-eap-simaka-pseudonym \
-	--enable-eap-simaka-reauth    \
-	--enable-eap-identity         \
-	--enable-eap-md5              \
-	--enable-eap-gtc              \
-	--enable-eap-mschapv2         \
-	--enable-eap-tls              \
-	--enable-eap-ttls             \
-	--enable-eap-peap             \
-	--enable-eap-tnc              \
-	--enable-eap-dynamic          \
+	--enable-eap-simaka-reauth \
+	--enable-eap-identity \
+	--enable-eap-md5 \
+	--enable-eap-gtc \
+	--enable-eap-mschapv2 \
+	--enable-eap-tls \
+	--enable-eap-ttls \
+	--enable-eap-peap \
+	--enable-eap-tnc \
+	--enable-eap-dynamic \
 	--enable-eap-radius
 STRONGSWAN_DEPENDENCIES += gmp
 endif
 
-STRONGSWAN_DEPENDENCIES +=                                 \
-	$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),openssl)    \
-	$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),libgcrypt)   \
-	$(if $(BR2_PACKAGE_STRONGSWAN_GMP),gmp)            \
-	$(if $(BR2_PACKAGE_STRONGSWAN_CURL),libcurl)       \
-	$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),libxml2)   \
+STRONGSWAN_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),openssl) \
+	$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),libgcrypt) \
+	$(if $(BR2_PACKAGE_STRONGSWAN_GMP),gmp) \
+	$(if $(BR2_PACKAGE_STRONGSWAN_CURL),libcurl) \
+	$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),libxml2) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),pcsc-lite)
 
 ifeq ($(BR2_PACKAGE_STRONGSWAN_SQL),y)
-STRONGSWAN_DEPENDENCIES +=                                 \
-	$(if $(BR2_PACKAGE_SQLITE),sqlite)                 \
+STRONGSWAN_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_SQLITE),sqlite) \
 	$(if $(BR2_PACKAGE_MYSQL),mysql)
 endif
 
