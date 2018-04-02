From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Apr 2018 17:48:56 +0200
Subject: [Buildroot] [git commit] help/manual: update help about the new
 $(LIBFOO_DL_DIR)
Message-ID: <20180402154921.8E26D8127C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=072374918de92aef9b8ca5a3248a3905cba70ba2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in                               | 3 +++
 docs/manual/adding-packages-generic.txt | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index 71b9f60e5b..c2a1925088 100644
--- a/Config.in
+++ b/Config.in
@@ -200,6 +200,9 @@ config BR2_DL_DIR
 	  If the Linux shell environment has defined the BR2_DL_DIR
 	  environment variable, then this overrides this configuration
 	  item.
+	  The directory is organized with a subdirectory for each package.
+	  Each package has its own $(LIBFOO_DL_DIR) variable that can be used
+	  to find the correct path.
 
 	  The default is $(TOPDIR)/dl
 
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 9d1428ad40..62906d92bb 100644
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
@@ -554,8 +554,8 @@ In the action definitions, you can use the following variables:
 * +$(@D)+, which contains the directory in which the package source
   code has been uncompressed.
 
-* +$(DL_DIR)+ contains the path to the directory where all the downloads made
-  by Buildroot are stored.
+* +$(LIBFOO_DL_DIR)+ contains the path to the directory where all the downloads
+  made by Buildroot for +libfoo+ are stored in.
 
 * +$(TARGET_CC)+, +$(TARGET_LD)+, etc. to get the target
   cross-compilation utilities
