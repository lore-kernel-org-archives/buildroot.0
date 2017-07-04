From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue,  4 Jul 2017 11:40:38 +0200
Subject: [Buildroot] [PATCH 1/3] manual: add documentation about DL_DIR
Message-ID: <20170704094040.19767-1-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And at the same time don't encourage use of BR2_DL_DIR

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-generic.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 71e27b672..12cf1605d 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -263,7 +263,7 @@ information is (assuming the package name is +libfoo+) :
   the file using this URL. Otherwise, Buildroot will assume the file
   to be downloaded is located at +LIBFOO_SITE+. Buildroot will not do
   anything with those additional files, except download them: it will
-  be up to the package recipe to use them from +$(BR2_DL_DIR)+.
+  be up to the package recipe to use them from +$(DL_DIR)+.
 
 * +LIBFOO_SITE_METHOD+ determines the method used to fetch or copy the
   package source code. In many cases, Buildroot guesses the method
@@ -537,6 +537,9 @@ In the action definitions, you can use the following variables:
 * +$(@D)+, which contains the directory in which the package source
   code has been uncompressed.
 
+* +$(DL_DIR)+ contains the path to the directory where all the downloads made
+  by Buildroot are stored.
+
 * +$(TARGET_CC)+, +$(TARGET_LD)+, etc. to get the target
   cross-compilation utilities
 
-- 
2.11.0
