From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Apr 2020 09:00:37 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/strongswan:
 annotate CVEs
Message-ID: <20200425065640.0C8CC8FC47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e27ccc1915f99cdcf0314462a557a4cc9bac2c4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 758a23fd89410b1f1b9bd1df0bd27de19135818e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
