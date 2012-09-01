From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  1 Sep 2012 09:25:29 +0200
Subject: [Buildroot] [PATCH 11/14] cpanminus: handle native dependencies
In-Reply-To: <1346484332-31433-1-git-send-email-francois.perrad@gadz.org>
References: <1346484332-31433-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1346484332-31433-11-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/cpanminus/Config.in    |    5 +++++
 package/cpanminus/cpanminus.mk |    2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/cpanminus/Config.in b/package/cpanminus/Config.in
index 7c41c4d..d265c2e 100644
--- a/package/cpanminus/Config.in
+++ b/package/cpanminus/Config.in
@@ -20,4 +20,9 @@ config BR2_PACKAGE_CPANMINUS_MODULES
 
 	  Install the listed modules and their dependencies.
 
+config BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES
+	string "native dependencies"
+	help
+	  Some XS modules require native libraries.
+
 endif
diff --git a/package/cpanminus/cpanminus.mk b/package/cpanminus/cpanminus.mk
index ce2a09b..5c10627 100644
--- a/package/cpanminus/cpanminus.mk
+++ b/package/cpanminus/cpanminus.mk
@@ -7,7 +7,7 @@
 CPANMINUS_VERSION = 1.5017
 CPANMINUS_SOURCE = miyagawa-cpanminus-$(CPANMINUS_VERSION)-0-g917a607.tar.gz
 CPANMINUS_SITE = https://github.com/miyagawa/cpanminus/tarball/$(CPANMINUS_VERSION)
-CPANMINUS_DEPENDENCIES = perl
+CPANMINUS_DEPENDENCIES = perl $(call qstrip,$(BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES))
 
 CPANMINUS_ARCH=$(call qstrip,$(BR2_ARCH))
 ifeq ($(CPANMINUS_ARCH),i686)
-- 
1.7.9.5
