From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Jan 2014 00:48:47 +0100
Subject: [Buildroot] [git commit] tinyxml: new package
Message-ID: <20140122235353.552CB9C5D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7677a7542e37b8cc497038dd00046e29b75980fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tiny XML Parser.
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

[Peter: add _LICENSE_FILES]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: gimli <ebsi4711@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in          |    1 +
 package/tinyxml/Config.in  |   11 +++++++++++
 package/tinyxml/tinyxml.mk |   16 ++++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3bf3434..397cc11 100644
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
index 0000000..df7b29f
--- /dev/null
+++ b/package/tinyxml/tinyxml.mk
@@ -0,0 +1,16 @@
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
+TINYXML_LICENSE_FILES = README
+
+$(eval $(autotools-package))
