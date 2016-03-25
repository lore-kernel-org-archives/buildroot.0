From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Mar 2016 21:00:45 +0100
Subject: [Buildroot] [git commit] gdk-pixbuf: readd libglib2 dependency
Message-ID: <20160325200622.0871A81D4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fac3cff82416cb59a03cc70f0c404ad41387c086
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It was accidentaly dropped in the loaders cache rework, shame on me.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
