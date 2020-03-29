From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 22:47:35 +0200
Subject: [Buildroot] [git commit] package/jbig2dec: new package.
Message-ID: <20200329204000.5E9D989144@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29d8b9e53b8c2008e070ea057e58612a82889077
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

jbig2dec is a decoder implementation of the JBIG2 image compression format.

Signed-off-by: Rapha??l M??lotte <raphael.melotte@essensium.com>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  3 +++
 package/Config.in              |  1 +
 package/jbig2dec/Config.in     |  7 +++++++
 package/jbig2dec/jbig2dec.hash |  7 +++++++
 package/jbig2dec/jbig2dec.mk   | 13 +++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 75aaf98c44..6d4718a1ef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2125,6 +2125,9 @@ N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/freescale-imx/
 F:	package/paho-mqtt-cpp/
 
+N:	Rapha??l M??lotte <raphael.melotte@essensium.com>
+F:	package/jbig2dec/
+
 N:	R??mi R??rolle <remi.rerolle@gmail.com>
 F:	package/libfreeimage/
 
diff --git a/package/Config.in b/package/Config.in
index a51125e17b..b81952b5e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1391,6 +1391,7 @@ menu "Graphics"
 	source "package/intel-mediasdk/Config.in"
 	source "package/irrlicht/Config.in"
 	source "package/jasper/Config.in"
+	source "package/jbig2dec/Config.in"
 	source "package/jpeg/Config.in"
 	source "package/kmsxx/Config.in"
 	source "package/lcms2/Config.in"
diff --git a/package/jbig2dec/Config.in b/package/jbig2dec/Config.in
new file mode 100644
index 0000000000..d1440dca3d
--- /dev/null
+++ b/package/jbig2dec/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_JBIG2DEC
+	bool "jbig2dec"
+	help
+	  jbig2dec is a decoder implementation of the JBIG2
+	  image compression format.
+
+	  https://jbig2dec.com/
diff --git a/package/jbig2dec/jbig2dec.hash b/package/jbig2dec/jbig2dec.hash
new file mode 100644
index 0000000000..eb2b674443
--- /dev/null
+++ b/package/jbig2dec/jbig2dec.hash
@@ -0,0 +1,7 @@
+# https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs927/MD5SUMS
+# and SHA512SUMS are missing the hashes for this file.
+# Locally computed:
+sha256 a4f6bf15d217e7816aa61b92971597c801e81f0a63f9fe1daee60fb88e0f0602  jbig2dec-0.16.tar.gz
+
+# Hash for license files:
+sha256 1bf5258afe453934484fd0cea97508b72301633a6a78b0ae8a9ee44ac78f26d9  LICENSE
diff --git a/package/jbig2dec/jbig2dec.mk b/package/jbig2dec/jbig2dec.mk
new file mode 100644
index 0000000000..5ac5b87a72
--- /dev/null
+++ b/package/jbig2dec/jbig2dec.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# jbig2dec
+#
+################################################################################
+
+JBIG2DEC_VERSION = 0.16
+JBIG2DEC_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs927
+JBIG2DEC_LICENSE = AGPL-3.0+
+JBIG2DEC_LICENSE_FILES = LICENSE
+JBIG2DEC_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
