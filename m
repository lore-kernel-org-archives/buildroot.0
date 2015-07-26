From: Nimai Mahajan <nimaim@gmail.com>
Date: Sun, 26 Jul 2015 00:59:32 -0400
Subject: [Buildroot] [PATCH v2] cmocka: new package
Message-ID: <1437886772-6787-1-git-send-email-nimaim@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nimai Mahajan <nimaim@gmail.com>

Signed-off-by: Nimai Mahajan <nimaim@gmail.com>
---
Changes v1->v2: Removed host-cmake dependency (Baruch)

 package/Config.in          |  1 +
 package/cmocka/Config.in   | 11 +++++++++++
 package/cmocka/cmocka.hash |  2 ++
 package/cmocka/cmocka.mk   | 17 +++++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/cmocka/Config.in
 create mode 100644 package/cmocka/cmocka.hash
 create mode 100644 package/cmocka/cmocka.mk

diff --git a/package/Config.in b/package/Config.in
index f029e1d..e0dd14e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1037,6 +1037,7 @@ menu "Other"
 	source "package/boost/Config.in"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
+	source "package/cmocka/Config.in"
 	source "package/cppcms/Config.in"
 	source "package/ding-libs/Config.in"
 	source "package/eigen/Config.in"
diff --git a/package/cmocka/Config.in b/package/cmocka/Config.in
new file mode 100644
index 0000000..37064bf
--- /dev/null
+++ b/package/cmocka/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_CMOCKA
+	bool "cmocka"
+	help
+	  cmocka is an elegant unit testing framework for C with support
+	  for mock objects. It only requires the standard C library,
+	  works on a range of computing platforms (including embedded)
+	  and with different compilers. It is a fork of Google's very
+	  popular cmockery unit testing framework to fix bugs and support 
+	  it in the future.
+
+	  https://cmocka.org/
diff --git a/package/cmocka/cmocka.hash b/package/cmocka/cmocka.hash
new file mode 100644
index 0000000..96b81cb
--- /dev/null
+++ b/package/cmocka/cmocka.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 b36050d7a1224296803d216cba1a9d4c58c31bf308b2d6d6649d61aa5a36753b cmocka-1.0.1.tar.xz
diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
new file mode 100644
index 0000000..812df76
--- /dev/null
+++ b/package/cmocka/cmocka.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# cmocka
+#
+################################################################################
+
+CMOCKA_VERSION = 1.0.1
+CMOCKA_SOURCE = cmocka-$(CMOCKA_VERSION).tar.xz
+CMOCKA_SITE = https://cmocka.org/files/1.0/
+CMOCKA_LICENSE = Apache-2.0
+CMOCKA_LICENSE_FILES = COPYING
+CMOCKA_INSTALL_STAGING = YES
+
+# cmocka only supports out of source builds
+CMOCKA_SUPPORTS_IN_SOURCE_BUILD = NO
+
+$(eval $(cmake-package))
-- 
1.9.1
