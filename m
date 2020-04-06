From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 22:35:48 +0200
Subject: [Buildroot] [git commit] package/vte: enable gobject-introspection
 support
Message-ID: <20200406202227.A3C1F83B8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0025b895406117b941fccc8557ee1f3b080bcd9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If gobject-introspection is selected, add the gobject-introspection package to
the dependency list and set the conf opt --enable-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
