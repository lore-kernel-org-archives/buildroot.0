From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:45 -0000
Subject: [Buildroot] [git commit branch/next] rrdtool: fix breakage with
	newer autotools
Message-ID: <20120802195244.A65EC96EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18771deb3d21d44a766347d1485244dbeb8c7f22
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rrdtool/rrdtool-automake-compat.patch      |   18 ++++++++++++++++++
 ...ool-configure-dont-hardcode-include-dirs.patch} |    0
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/rrdtool/rrdtool-automake-compat.patch b/package/rrdtool/rrdtool-automake-compat.patch
new file mode 100644
index 0000000..92b753d
--- /dev/null
+++ b/package/rrdtool/rrdtool-automake-compat.patch
@@ -0,0 +1,18 @@
+Make it compatible with newer autoconf/automake.
+Patch from OpenWRT.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- a/bindings/tcl/Makefile.am
++++ b/bindings/tcl/Makefile.am
+@@ -26,8 +26,8 @@ tclpkgdir = @TCL_PACKAGE_DIR@
+ tclpkg_DATA = pkgIndex.tcl
+ tclpkg_SCRIPTS = ifOctets.tcl
+ else
+-pkglib_DATA = pkgIndex.tcl
+-pkglib_SCRIPTS = ifOctets.tcl
++pkgdata_DATA = pkgIndex.tcl
++pkgdata_SCRIPTS = ifOctets.tcl
+ endif
+ 
+ # Automake doen't like `tclrrd$(VERSION)$(TCL_SHLIB_SUFFIX)' as
diff --git a/package/rrdtool/rrdtool-1.2.30-configure-dont-hardcode-include-dirs.patch b/package/rrdtool/rrdtool-configure-dont-hardcode-include-dirs.patch
similarity index 100%
rename from package/rrdtool/rrdtool-1.2.30-configure-dont-hardcode-include-dirs.patch
rename to package/rrdtool/rrdtool-configure-dont-hardcode-include-dirs.patch
