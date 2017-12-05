From: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>
Date: Tue,  5 Dec 2017 11:44:55 +0000
Subject: [Buildroot] [PATCH 1/1] glorytun: new package
Message-ID: <20171205114455.21602-1-adrien@gallouet.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
---
 package/Config.in              | 1 +
 package/glorytun/Config.in     | 6 ++++++
 package/glorytun/glorytun.hash | 1 +
 package/glorytun/glorytun.mk   | 7 +++++++
 4 files changed, 15 insertions(+)
 create mode 100644 package/glorytun/Config.in
 create mode 100644 package/glorytun/glorytun.hash
 create mode 100644 package/glorytun/glorytun.mk

diff --git a/package/Config.in b/package/Config.in
index 433224c3a4..b3c1471dc5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1655,6 +1655,7 @@ menu "Networking applications"
 	source "package/gesftpserver/Config.in"
 	source "package/gupnp-tools/Config.in"
 	source "package/gutenprint/Config.in"
+	source "package/glorytun/Config.in"
 	source "package/hans/Config.in"
 	source "package/hiawatha/Config.in"
 	source "package/hostapd/Config.in"
diff --git a/package/glorytun/Config.in b/package/glorytun/Config.in
new file mode 100644
index 0000000000..93c1afd8cd
--- /dev/null
+++ b/package/glorytun/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_GLORYTUN
+	bool "glorytun"
+	select BR2_PACKAGE_LIBSODIUM
+	help
+	  A small, simple and secure VPN.
+	  https://github.com/angt/glorytun
diff --git a/package/glorytun/glorytun.hash b/package/glorytun/glorytun.hash
new file mode 100644
index 0000000000..099dcef6d0
--- /dev/null
+++ b/package/glorytun/glorytun.hash
@@ -0,0 +1 @@
+sha256	76849b1568119cf0834749db56d4882966863d31351c21c1b22f373f0c97a498  glorytun-0.0.93-mud.tar.gz
diff --git a/package/glorytun/glorytun.mk b/package/glorytun/glorytun.mk
new file mode 100644
index 0000000000..eadeda9540
--- /dev/null
+++ b/package/glorytun/glorytun.mk
@@ -0,0 +1,7 @@
+GLORYTUN_VERSION = 0.0.93-mud
+GLORYTUN_SITE = https://github.com/angt/glorytun/releases/download/v$(GLORYTUN_VERSION)
+GLORYTUN_DEPENDENCIES = libsodium
+GLORYTUN_LICENSE = BSD-2-clause
+GLORYTUN_LICENSE_FILES = LICENSE
+
+$(eval $(autotools-package))
-- 
2.15.1
