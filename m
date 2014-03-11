From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Tue, 11 Mar 2014 12:57:09 -0500
Subject: [Buildroot] [PATCH v2 1/4] libestr: new package
Message-ID: <1394560632-1923-1-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>

---
Changes v1 -> v2:
  - No changes.
---
 package/Config.in          |    1 +
 package/libestr/Config.in  |    6 ++++++
 package/libestr/libestr.mk |   13 +++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/libestr/Config.in
 create mode 100644 package/libestr/libestr.mk

diff --git a/package/Config.in b/package/Config.in
index 2b76a8e..ab82483 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -817,6 +817,7 @@ source "package/enchant/Config.in"
 source "package/icu/Config.in"
 source "package/libedit/Config.in"
 source "package/libenca/Config.in"
+source "package/libestr/Config.in"
 source "package/libfribidi/Config.in"
 source "package/libiconv/Config.in"
 source "package/linenoise/Config.in"
diff --git a/package/libestr/Config.in b/package/libestr/Config.in
new file mode 100644
index 0000000..b1ca2a5
--- /dev/null
+++ b/package/libestr/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBESTR
+	bool "libestr"
+	help
+	  Some essentials for string handling (and a bit more)
+
+	  http://libestr.adiscon.com/
diff --git a/package/libestr/libestr.mk b/package/libestr/libestr.mk
new file mode 100644
index 0000000..9efe3b5
--- /dev/null
+++ b/package/libestr/libestr.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libestr
+#
+################################################################################
+
+LIBESTR_VERSION = 0.1.9
+LIBESTR_SITE = http://libestr.adiscon.com/files/download/
+LIBESTR_LICENSE = LGPLv2.1+
+LIBESTR_LICENSE_FILE = COPYING
+LIBESTR_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.7.1
