From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 22:00:13 +0200
Subject: [Buildroot] [git commit] tcl: specify ln -sf to remove existing
	destination file
Message-ID: <20131014203036.A0EBD9A384@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6c0b3b42ab357925d64eb5aa7515f83a7d5ca02
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes below build error when executing
"make tcl-dirclean; make tcl-rebuild".

ln -s tclsh8.4 /opt/test/br-x86/buildroot/output/target/usr/bin/tclsh
ln: failed to create symbolic link '/opt/test/br-x86/buildroot/output/target/usr/bin/tclsh': File exists
make: *** [/opt/test/br-x86/buildroot/output/build/tcl-8.4.19/.stamp_target_installed] Error 1

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcl/tcl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 3291c1b..58f085a 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -37,7 +37,7 @@ endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_TCLSH
 else
 define TCL_SYMLINK_TCLSH
-	ln -s tclsh$(TCL_VERSION_MAJOR) $(TARGET_DIR)/usr/bin/tclsh
+	ln -sf tclsh$(TCL_VERSION_MAJOR) $(TARGET_DIR)/usr/bin/tclsh
 endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_SYMLINK_TCLSH
 endif
