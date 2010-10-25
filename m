From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 25 Oct 2010 22:08:34 +0300
Subject: [Buildroot] [PATCH] Fix libgtk2 post install hook regression
Message-ID: <20101025190834.3163.39351.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 package/libgtk2/libgtk2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index d669622..835ca04 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -124,7 +124,7 @@ define LIBGTK2_POST_INSTALL_TWEAKS
 	rm -rf $(TARGET_DIR)/usr/share/gtk-2.0/demo $(TARGET_DIR)/usr/bin/gtk-demo
 endef
 
-LIBGTK2_POST_INSTALL_TARGET_HOOKS += LIBGTK_POST_INSTALL_TWEAKS
+LIBGTK2_POST_INSTALL_TARGET_HOOKS += LIBGTK2_POST_INSTALL_TWEAKS
 
 # We do not build a full version of libgtk2 for the host, because that
 # requires compiling Cairo, Pango, ATK and X.org for the
