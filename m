From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 10 Apr 2020 21:11:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/strongswan: annotate CVEs
Message-ID: <20200410191104.130653-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/strongswan/strongswan.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 021a59cecc..7f1752ce57 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -43,6 +43,11 @@ STRONGSWAN_CONF_OPTS += \
 	--with-imcvdir=/usr/lib/ipsec/imcvs \
 	--with-dev-headers=/usr/include
 
+# strongswan-5.6.1-5.6.3_gmp-pkcs1-verify.patch
+STRONGSWAN_IGNORE_CVES += CVE-2018-16151 CVE-2018-16152
+# strongswan-4.4.0-5.7.0_gmp-pkcs1-overflow.patch
+STRONGSWAN_IGNORE_CVES += CVE-2018-17540
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 STRONGSWAN_CONF_ENV += LIBS='-latomic'
 endif
-- 
2.25.1
