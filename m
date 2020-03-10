From: Jianhui Zhao <zhaojh329@gmail.com>
Date: Tue, 10 Mar 2020 23:06:06 +0800
Subject: [Buildroot] [PATCH 1/1] package: add rtty
Message-ID: <20200310150606.28261-1-zhaojh329@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
---
 package/Config.in      |  1 +
 package/rtty/Config.in |  7 +++++++
 package/rtty/rtty.hash |  2 ++
 package/rtty/rtty.mk   | 15 +++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/rtty/Config.in
 create mode 100644 package/rtty/rtty.hash
 create mode 100644 package/rtty/rtty.mk

diff --git a/package/Config.in b/package/Config.in
index 146fc1bbc3..f5aab078e6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2267,6 +2267,7 @@ comment "Utilities"
 	source "package/pdmenu/Config.in"
 	source "package/pinentry/Config.in"
 	source "package/ranger/Config.in"
+	source "package/rtty/Config.in"
 	source "package/screen/Config.in"
 	source "package/sudo/Config.in"
 	source "package/terminology/Config.in"
diff --git a/package/rtty/Config.in b/package/rtty/Config.in
new file mode 100644
index 0000000000..badb329d3e
--- /dev/null
+++ b/package/rtty/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_RTTY
+	bool "rtty"
+	select BR2_PACKAGE_LIBEV
+	help
+	  Access your device's terminal from anywhere via the web.
+
+	  https://github.com/zhaojh329/rtty
diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
new file mode 100644
index 0000000000..239dc59f78
--- /dev/null
+++ b/package/rtty/rtty.hash
@@ -0,0 +1,2 @@
+sha256  6faafe75d82edbcfe154da5f1ffc0ddfd14dd88a2315f19aeed7f2631df96f41  rtty-7.1.2.tar.gz
+sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENCE
diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
new file mode 100644
index 0000000000..857dc35751
--- /dev/null
+++ b/package/rtty/rtty.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# rtty
+#
+################################################################################
+
+RTTY_VERSION = 7.1.2
+LIBCURL_SOURCE = rtty-$(RTTY_VERSION).tar.gz
+RTTY_SITE = https://github.com/zhaojh329/rtty/releases/download/v$(RTTY_VERSION)
+RTTY_LICENSE = MIT
+RTTY_LICENSE_FILES = LICENSE
+
+RTTY_DEPENDENCIES = libev
+
+$(eval $(cmake-package))
-- 
2.17.1
