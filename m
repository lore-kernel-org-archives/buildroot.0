From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed,  8 Dec 2010 10:54:05 +0100
Subject: [Buildroot] [PATCH 13/17] gdk-pixbuf: ensure startup script is well
	installed
In-Reply-To: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
References: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1291802049-18764-14-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

In case /etc/init.d does not exist.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index f129e46..beba138 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -44,6 +44,7 @@ GDK_PIXBUF_DEPENDENCIES += \
 	host-pkg-config libglib2
 
 define GDK_PIXBUF_POST_INSTALL_TWEAKS
+	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/init.d
 	$(INSTALL) -m 755 package/gdk-pixbuf/S26gdk-pixbuf $(TARGET_DIR)/etc/init.d/
 endef
 
-- 
1.7.2.3
