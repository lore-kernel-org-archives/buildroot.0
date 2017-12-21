From: heyleke at gmail.com <heyleke@gmail.com>
Date: Thu, 21 Dec 2017 10:41:49 +0100
Subject: [Buildroot] [PATCH] Opentracing: add opentracing-cpp v1.2.0 package
In-Reply-To: <1513849309-550-1-git-send-email-heyleke@gmail.com>
References: <1513849309-550-1-git-send-email-heyleke@gmail.com>
Message-ID: <1513849309-550-2-git-send-email-heyleke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Heylen <jan.heylen@nokia.com>

---
 package/Config.in                            |  1 +
 package/opentracing-cpp/Config.in            | 11 +++++++++++
 package/opentracing-cpp/opentracing-cpp.hash |  2 ++
 package/opentracing-cpp/opentracing-cpp.mk   | 15 +++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/opentracing-cpp/Config.in
 create mode 100644 package/opentracing-cpp/opentracing-cpp.hash
 create mode 100644 package/opentracing-cpp/opentracing-cpp.mk

diff --git a/package/Config.in b/package/Config.in
index bd39a37..044a7e8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1288,6 +1288,7 @@ menu "Logging"
 	source "package/log4cplus/Config.in"
 	source "package/log4cpp/Config.in"
 	source "package/log4cxx/Config.in"
+    source "package/opentracing-cpp/Config.in"
 	source "package/zlog/Config.in"
 endmenu
 
diff --git a/package/opentracing-cpp/Config.in b/package/opentracing-cpp/Config.in
new file mode 100644
index 0000000..3f6f1ad
--- /dev/null
+++ b/package/opentracing-cpp/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_OPENTRACING_CPP
+	bool "opentracing-cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  OpenTracing API for C++
+
+	  http://opentracing.io
+
+comment "opentracing-cpp needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/opentracing-cpp/opentracing-cpp.hash b/package/opentracing-cpp/opentracing-cpp.hash
new file mode 100644
index 0000000..a710d62
--- /dev/null
+++ b/package/opentracing-cpp/opentracing-cpp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 c77041cb2f147ac81b2b0702abfced5565a9cebc318d045c060a4c3e074009ee opentracing-cpp-v1.2.0.tar.gz
diff --git a/package/opentracing-cpp/opentracing-cpp.mk b/package/opentracing-cpp/opentracing-cpp.mk
new file mode 100644
index 0000000..e090be5
--- /dev/null
+++ b/package/opentracing-cpp/opentracing-cpp.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# opentracing-cpp
+#
+################################################################################
+
+OPENTRACING_CPP_VERSION = v1.2.0
+OPENTRACING_CPP_SITE = $(call github,opentracing,opentracing-cpp,$(OPENTRACING_CPP_VERSION))
+OPENTRACING_CPP_LICENSE = MIT
+OPENTRACING_CPP_LICENSE_FILES = COPYING
+
+OPENTRACING_CPP_INSTALL_STAGING = YES
+OPENTRACING_CPP_INSTALL_TARGET = YES
+
+$(eval $(cmake-package))
-- 
2.7.4
