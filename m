From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Mar 2014 23:20:39 +0100
Subject: [Buildroot] [git commit] libee: new package
Message-ID: <20140315225330.B607B9BF9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf25237ff3569596a674d2bc3f6c6028fb978478
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: needs host-pkgconf to find libestr]
Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in       |    1 +
 package/libee/Config.in |   19 +++++++++++++++++++
 package/libee/libee.mk  |   16 ++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ad603e1..f73a558 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -764,6 +764,7 @@ source "package/libcap-ng/Config.in"
 source "package/libcgroup/Config.in"
 source "package/libcofi/Config.in"
 source "package/libdaemon/Config.in"
+source "package/libee/Config.in"
 source "package/libelf/Config.in"
 source "package/libev/Config.in"
 source "package/libevdev/Config.in"
diff --git a/package/libee/Config.in b/package/libee/Config.in
new file mode 100644
index 0000000..9a3411e
--- /dev/null
+++ b/package/libee/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LIBEE
+	bool "libee"
+	select BR2_PACKAGE_LIBESTR
+	help
+	  An Event Expression Library inspired by CEE.
+
+	  CEE is an upcoming standard used to describe network
+	  events in a number of normalized formats. It's goal is
+	  to unify they currently many different representations
+	  that exist in the industry.
+
+	  The core idea of libee is to provide a small but hopefully
+	  convenient API layer above the CEE standard. However, CEE
+	  is not finished. At the time of this writing, CEE is under
+	  heavy development and even some of its core data structures
+	  (like the data dictionary and taxonmy) have not been fully
+	  specified.
+
+	  http://www.libee.org
diff --git a/package/libee/libee.mk b/package/libee/libee.mk
new file mode 100644
index 0000000..f6d36b6
--- /dev/null
+++ b/package/libee/libee.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libee
+#
+################################################################################
+
+LIBEE_VERSION = 0.4.1
+LIBEE_SITE = http://www.libee.org/download/files/download/
+LIBEE_LICENSE = LGPLv2.1+
+LIBEE_LICENSE_FILES = COPYING
+LIBEE_DEPENDENCIES = libestr host-pkgconf
+LIBEE_INSTALL_STAGING = YES
+
+LIBEE_MAKE = $(MAKE1)
+
+$(eval $(autotools-package))
