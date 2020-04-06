From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 22:35:41 +0200
Subject: [Buildroot] [git commit] package/libmediaart: enable
 gobject-introspection support
Message-ID: <20200406202227.8C18583B8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10d807181a52066e71fb4944c26817549e34b616
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If gobject-introspection is selected, add the gobject-introspection package to
the dependency list and set the conf opt --enable-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libmediaart/libmediaart.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index 4933b74c19..0d110a43e5 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -33,4 +33,11 @@ LIBMEDIAART_CONF_OPTS += \
 	--disable-qt
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBMEDIAART_CONF_OPTS += --enable-introspection
+LIBMEDIAART_DEPENDENCIES += gobject-introspection
+else
+LIBMEDIAART_CONF_OPTS += --disable-introspection
+endif
+
 $(eval $(autotools-package))
