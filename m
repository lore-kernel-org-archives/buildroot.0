From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Aug 2012 19:37:43 +0200
Subject: [Buildroot] [git commit branch/next] new package: gsl the GNU
	Scientific Library.
Message-ID: <20120812173809.A5ECC97174@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d9f7feba4ffbfeb54479f1ad90d47acca1a6f0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[thomas.petazzoni at free-electrons.com:
 renamed package to 'gsl' to match upstream name.
 added license information.]

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in     |    1 +
 package/gsl/Config.in |   10 ++++++++++
 package/gsl/gsl.mk    |   13 +++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3f46d3a..d6a66fd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -457,6 +457,7 @@ source "package/libelf/Config.in"
 source "package/libevent/Config.in"
 source "package/libev/Config.in"
 source "package/libffi/Config.in"
+source "package/gsl/Config.in"
 source "package/libglib2/Config.in"
 source "package/libical/Config.in"
 source "package/libnspr/Config.in"
diff --git a/package/gsl/Config.in b/package/gsl/Config.in
new file mode 100644
index 0000000..92541da
--- /dev/null
+++ b/package/gsl/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GSL
+	bool "gsl"
+	help
+	  The GNU Scientific Library (GSL) is a numerical library for
+	  C and C++ programmers.  The library provides a wide range of
+	  mathematical routines such as random number generators,
+	  special functions and least-squares fitting. There are over
+	  1000 functions in total with an extensive test suite.
+
+ 	  http://www.gnu.org/software/gsl
diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
new file mode 100644
index 0000000..7196859
--- /dev/null
+++ b/package/gsl/gsl.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# gnu gsl
+#
+#############################################################
+GSL_VERSION = 1.15
+GSL_SOURCE = gsl-$(GSL_VERSION).tar.gz
+GSL_SITE = $(BR2_GNU_MIRROR)/gsl
+GSL_INSTALL_STAGING = YES
+GSL_LICENSE = GPLv3
+GSL_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
