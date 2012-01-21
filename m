From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Jan 2012 22:53:52 +0100
Subject: [Buildroot] [PATCH] tcl: add host version
Message-ID: <1327182832-9615-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Also formatting cleanup.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tcl/tcl.mk |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index cf9a409..7bde8c7 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -3,15 +3,20 @@
 # TCL8.4
 #
 #############################################################
-TCL_VERSION:=8.4.19
-TCL_SOURCE:=tcl$(TCL_VERSION)-src.tar.gz
-TCL_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tcl
+TCL_VERSION = 8.4.19
+TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
+TCL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tcl
 TCL_SUBDIR = unix
 TCL_CONF_OPT = \
 		--disable-symbols \
 		--disable-langinfo \
 		--disable-framework
 
+HOST_TCL_CONF_OPT = \
+		--disable-symbols \
+		--disable-langinfo \
+		--disable-framework
+
 define TCL_POST_INSTALL_CLEANUP
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libtcl8.4.so
 	-if [ "$(BR2_PACKAGE_TCL_DEL_ENCODINGS)" = "y" ]; then \
@@ -25,3 +30,4 @@ endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_POST_INSTALL_CLEANUP
 
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
-- 
1.7.8.3
