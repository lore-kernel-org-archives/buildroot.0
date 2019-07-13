From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 13 Jul 2019 10:32:56 +0200
Subject: [Buildroot] [PATCH 2/2] package/vte: add gnutls optional dependency
In-Reply-To: <20190713083256.28511-1-fontaine.fabrice@gmail.com>
References: <20190713083256.28511-1-fontaine.fabrice@gmail.com>
Message-ID: <20190713083256.28511-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vte/vte.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/vte/vte.mk b/package/vte/vte.mk
index 7332a1ae04..0d5db34b62 100644
--- a/package/vte/vte.mk
+++ b/package/vte/vte.mk
@@ -10,6 +10,13 @@ VTE_SITE = http://ftp.gnome.org/pub/gnome/sources/vte/0.48
 VTE_DEPENDENCIES = host-intltool host-pkgconf libgtk3 libxml2 pcre2
 VTE_LICENSE = LGPL-2.1+
 VTE_LICENSE_FILES = COPYING
-VTE_CONF_OPTS += --disable-introspection --without-gnutls --disable-vala
+VTE_CONF_OPTS += --disable-introspection --disable-vala
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+VTE_CONF_OPTS += --with-gnutls
+VTE_DEPENDENCIES += gnutls
+else
+VTE_CONF_OPTS += --without-gnutls
+endif
 
 $(eval $(autotools-package))
-- 
2.20.1
