From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Mar 2016 14:35:33 -0300
Subject: [Buildroot] [PATCH 2/3] gdk-pixbuf: readd libglib2 dependency
In-Reply-To: <1458927334-3890-1-git-send-email-gustavo@zacarias.com.ar>
References: <1458927334-3890-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1458927334-3890-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It was accidentaly dropped in the loaders cache rework, shame on me.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index e77fd15..cedb9ce 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -13,7 +13,7 @@ GDK_PIXBUF_LICENSE_FILES = COPYING
 GDK_PIXBUF_INSTALL_STAGING = YES
 GDK_PIXBUF_DEPENDENCIES = \
 	host-gdk-pixbuf host-libglib2 host-pkgconf \
-	$(if $(BR2_ENABLE_LOCALE),,libiconv)
+	libglib2 $(if $(BR2_ENABLE_LOCALE),,libiconv)
 
 GDK_PIXBUF_CONF_ENV = \
 	ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY) \
-- 
2.7.3
