From: richard.genoud at gmail.com <richard.genoud@gmail.com>
Date: Fri, 21 Jun 2013 13:56:59 +0200
Subject: [Buildroot] [PATCH 3/6] tcl: remove strip command
In-Reply-To: <1371815822-29453-1-git-send-email-y>
References: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
 <1371815822-29453-1-git-send-email-y>
Message-ID: <51c43fa0.ebbbb40a.0abf.ffffba11@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Richard Genoud <richard.genoud@gmail.com>

Stripping is done at the end of the buildroot process, for all files at
once.
There's no need to do it here.
(Suggested by Thomas Petazzoni)

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/tcl/tcl.mk |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 2526ca1..a927a02 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -22,11 +22,6 @@ HOST_TCL_CONF_OPT = \
 		--disable-langinfo \
 		--disable-framework
 
-define TCL_POST_INSTALL_CLEANUP
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libtcl8.4.so
-endef
-TCL_POST_INSTALL_TARGET_HOOKS += TCL_POST_INSTALL_CLEANUP
-
 ifeq ($(BR2_PACKAGE_TCL_DEL_ENCODINGS),y)
 define TCL_REMOVE_ENCODINGS
 	rm -rf $(TARGET_DIR)/usr/lib/tcl$(TCL_VERSION_MAJOR)/encoding/*
-- 
1.7.10.4
