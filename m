From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue,  4 Jul 2017 18:22:09 +0200
Subject: [Buildroot] [PATCH 11/13] help/manual: update help about the new
	$(LIBFOO_DL_DIR)
In-Reply-To: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
Message-ID: <20170704162211.13238-12-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 Config.in                               | 3 +++
 docs/manual/adding-packages-generic.txt | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index 72ceadfde6..0ad43679f3 100644
--- a/Config.in
+++ b/Config.in
@@ -195,6 +195,9 @@ config BR2_DL_DIR
 	  If the Linux shell environment has defined the BR2_DL_DIR
 	  environment variable, then this overrides this configuration
 	  item.
+	  The directory is organized with a subdirectory for each package.
+	  Each package has its own $(LIBFOO_DL_DIR) variable that can be used
+	  to find the correct path.
 
 	  The default is $(TOPDIR)/dl
 
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 12cf1605d6..6e3b503f6b 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -263,7 +263,7 @@ information is (assuming the package name is +libfoo+) :
   the file using this URL. Otherwise, Buildroot will assume the file
   to be downloaded is located at +LIBFOO_SITE+. Buildroot will not do
   anything with those additional files, except download them: it will
-  be up to the package recipe to use them from +$(DL_DIR)+.
+  be up to the package recipe to use them from +$(LIBFOO_DL_DIR)+.
 
 * +LIBFOO_SITE_METHOD+ determines the method used to fetch or copy the
   package source code. In many cases, Buildroot guesses the method
@@ -537,8 +537,8 @@ In the action definitions, you can use the following variables:
 * +$(@D)+, which contains the directory in which the package source
   code has been uncompressed.
 
-* +$(DL_DIR)+ contains the path to the directory where all the downloads made
-  by Buildroot are stored.
+* +$(LIBFOO_DL_DIR)+ contains the path to the directory where all the downloads
+  made by Buildroot are stored.
 
 * +$(TARGET_CC)+, +$(TARGET_LD)+, etc. to get the target
   cross-compilation utilities
-- 
2.13.2
