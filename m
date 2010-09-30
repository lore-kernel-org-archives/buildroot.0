From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 30 Sep 2010 23:09:39 +0200
Subject: [Buildroot] [git commit master 1/1] package/tcl: fix for POSIX
	compliance
Message-ID: <20100930211204.5CE748B637@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=57bc22c6b7ebef4b8b203dce6af4966ed719acef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using two '=' for string comparison is a bashism.
Revert to using one, as stated in POSIX 1003.1-2008.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
