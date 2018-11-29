From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 22:39:00 +0100
Subject: [Buildroot] [git commit] package/cunit: new package
Message-ID: <20181202071601.29CEC815BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb04a819ae9188be482630ba707ad90cf7319ed1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[Thomas: fix license, it's LGPL-2.0+.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/cunit/Config.in  |  6 ++++++
 package/cunit/cunit.hash |  3 +++
 package/cunit/cunit.mk   | 17 +++++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 455f2e2b9d..3f51e44421 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1372,6 +1372,7 @@ F:	package/checkpolicy/
 F:	package/checksec/
 F:	package/cgroupfs-mount/
 F:	package/crda/
+F:	package/cunit/
 F:	package/devmem2/
 F:	package/dnsmasq/
 F:	package/dosfstools/
diff --git a/package/Config.in b/package/Config.in
index 38c2654c69..2a1d025d58 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -142,6 +142,7 @@ menu "Development tools"
 	source "package/check/Config.in"
 	source "package/cmake/Config.in"
 	source "package/cppunit/Config.in"
+	source "package/cunit/Config.in"
 	source "package/cvs/Config.in"
 	source "package/cxxtest/Config.in"
 	source "package/diffutils/Config.in"
diff --git a/package/cunit/Config.in b/package/cunit/Config.in
new file mode 100644
index 0000000000..8bcfa2a4ec
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
index 0000000000..bbd43a78ca
--- /dev/null
+++ b/package/cunit/cunit.hash
@@ -0,0 +1,3 @@
+# Locally calculated:
+sha256 f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249a464efa49a40f214  CUnit-2.1-3.tar.bz2
+sha256 5d9d73d41a57dd2f34487ef3978a2c13cdb97294baeeb81fcd274796399eb15f  COPYING
diff --git a/package/cunit/cunit.mk b/package/cunit/cunit.mk
new file mode 100644
index 0000000000..9fc3b96141
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
+CUNIT_LICENSE = LGPL-2.0+
+CUNIT_LICENSE_FILES = COPYING
+
+# The source archive does not have the autoconf/automake material generated.
+CUNIT_AUTORECONF = YES
+
+$(eval $(autotools-package))
