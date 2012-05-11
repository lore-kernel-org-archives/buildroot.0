From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 May 2012 10:33:57 -0300
Subject: [Buildroot] [PATCH 3/5] rrdtool: fix breakage with newer autotools
In-Reply-To: <1336743239-6368-1-git-send-email-gustavo@zacarias.com.ar>
References: <1336743239-6368-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1336743239-6368-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rrdtool/rrdtool-automake-compat.patch      |   18 ++++++++++++++++++
 ...ool-configure-dont-hardcode-include-dirs.patch} |    0
 2 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 package/rrdtool/rrdtool-automake-compat.patch
 rename package/rrdtool/{rrdtool-1.2.30-configure-dont-hardcode-include-dirs.patch => rrdtool-configure-dont-hardcode-include-dirs.patch} (100%)

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
-- 
1.7.3.4
