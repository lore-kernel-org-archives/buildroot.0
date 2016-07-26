From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 17:59:11 +0200
Subject: [Buildroot] [git commit] package/pdbg: new package
Message-ID: <20160726192858.7EDE48211F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=100058c3cec208df6afecd440852e98b479c57dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PowerPC FSI Debugger, for low level debugging of a Power8 CPU over FSI.

Signed-off-by: Joel Stanley <joel@jms.id.au>
[Thomas:
 - add to package/Config.in
 - add hash file]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in      |  1 +
 package/pdbg/Config.in | 10 ++++++++++
 package/pdbg/pdbg.hash |  2 ++
 package/pdbg/pdbg.mk   | 13 +++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 8ceeb9e..ec45eaf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -426,6 +426,7 @@ endmenu
 	source "package/owl-linux/Config.in"
 	source "package/parted/Config.in"
 	source "package/pciutils/Config.in"
+	source "package/pdbg/Config.in"
 	source "package/picocom/Config.in"
 	source "package/pifmrds/Config.in"
 	source "package/powertop/Config.in"
diff --git a/package/pdbg/Config.in b/package/pdbg/Config.in
new file mode 100644
index 0000000..3e23c21
--- /dev/null
+++ b/package/pdbg/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PDBG
+	bool "pdbg"
+	help
+	  PowerPC FSI Debugger, for low level debugging of a IBM
+	  Power8 CPU over FSI.
+
+	  pdbg runs on a BMC, which is generally an ARM-powered system
+	  monitoring/controlling a host CPU.
+
+	  https://github.com/open-power/pdbg
diff --git a/package/pdbg/pdbg.hash b/package/pdbg/pdbg.hash
new file mode 100644
index 0000000..16bf580
--- /dev/null
+++ b/package/pdbg/pdbg.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 8edabb9ae98ce3b1892b768f2ee5e779a00476b63cdcc6f905e8464a0b7d96a3 pdbg-90a7370a11e727f1482dea6ff2bd6aec20c64805.tar.gz
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
new file mode 100644
index 0000000..9cc05cd
--- /dev/null
+++ b/package/pdbg/pdbg.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# pdbg
+#
+################################################################################
+
+PDBG_VERSION = 90a7370a11e727f1482dea6ff2bd6aec20c64805
+PDBG_SITE = $(call github,open-power,pdbg,$(PDBG_VERSION))
+PDBG_LICENSE = Apache 2.0
+PDBG_LICENSE_FILES = COPYING
+PDBG_AUTORECONF = YES
+
+$(eval $(autotools-package))
