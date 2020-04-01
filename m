From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 31 Mar 2020 17:21:34 -0700
Subject: [Buildroot] [PATCH 12/12] package/vte: enable gobject-introspection
 support
In-Reply-To: <20200401002134.1779241-1-aduskett@gmail.com>
References: <20200401002134.1779241-1-aduskett@gmail.com>
Message-ID: <20200401002134.1779241-12-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If gobject-introspection is selected, add the gobject-introspection package to
the dependency list and set the conf opt --enable-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/vte/vte.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/vte/vte.mk b/package/vte/vte.mk
index 0d5db34b62..6c8d1433f5 100644
--- a/package/vte/vte.mk
+++ b/package/vte/vte.mk
@@ -10,7 +10,14 @@ VTE_SITE = http://ftp.gnome.org/pub/gnome/sources/vte/0.48
 VTE_DEPENDENCIES = host-intltool host-pkgconf libgtk3 libxml2 pcre2
 VTE_LICENSE = LGPL-2.1+
 VTE_LICENSE_FILES = COPYING
-VTE_CONF_OPTS += --disable-introspection --disable-vala
+VTE_CONF_OPTS += --disable-vala
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+VTE_CONF_OPTS += --enable-introspection
+VTE_DEPENDENCIES += gobject-introspection
+else
+VTE_CONF_OPTS += --disable-introspection
+endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 VTE_CONF_OPTS += --with-gnutls
-- 
2.25.1
