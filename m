From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Jan 2014 18:53:25 +0100
Subject: [Buildroot] [PATCH 11/14] tinyxml: new package
In-Reply-To: <1389549208-19078-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1389549208-19078-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1389549208-19078-12-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tiny XML Parser.
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in          |  1 +
 package/tinyxml/Config.in  | 11 +++++++++++
 package/tinyxml/tinyxml.mk | 15 +++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/tinyxml/Config.in
 create mode 100644 package/tinyxml/tinyxml.mk

diff --git a/package/Config.in b/package/Config.in
index 944ecda..3e888b2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -619,6 +619,7 @@ source "package/libxslt/Config.in"
 source "package/libyaml/Config.in"
 source "package/mxml/Config.in"
 source "package/rapidjson/Config.in"
+source "package/tinyxml/Config.in"
 source "package/xerces/Config.in"
 source "package/yajl/Config.in"
 endmenu
diff --git a/package/tinyxml/Config.in b/package/tinyxml/Config.in
new file mode 100644
index 0000000..05b5475
--- /dev/null
+++ b/package/tinyxml/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_TINYXML
+	bool "tinyxml"
+	  depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  TinyXML is a simple, small, C++ XML parser that can be
+	  easily integrating into other programs.
+
+	  https://github.com/leethomason/tinyxml2
+
+comment "tinyxml requires C++ support in toolchain"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/tinyxml/tinyxml.mk b/package/tinyxml/tinyxml.mk
new file mode 100644
index 0000000..be13ea3
--- /dev/null
+++ b/package/tinyxml/tinyxml.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# tinyxml
+#
+#############################################################
+
+TINYXML_VERSION = 2.6.2_2
+TINYXML_SITE = http://mirrors.xbmc.org/build-deps/sources
+# AUTORECONF is needed because the XBMC's version of TinyXML contains a
+# configure.ac which is not present in mainline.
+TINYXML_AUTORECONF = YES
+TINYXML_INSTALL_STAGING = YES
+TINYXML_LICENSE = zlib
+
+$(eval $(autotools-package))
-- 
1.8.5.2
