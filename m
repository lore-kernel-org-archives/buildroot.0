From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 00:42:03 +0100
Subject: [Buildroot] [git commit master 1/1] gdk-pixbuf: ensure startup
	script is well installed
Message-ID: <20101212234311.02DBD8E0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=857cd0d0c642bc27ee45d701b208830e914e7dbf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In case /etc/init.d does not exist.

[Peter: use install -D]
Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gdk-pixbuf/gdk-pixbuf.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index f129e46..cf915bb 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -44,7 +44,8 @@ GDK_PIXBUF_DEPENDENCIES += \
 	host-pkg-config libglib2
 
 define GDK_PIXBUF_POST_INSTALL_TWEAKS
-	$(INSTALL) -m 755 package/gdk-pixbuf/S26gdk-pixbuf $(TARGET_DIR)/etc/init.d/
+	$(INSTALL) -m 755 -D package/gdk-pixbuf/S26gdk-pixbuf \
+		$(TARGET_DIR)/etc/init.d/S26gdk-pixbuf
 endef
 
 GDK_PIXBUF_POST_INSTALL_TARGET_HOOKS += GDK_PIXBUF_POST_INSTALL_TWEAKS
-- 
1.7.2.2
