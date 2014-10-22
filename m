From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 23:03:53 +0200
Subject: [Buildroot] [git commit] yaml-cpp: new package
Message-ID: <20141022210933.DA7E2B06A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a2d5f929730037fa1267fc7a78f16294d4f6795
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

yaml-cpp is a YAML parser and emitter in C++ matching
the YAML 1.2 spec.

https://code.google.com/p/yaml-cpp/

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 +
 package/yaml-cpp/Config.in     |   14 ++++++++++++++
 package/yaml-cpp/yaml-cpp.hash |    5 +++++
 package/yaml-cpp/yaml-cpp.mk   |   13 +++++++++++++
 4 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4626f00..d6cd876 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -737,6 +737,7 @@ menu "JSON/XML"
 	source "package/tinyxml/Config.in"
 	source "package/xerces/Config.in"
 	source "package/yajl/Config.in"
+	source "package/yaml-cpp/Config.in"
 endmenu
 
 menu "Logging"
diff --git a/package/yaml-cpp/Config.in b/package/yaml-cpp/Config.in
new file mode 100644
index 0000000..d6afdac
--- /dev/null
+++ b/package/yaml-cpp/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_YAML_CPP
+	bool "yaml-cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE # boost
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
+	select BR2_PACKAGE_BOOST
+	help
+	  yaml-cpp is a YAML parser and emitter in C++ matching
+	  the YAML 1.2 spec.
+
+	  https://code.google.com/p/yaml-cpp/
+
+comment "yaml-cpp needs a toolchain w/ C++, largefile, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/yaml-cpp/yaml-cpp.hash b/package/yaml-cpp/yaml-cpp.hash
new file mode 100644
index 0000000..391e317
--- /dev/null
+++ b/package/yaml-cpp/yaml-cpp.hash
@@ -0,0 +1,5 @@
+# hash from: https://yaml-cpp.googlecode.com/files/yaml-cpp-0.5.1.tar.gz:
+sha1 9c5414b4090491e96d1b808fe8628b31e625fdaa  yaml-cpp-0.5.1.tar.gz
+
+# Locally calculated:
+sha256 3e7c9052b43d987d41819a203d97fc45de4eed3ec67e0fdb14265c3d11046f06  yaml-cpp-0.5.1.tar.gz
diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
new file mode 100644
index 0000000..5ebdb23
--- /dev/null
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# yaml-cpp
+#
+################################################################################
+
+YAML_CPP_VERSION = 0.5.1
+YAML_CPP_SITE = https://yaml-cpp.googlecode.com/files
+YAML_CPP_INSTALL_STAGING = YES
+YAML_CPP_LICENSE = MIT
+YAML_CPP_LICENSE_FILES = license.txt
+
+$(eval $(cmake-package))
