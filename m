From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 22:38:20 +0100
Subject: [Buildroot] [git commit] package/erlang-p1-eimp: new package
Message-ID: <20181202071600.ABE94803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=091c950fb068209a2cff450cd56b48c053333208
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
[Thomas: add entry in DEVELOPERS file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/erlang-eimp/Config.in      | 12 ++++++++++++
 package/erlang-eimp/erlang-eimp.mk | 13 +++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1ed266eafc..a597d8d875 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1074,6 +1074,7 @@ F:	package/python-libconfig/
 
 N:	Johan Oudinet <johan.oudinet@gmail.com>
 F:	package/ejabberd/
+F:	package/erlang-eimp/
 F:	package/erlang-goldrush/
 F:	package/erlang-jiffy/
 F:	package/erlang-lager/
diff --git a/package/Config.in b/package/Config.in
index 6e0f3c9a92..e19964dc2b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -551,6 +551,7 @@ menu "Interpreter languages and scripting"
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
