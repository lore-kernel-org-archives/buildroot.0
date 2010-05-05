From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Wed, 05 May 2010 13:09:36 +0300
Subject: [Buildroot] [PATCH] Remove gtk-doc documentations from target
Message-ID: <20100505100936.6123.58539.stgit@pauliusz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On my target rootfs it is installed documentation for:
atk, cairo, gdk, gdk-pixbuf, gio, glib, gobject, gtk, pango

It ocupies 34M of space. Configure option --disable-gtk-doc doesn't
prevent installation of it. So we should remove them manually if
documentation is disabled.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 607ec6d..5da21d8 100644
--- a/Makefile
+++ b/Makefile
@@ -410,6 +410,7 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/man
 	rm -rf $(TARGET_DIR)/usr/info $(TARGET_DIR)/usr/share/info
 	rm -rf $(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/doc
+	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 endif
 	find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
 	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
