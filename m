From: Martin Bark <martin@barkynet.com>
Date: Sat,  6 May 2017 14:19:12 +0100
Subject: [Buildroot] [PATCH 1/3] package/nodejs: remove support for express
Message-ID: <1494076754-3224-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_NODEJS_MODULES_EXPRESS has been deprecated.  To continue using
add express to BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL

Fixes:
http://autobuild.buildroot.org/results/fcfa38e98c22c8809452f7d0ee86dfe2e9d2482f
http://autobuild.buildroot.org/results/946996fa78c7814d1e0ea0ef1239c6eb0c7aa8dd
http://autobuild.buildroot.org/results/df920e7b17617f1e4867d94eda52cab38f7b0622

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 Config.in.legacy         |  8 ++++++++
 package/nodejs/Config.in | 10 ----------
 package/nodejs/nodejs.mk |  1 -
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index bc14bf2..b0e9254 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.05"
 
+config BR2_PACKAGE_NODEJS_MODULES_EXPRESS
+	bool "Express web application framework has been removed"
+	select BR2_LEGACY
+	help
+	  Support for the Express web application framework has been
+	  removed.  To continue using add express to
+	  BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL.
+
 config BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL
 	bool "bluez5_utils gatttool install option removed"
 	select BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 4810d59..d5034cc 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -44,16 +44,6 @@ config BR2_PACKAGE_NODEJS_NPM
 
 	  Note that NPM is always built for the buildroot host.
 
-config BR2_PACKAGE_NODEJS_MODULES_EXPRESS
-	bool "Express web application framework"
-	help
-	  Express is a minimal and flexible node.js web application
-	  framework, providing a robust set of features for building
-	  single and multi-page, and hybrid web applications.
-
-	  http://www.expressjs.com
-	  https://github.com/visionmedia/express
-
 config BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT
 	bool "CoffeeScript"
 	help
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 1a19502..ba6ee4e 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -143,7 +143,6 @@ endef
 # popular modules, as well as the "additional modules" list.
 #
 NODEJS_MODULES_LIST= $(call qstrip,\
-	$(if $(BR2_PACKAGE_NODEJS_MODULES_EXPRESS),express) \
 	$(if $(BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT),coffee-script) \
 	$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))
 
-- 
2.7.4
