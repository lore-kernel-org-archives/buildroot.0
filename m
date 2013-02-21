From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 21 Feb 2013 15:58:42 +0100
Subject: [Buildroot] [PATCH 12/13] tinyxml: new package
In-Reply-To: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <ad24f17c066c0f28873e76aaf0f69b08ca205e36.1361458625.git.maxime.hadjinlian@gmail.com>
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
 package/Config.in          |    1 +
 package/tinyxml/Config.in  |   12 ++++++++++++
 package/tinyxml/tinyxml.mk |   12 ++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/tinyxml/Config.in
 create mode 100644 package/tinyxml/tinyxml.mk

diff --git a/package/Config.in b/package/Config.in
index d798137..7db8ba9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -604,6 +604,7 @@ source "package/libxml2/Config.in"
 source "package/libxslt/Config.in"
 source "package/libyaml/Config.in"
 source "package/mxml/Config.in"
+source "package/tinyxml/Config.in"
 source "package/xerces/Config.in"
 source "package/yajl/Config.in"
 endmenu
diff --git a/package/tinyxml/Config.in b/package/tinyxml/Config.in
new file mode 100644
index 0000000..b549d00
--- /dev/null
+++ b/package/tinyxml/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_TINYXML
+	bool "tinyxml"
+        depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  TinyXML is a simple, small, C++ XML parser that can be
+	  easily integrating into other programs.
+
+	  https://github.com/leethomason/tinyxml2
+
+comment "tinyxml requires C++ support in toolchain"
+        depends on !BR2_INSTALL_LIBSTDCPP
+	
diff --git a/package/tinyxml/tinyxml.mk b/package/tinyxml/tinyxml.mk
new file mode 100644
index 0000000..f4f042b
--- /dev/null
+++ b/package/tinyxml/tinyxml.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# tinyxml
+#
+#############################################################
+
+TINYXML_VERSION = 2.6.2_2
+TINYXML_SITE = http://mirrors.xbmc.org/build-deps/sources
+TINYXML_AUTORECONF = YES
+TINYXML_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.7.10.4
