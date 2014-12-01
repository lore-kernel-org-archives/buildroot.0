From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 22:48:35 +0100
Subject: [Buildroot] [git commit] gdk-pixbuf: use <pkg>_INSTALL_INIT_SYSV
	mechanism
Message-ID: <20141201221140.8CBC58002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ebf0fccabe16afedc04af669ff0723e4b1b6541
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 61e7ae9..0977d92 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -45,13 +45,11 @@ GDK_PIXBUF_DEPENDENCIES += \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
 	host-pkgconf libglib2
 
-define GDK_PIXBUF_POST_INSTALL_TWEAKS
+define GDK_PIXBUF_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/gdk-pixbuf/S26gdk-pixbuf \
 		$(TARGET_DIR)/etc/init.d/S26gdk-pixbuf
 endef
 
-GDK_PIXBUF_POST_INSTALL_TARGET_HOOKS += GDK_PIXBUF_POST_INSTALL_TWEAKS
-
 $(eval $(autotools-package))
 
 HOST_GDK_PIXBUF_CONF_OPTS = \
