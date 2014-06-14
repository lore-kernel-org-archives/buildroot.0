From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 18:56:40 +0200
Subject: [Buildroot] [git commit] tclap: new package
Message-ID: <20140614170014.897A299EC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9da3b5d5f9f0fe3fede81178f0bfb3e8ec3f9cef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in       |    1 +
 package/tclap/Config.in |   17 +++++++++++++++++
 package/tclap/tclap.mk  |   16 ++++++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b29763c..33f3c73 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -859,6 +859,7 @@ menu "Text and terminal handling"
 	source "package/popt/Config.in"
 	source "package/readline/Config.in"
 	source "package/slang/Config.in"
+	source "package/tclap/Config.in"
 endmenu
 
 endmenu
diff --git a/package/tclap/Config.in b/package/tclap/Config.in
new file mode 100644
index 0000000..8c6296f
--- /dev/null
+++ b/package/tclap/Config.in
@@ -0,0 +1,17 @@
+comment "tclap needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_TCLAP
+	bool "tclap"
+	depends BR2_INSTALL_LIBSTDCPP
+	help
+	  This is a small, flexible library that provides a simple interface
+	  for defining and accessing command line arguments. It was initially
+	  inspired by the user friendly CLAP libary. The difference is that
+	  this library is templatized, so the argument class is type
+	  independent. Type independence avoids identical-except-for-type
+	  objects, such as IntArg, FloatArg, and StringArg. While the library
+	  is not strictly compliant with the GNU or POSIX standards, it is
+	  close.
+
+	  http://tclap.sourceforge.net/
diff --git a/package/tclap/tclap.mk b/package/tclap/tclap.mk
new file mode 100644
index 0000000..807f247
--- /dev/null
+++ b/package/tclap/tclap.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# tclap
+#
+################################################################################
+
+TCLAP_VERSION = 1.2.1
+TCLAP_SITE = http://downloads.sourceforge.net/project/tclap
+TCLAP_LICENSE = MIT
+TCLAP_LICENSE_FILES = COPYING
+TCLAP_INSTALL_STAGING = YES
+
+# This package is a pure C++ template library, only made of headers.
+TCLAP_INSTALL_TARGET = NO
+
+$(eval $(autotools-package))
