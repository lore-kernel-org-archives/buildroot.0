From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Sep 2011 23:34:34 +0200
Subject: [Buildroot] [git commit] package: add fftw library
Message-ID: <20110928213517.8F80C8D9CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d6aaaa6ffa519ab601896063b66d7dd6760db25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fftw is a library for fast fourier transforms.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/fftw/Config.in |   11 +++++++++++
 package/fftw/fftw.mk   |   11 +++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a849266..8b9c816 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -338,6 +338,7 @@ source "package/libupnp/Config.in"
 endmenu
 
 menu "Other"
+source "package/fftw/Config.in"
 source "package/libargtable2/Config.in"
 source "package/argp-standalone/Config.in"
 source "package/libatomic_ops/Config.in"
diff --git a/package/fftw/Config.in b/package/fftw/Config.in
new file mode 100644
index 0000000..36f849f
--- /dev/null
+++ b/package/fftw/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_FFTW
+	bool "fftw"
+	help
+	  Library for computing Fast Fourier Transforms.
+
+	  This library computes Fast Fourier Transforms (FFT) in one
+	  or more dimensions.  It is extremely fast. This package
+	  contains the shared library version of the fftw libraries in
+	  double precision.
+
+	  http://www.fftw.org
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
new file mode 100644
index 0000000..a5b3588
--- /dev/null
+++ b/package/fftw/fftw.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# fftw
+#
+################################################################################
+
+FFTW_VERSION = 3.3
+FFTW_SITE = http://www.fftw.org
+FFTW_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package,fftw))
