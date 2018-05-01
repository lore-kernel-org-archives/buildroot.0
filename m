From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 May 2018 22:40:35 +0200
Subject: [Buildroot] [PATCH 4/7] gnutls: add optional libidn2 support
In-Reply-To: <20180501204038.20000-1-fontaine.fabrice@gmail.com>
References: <20180501204038.20000-1-fontaine.fabrice@gmail.com>
Message-ID: <20180501204038.20000-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.14.1
