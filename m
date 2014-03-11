From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Tue, 11 Mar 2014 12:57:10 -0500
Subject: [Buildroot] [PATCH v2 2/4] libee: new package
In-Reply-To: <1394560632-1923-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1394560632-1923-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1394560632-1923-2-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>

---
Changes v1 -> v2:
  - Added a select to the configure for libestr (Suggested by Baruch)
---
 package/Config.in       |    1 +
 package/libee/Config.in |   19 +++++++++++++++++++
 package/libee/libee.mk  |   16 ++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 package/libee/Config.in
 create mode 100644 package/libee/libee.mk

diff --git a/package/Config.in b/package/Config.in
index ab82483..42c21d8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -767,6 +767,7 @@ source "package/libcap-ng/Config.in"
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
index 0000000..f9894d9
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
+LIBEE_LICENSE_FILE = COPYING
+LIBEE_DEPENDENCIES = libestr
+LIBEE_INSTALL_STAGING = YES
+
+LIBEE_MAKE = $(MAKE1)
+
+$(eval $(autotools-package))
-- 
1.7.1
