From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu,  1 Nov 2018 13:58:15 -0500
Subject: [Buildroot] [PATCH 1/2] package/cunit: new package
Message-ID: <1541098696-25824-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/cunit/Config.in  |  6 ++++++
 package/cunit/cunit.hash |  3 +++
 package/cunit/cunit.mk   | 17 +++++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/cunit/Config.in
 create mode 100644 package/cunit/cunit.hash
 create mode 100644 package/cunit/cunit.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a3d97eb..d91a093 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1348,6 +1348,7 @@ F:	package/checkpolicy/
 F:	package/checksec/
 F:	package/cgroupfs-mount/
 F:	package/crda/
+F:	package/cunit/
 F:	package/devmem2/
 F:	package/dnsmasq/
 F:	package/dosfstools/
diff --git a/package/Config.in b/package/Config.in
index 7e8224c..c27253c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -141,6 +141,7 @@ menu "Development tools"
 	source "package/check/Config.in"
 	source "package/cmake/Config.in"
 	source "package/cppunit/Config.in"
+	source "package/cunit/Config.in"
 	source "package/cvs/Config.in"
 	source "package/cxxtest/Config.in"
 	source "package/diffutils/Config.in"
diff --git a/package/cunit/Config.in b/package/cunit/Config.in
new file mode 100644
index 0000000..8bcfa2a
--- /dev/null
+++ b/package/cunit/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_CUNIT
+	bool "cunit"
+	help
+	  An automated testing framework in 'C'.
+
+	  http://cunit.sourceforge.net/
diff --git a/package/cunit/cunit.hash b/package/cunit/cunit.hash
new file mode 100644
index 0000000..bbd43a7
--- /dev/null
+++ b/package/cunit/cunit.hash
@@ -0,0 +1,3 @@
+# Locally calculated:
+sha256 f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249a464efa49a40f214  CUnit-2.1-3.tar.bz2
+sha256 5d9d73d41a57dd2f34487ef3978a2c13cdb97294baeeb81fcd274796399eb15f  COPYING
diff --git a/package/cunit/cunit.mk b/package/cunit/cunit.mk
new file mode 100644
index 0000000..df300fd
--- /dev/null
+++ b/package/cunit/cunit.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# cunit
+#
+################################################################################
+
+CUNIT_VERSION = 2.1-3
+CUNIT_SITE = http://downloads.sourceforge.net/project/cunit/CUnit/$(CUNIT_VERSION)
+CUNIT_SOURCE = CUnit-$(CUNIT_VERSION).tar.bz2
+CUNIT_INSTALL_STAGING = YES
+CUNIT_LICENSE = LGPL-2.0
+CUNIT_LICENSE_FILES = COPYING
+
+# The source archive does not have the autoconf/automake material generated.
+CUNIT_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
1.9.1
