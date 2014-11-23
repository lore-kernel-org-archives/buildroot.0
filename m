From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:38:43 +0100
Subject: [Buildroot] [PATCH 11/51] gdk-pixbuf: use <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-12-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

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
-- 
2.1.0
