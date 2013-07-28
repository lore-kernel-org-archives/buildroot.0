From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 16:20:08 +0200
Subject: [Buildroot] [git commit] tcl: add a tclsh symlink
Message-ID: <20130728142001.2D3B89AB40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d0413fd370f47014287976f195dc745b95e49d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tclsh is installed with its version number (tclshx.y) but scripts (like
usb_modeswitch_dispatcher) are calling tclsh, not tclshx.y.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tcl/tcl.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index cc0565c..c145f57 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -35,6 +35,11 @@ define TCL_REMOVE_TCLSH
 	rm -f $(TARGET_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)
 endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_TCLSH
+else
+define TCL_SYMLINK_TCLSH
+	ln -s tclsh$(TCL_VERSION_MAJOR) $(TARGET_DIR)/usr/bin/tclsh
+endef
+TCL_POST_INSTALL_TARGET_HOOKS += TCL_SYMLINK_TCLSH
 endif
 
 $(eval $(autotools-package))
