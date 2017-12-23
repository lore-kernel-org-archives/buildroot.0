From: Jan Heylen <heyleke@gmail.com>
Date: Sat, 23 Dec 2017 08:40:01 +0100
Subject: [Buildroot] [PATCH v2 1/2] Opentracing: add opentracing-cpp v1.2.0
 package
In-Reply-To: <1514014802-23736-1-git-send-email-heyleke@gmail.com>
References: <1513849309-550-2-git-send-email-heyleke@gmail.com>
 <1514014802-23736-1-git-send-email-heyleke@gmail.com>
Message-ID: <1514014802-23736-2-git-send-email-heyleke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Heylen <jan.heylen@nokia.com>

Signed-off-by: Jan Heylen <jan.heylen@nokia.com>

---
Changes v1 -> v2:
  - Fix indendation typo
  - Add licence hash
  - remove INTALL_TARGET=yes as that is default

---
 package/Config.in                            |  1 +
 package/opentracing-cpp/Config.in            | 11 +++++++++++
 package/opentracing-cpp/opentracing-cpp.hash |  3 +++
 package/opentracing-cpp/opentracing-cpp.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/opentracing-cpp/Config.in
 create mode 100644 package/opentracing-cpp/opentracing-cpp.hash
 create mode 100644 package/opentracing-cpp/opentracing-cpp.mk

diff --git a/package/Config.in b/package/Config.in
index bd39a37..1150a3f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1288,6 +1288,7 @@ menu "Logging"
 	source "package/log4cplus/Config.in"
 	source "package/log4cpp/Config.in"
 	source "package/log4cxx/Config.in"
+	source "package/opentracing-cpp/Config.in"
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
index 0000000..d25dbaf
--- /dev/null
+++ b/package/opentracing-cpp/opentracing-cpp.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 c77041cb2f147ac81b2b0702abfced5565a9cebc318d045c060a4c3e074009ee opentracing-cpp-v1.2.0.tar.gz
+sha256 b80bffcfee825a69645f7ca97ddba48714031ea5c845198d184714d5490798b6 COPYING
diff --git a/package/opentracing-cpp/opentracing-cpp.mk b/package/opentracing-cpp/opentracing-cpp.mk
new file mode 100644
index 0000000..f1748ef
--- /dev/null
+++ b/package/opentracing-cpp/opentracing-cpp.mk
@@ -0,0 +1,14 @@
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
+
+$(eval $(cmake-package))
-- 
2.7.4
