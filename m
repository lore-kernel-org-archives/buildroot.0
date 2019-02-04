From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 10:27:38 +0100
Subject: [Buildroot] [git commit] package/intel-gmmlib: new package
Message-ID: <20190204093100.B064D837A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93e4ee81a2e3e163bf74c24b6ec68f9446f96ae4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
[Thomas: updated DEVELOPERS file, bump to 18.4.1.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  3 +++
 package/Config.in                      |  1 +
 package/intel-gmmlib/Config.in         | 10 ++++++++++
 package/intel-gmmlib/intel-gmmlib.hash |  2 ++
 package/intel-gmmlib/intel-gmmlib.mk   | 17 +++++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c1950bb0f4..3703b3fae7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1262,6 +1262,9 @@ F:	package/ti-sgx-demos/
 F:	package/ti-sgx-km/
 F:	package/ti-sgx-um/
 
+N:	Louis-Paul Cordier <lpdev@cordier.org>
+F:	package/intel-gmmlib/
+
 N:	Luca Ceresoli <luca@lucaceresoli.net>
 F:	board/olimex/a20_olinuxino/
 F:	board/zynq/
diff --git a/package/Config.in b/package/Config.in
index 5036421a73..9082ed9956 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1265,6 +1265,7 @@ menu "Graphics"
 	source "package/harfbuzz/Config.in"
 	source "package/ijs/Config.in"
 	source "package/imlib2/Config.in"
+	source "package/intel-gmmlib/Config.in"
 	source "package/irrlicht/Config.in"
 	source "package/jasper/Config.in"
 	source "package/jpeg/Config.in"
diff --git a/package/intel-gmmlib/Config.in b/package/intel-gmmlib/Config.in
new file mode 100644
index 0000000000..ef92a91128
--- /dev/null
+++ b/package/intel-gmmlib/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_INTEL_GMMLIB
+	bool "intel-gmmlib"
+	depends on BR2_x86_64
+	help
+	  The Intel(R) Graphics Memory Management Library provides
+	  device specific and buffer management for the Intel(R)
+	  Graphics Compute Runtime for OpenCL(TM) and the Intel(R)
+	  Media Driver for VAAPI.
+
+	  https://github.com/intel/gmmlib
diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
new file mode 100644
index 0000000000..3c234ea307
--- /dev/null
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 7970a8ae4e16efb98f38fbbc0346eea03227fc4462a9bd8e8077277cc3430a84  intel-gmmlib-18.4.1.tar.gz
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
new file mode 100644
index 0000000000..6af3152937
--- /dev/null
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# intel-gmmlib
+#
+################################################################################
+
+INTEL_GMMLIB_VERSION = 18.4.1
+INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
+INTEL_GMMLIB_LICENSE = MIT
+INTEL_GMMLIB_LICENSE_FILES = COPYING
+
+INTEL_GMMLIB_INSTALL_STAGING = YES
+INTEL_GMMLIB_SUPPORTS_IN_SOURCE_BUILD = NO
+
+INTEL_GMMLIB_CONF_OPTS = -DRUN_TEST_SUITE=OFF
+
+$(eval $(cmake-package))
