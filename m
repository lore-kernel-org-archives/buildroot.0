From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 19 Jan 2014 22:04:03 +0100
Subject: [Buildroot] [PATCH v3 07/12] tinyxml: new package
In-Reply-To: <1390165448-9130-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1390165448-9130-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1390165448-9130-8-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tiny XML Parser.
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: gimli <ebsi4711@gmail.com>
---
Changes v2 -> v3:
  - Fix indent (Yann E. Morin)
Changes v1 -> v2:
  - Fix header (Yann E. Morin)
  - Fix comment on toolchain option (Peter Korsgaard)
---
 package/Config.in          |  1 +
 package/tinyxml/Config.in  | 11 +++++++++++
 package/tinyxml/tinyxml.mk | 15 +++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/tinyxml/Config.in
 create mode 100644 package/tinyxml/tinyxml.mk

diff --git a/package/Config.in b/package/Config.in
index d400ea2..80fe1ba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -624,6 +624,7 @@ source "package/libxslt/Config.in"
 source "package/libyaml/Config.in"
 source "package/mxml/Config.in"
 source "package/rapidjson/Config.in"
+source "package/tinyxml/Config.in"
 source "package/xerces/Config.in"
 source "package/yajl/Config.in"
 endmenu
diff --git a/package/tinyxml/Config.in b/package/tinyxml/Config.in
new file mode 100644
index 0000000..061ff67
--- /dev/null
+++ b/package/tinyxml/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_TINYXML
+	bool "tinyxml"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  TinyXML is a simple, small, C++ XML parser that can be
+	  easily integrating into other programs.
+
+	  https://github.com/leethomason/tinyxml2
+
+comment "tinyxml needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/tinyxml/tinyxml.mk b/package/tinyxml/tinyxml.mk
new file mode 100644
index 0000000..9622d36
--- /dev/null
+++ b/package/tinyxml/tinyxml.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# tinyxml
+#
+################################################################################
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
