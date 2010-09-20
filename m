From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 20 Sep 2010 23:26:09 +0200
Subject: [Buildroot] [PATCH 4/4] package/tcl: fix for POSIX compliance
In-Reply-To: <1285017969-32280-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1285017969-32280-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1285017969-32280-5-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using two '=' for string comparison is a bashism.
Revert to using one, as stated in POSIX 1003.1-2008.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/tcl/tcl.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index edcc441..cf46811 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -15,10 +15,10 @@ TCL_CONF_OPT = \
 
 define TCL_POST_INSTALL_CLEANUP
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libtcl8.4.so
-	-if [ "$(BR2_PACKAGE_TCL_DEL_ENCODINGS)" == "y" ]; then \
+	-if [ "$(BR2_PACKAGE_TCL_DEL_ENCODINGS)" = "y" ]; then \
 	rm -Rf $(TARGET_DIR)/usr/lib/tcl8.4/encoding/*; \
 	fi
-	-if [ "$(BR2_PACKAGE_TCL_SHLIB_ONLY)" == "y" ]; then \
+	-if [ "$(BR2_PACKAGE_TCL_SHLIB_ONLY)" = "y" ]; then \
 	rm -f $(TARGET_DIR)/usr/bin/tclsh8.4; \
 	fi
 endef
-- 
1.7.1
