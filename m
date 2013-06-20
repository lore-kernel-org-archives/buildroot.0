From: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 20 Jun 2013 17:53:28 +0200
Subject: [Buildroot] [PATCH 2/4] tcl: add a tclsh symlink
In-Reply-To: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
References: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <1371743610-17810-3-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tclsh is installed with its version number (tclshx.y) but scripts (like
usb_modeswitch_dispatcher) are calling tclsh, not tclshx.y.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/tcl/tcl.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 1c23420..d81ad50 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -28,6 +28,8 @@ define TCL_POST_INSTALL_CLEANUP
 	fi
 	-if [ "$(BR2_PACKAGE_TCL_TCLSH)" != "y" ]; then \
 	rm -f $(TARGET_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR); \
+	else \
+	ln -s tclsh$(TCL_VERSION_MAJOR) $(TARGET_DIR)/usr/bin/tclsh ; \
 	fi
 endef
 
-- 
1.7.10.4
