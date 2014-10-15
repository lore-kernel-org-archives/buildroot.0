From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Wed, 15 Oct 2014 16:47:33 -0400
Subject: [Buildroot] [PATCH 1/1] yaml-cpp: Added package
Message-ID: <1413406053-22668-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

yaml-cpp is a YAML parser and emitter in C++ matching
the YAML 1.2 spec.

https://code.google.com/p/yaml-cpp/
Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
---
 package/Config.in              |  1 +
 package/yaml-cpp/Config.in     | 14 ++++++++++++++
 package/yaml-cpp/yaml-cpp.hash |  5 +++++
 package/yaml-cpp/yaml-cpp.mk   | 14 ++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/yaml-cpp/Config.in
 create mode 100644 package/yaml-cpp/yaml-cpp.hash
 create mode 100644 package/yaml-cpp/yaml-cpp.mk

diff --git a/package/Config.in b/package/Config.in
index 93e148d..40a1b1c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -898,6 +898,7 @@ menu "Other"
 	source "package/startup-notification/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
+	source "package/yaml-cpp/Config.in"
 endmenu
 
 menu "Security"
diff --git a/package/yaml-cpp/Config.in b/package/yaml-cpp/Config.in
new file mode 100644
index 0000000..fcfd60f
--- /dev/null
+++ b/package/yaml-cpp/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_YAML_CPP
+	bool "yaml-cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
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
index 0000000..324ea58
--- /dev/null
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# yaml-cpp
+#
+################################################################################
+
+YAML_CPP_VERSION = yaml-cpp-0.5.1
+YAML_CPP_SOURCE = $(YAML_CPP_VERSION).tar.gz
+YAML_CPP_SITE = https://yaml-cpp.googlecode.com/files
+YAML_CPP_INSTALL_STAGING = YES
+YAML_CPP_LICENSE = MIT
+YAML_CPP_LICENSE_FILES = license.txt
+
+$(eval $(cmake-package))
-- 
1.8.3.4
