From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 26 Nov 2018 12:08:06 +0100
Subject: [Buildroot] [PATCH 14/15] erlang-p1-eimp: New package
In-Reply-To: <20181126110807.31431-1-johan.oudinet@gmail.com>
References: <20181126110807.31431-1-johan.oudinet@gmail.com>
Message-ID: <20181126110807.31431-15-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                  |  1 +
 package/erlang-eimp/Config.in      | 12 ++++++++++++
 package/erlang-eimp/erlang-eimp.mk | 13 +++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/erlang-eimp/Config.in
 create mode 100644 package/erlang-eimp/erlang-eimp.mk

diff --git a/package/Config.in b/package/Config.in
index b60e7700ad..e15ab513f9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -550,6 +550,7 @@ menu "Interpreter languages and scripting"
 	source "package/erlang/Config.in"
 if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
+	source "package/erlang-eimp/Config.in"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-jiffy/Config.in"
 	source "package/erlang-lager/Config.in"
diff --git a/package/erlang-eimp/Config.in b/package/erlang-eimp/Config.in
new file mode 100644
index 0000000000..5c207e9c23
--- /dev/null
+++ b/package/erlang-eimp/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_ERLANG_EIMP
+	bool "erlang-eimp"
+	select BR2_PACKAGE_ERLANG_P1_UTILS
+	select BR2_PACKAGE_GD
+	select BR2_PACKAGE_GD_WEBPNG
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_WEBP
+	help
+	  Erlang Image Manipulation Process
+
+	  https://github.com/processone/eimp
diff --git a/package/erlang-eimp/erlang-eimp.mk b/package/erlang-eimp/erlang-eimp.mk
new file mode 100644
index 0000000000..83d34cd5e0
--- /dev/null
+++ b/package/erlang-eimp/erlang-eimp.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# erlang-eimp
+#
+################################################################################
+
+ERLANG_EIMP_VERSION = 1.0.8
+ERLANG_EIMP_SITE = $(call github,processone,eimp,$(ERLANG_EIMP_VERSION))
+ERLANG_EIMP_LICENSE = Apache-2.0
+ERLANG_EIMP_LICENSE_FILES = LICENSE.txt
+ERLANG_EIMP_DEPENDENCIES = erlang-p1-utils gd jpeg libpng webp
+
+$(eval $(rebar-package))
-- 
2.17.1
