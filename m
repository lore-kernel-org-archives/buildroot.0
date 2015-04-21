From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Apr 2015 23:37:04 +0200
Subject: [Buildroot] [git commit] package/tinyxml2: new package
Message-ID: <20150421214751.9BF9081D5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e5a97eb965d922675b264acd1cc480ca70a79b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Required for upcoming kodi-pvr-dvblink package:
https://github.com/kodi-pvr/pvr.dvblink/blob/master/CMakeLists.txt#L11

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/tinyxml2/Config.in   |   11 +++++++++++
 package/tinyxml2/tinyxml2.mk |   13 +++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index cee013e..afa145e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -878,6 +878,7 @@ menu "JSON/XML"
 	source "package/mxml/Config.in"
 	source "package/rapidjson/Config.in"
 	source "package/tinyxml/Config.in"
+	source "package/tinyxml2/Config.in"
 	source "package/xerces/Config.in"
 	source "package/yajl/Config.in"
 	source "package/yaml-cpp/Config.in"
diff --git a/package/tinyxml2/Config.in b/package/tinyxml2/Config.in
new file mode 100644
index 0000000..25bc594
--- /dev/null
+++ b/package/tinyxml2/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_TINYXML2
+	bool "tinyxml2"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  TinyXML-2 is a simple, small, efficient, C++ XML parser that can be
+	  easily integrating into other programs.
+
+	  http://www.grinninglizard.com/tinyxml2/index.html
+
+comment "tinyxml2 needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/tinyxml2/tinyxml2.mk b/package/tinyxml2/tinyxml2.mk
new file mode 100644
index 0000000..370049b
--- /dev/null
+++ b/package/tinyxml2/tinyxml2.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# tinyxml2
+#
+################################################################################
+
+TINYXML2_VERSION = 2.2.0
+TINYXML2_SITE = $(call github,leethomason,tinyxml2,$(TINYXML2_VERSION))
+TINYXML2_LICENSE = zlib
+TINYXML2_LICENSE_FILES = readme.md
+TINYXML2_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
