From: Davide Viti <zinosat@tiscali.it>
Date: Sun, 18 Nov 2012 22:13:44 +0100
Subject: [Buildroot] [PATCH] List all the available hook points
Message-ID: <1353273224-14685-1-git-send-email-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The list was obtained with the following command:
  grep "_HOOKS[ ]\+?=" package/pkg-generic.mk
---
 docs/manual/adding-packages-generic.txt |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index b05043a..a2f37ec 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -357,6 +357,9 @@ userful for generic packages.
 
 The following hook points are available:
 
+* +LIBFOO_POST_DOWNLOAD_HOOKS+
+* +LIBFOO_POST_EXTRACT_HOOKS+
+* +LIBFOO_PRE_PATCH_HOOKS+
 * +LIBFOO_POST_PATCH_HOOKS+
 * +LIBFOO_PRE_CONFIGURE_HOOKS+
 * +LIBFOO_POST_CONFIGURE_HOOKS+
@@ -364,6 +367,7 @@ The following hook points are available:
 * +LIBFOO_POST_INSTALL_HOOKS+ (for host packages only)
 * +LIBFOO_POST_INSTALL_STAGING_HOOKS+ (for target packages only)
 * +LIBFOO_POST_INSTALL_TARGET_HOOKS+ (for target packages only)
+* +LIBFOO_POST_INSTALL_IMAGES_HOOKS+
 * +LIBFOO_POST_LEGAL_INFO_HOOKS+
 
 These variables are 'lists' of variable names containing actions to be
-- 
1.7.2.5
