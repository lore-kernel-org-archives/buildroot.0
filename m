From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Tue, 14 Oct 2014 16:09:02 -0400
Subject: [Buildroot] [PATCH v2] cppunit: Added package
Message-ID: <1413317342-4612-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CppUnit is the C++ port of the famous JUnit framework for unit testing.
Test output is in XML or text format for automatic testing and GUI
based for supervised tests.

http://www.freedesktop.org/wiki/Software/cppunit/
Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
---
Changes v1 -> v2:
 - used AUTORECONF option (suggested by romain.naour at openwide.fr)
 - removed useless CONFIGURE_CMDS (suggested by romain.naour at openwide.fr)
---
 package/Config.in          |  1 +
 package/cppunit/Config.in  | 12 ++++++++++++
 package/cppunit/cppunit.mk | 14 ++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/cppunit/Config.in
 create mode 100644 package/cppunit/cppunit.mk

diff --git a/package/Config.in b/package/Config.in
index 19bb9bf..407f24f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -838,6 +838,7 @@ menu "Other"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
 	source "package/cppcms/Config.in"
+	source "package/cppunit/Config.in"
 	source "package/eigen/Config.in"
 	source "package/elfutils/Config.in"
 	source "package/fftw/Config.in"
diff --git a/package/cppunit/Config.in b/package/cppunit/Config.in
new file mode 100644
index 0000000..91700b8
--- /dev/null
+++ b/package/cppunit/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_CPPUNIT
+	bool "cppunit"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  CppUnit is the C++ port of the famous JUnit framework for unit testing.
+	  Test output is in XML or text format for automatic testing and GUI
+	  based for supervised tests.
+
+	  http://www.freedesktop.org/wiki/Software/cppunit/
+
+comment "cppunit needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/cppunit/cppunit.mk b/package/cppunit/cppunit.mk
new file mode 100644
index 0000000..4447537
--- /dev/null
+++ b/package/cppunit/cppunit.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# cppunit
+#
+################################################################################
+
+CPPUNIT_VERSION = cppunit-1.13.2
+CPPUNIT_SITE = git://anongit.freedesktop.org/git/libreoffice/cppunit/
+CPPUNIT_INSTALL_STAGING = YES
+CPPUNIT_LICENSE = GPLv2
+CPPUNIT_LICENSE_FILES = COPYING
+CPPUNIT_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
1.8.3.4
