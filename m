From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 16:11:00 +0200
Subject: [Buildroot] [git commit branch/next] gnutls: add optional libidn2
 support
Message-ID: <20180520141552.808CF81239@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f48d3ff58b0584b6e64fdc3ea453e088af40dfba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnutls/gnutls.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 6be7c6e27e..3d1a627781 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -68,6 +68,13 @@ else
 GNUTLS_CONF_OPTS += --without-idn
 endif
 
+ifeq ($(BR2_PACKAGE_LIBIDN2),y)
+GNUTLS_CONF_OPTS += --with-libidn2
+GNUTLS_DEPENDENCIES += libidn2
+else
+GNUTLS_CONF_OPTS += --without-libidn2
+endif
+
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
 GNUTLS_CONF_OPTS += --with-p11-kit
 GNUTLS_DEPENDENCIES += p11-kit
