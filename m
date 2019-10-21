From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 21 Oct 2019 19:14:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
Message-ID: <20191021171454.22134-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebased patch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
I know this is the third bump in less than a week but several bugs were
fixed upstream: https://github.com/tvheadend/tvheadend/commits/master

Also using a version tag is not an option, the newest tag 4.2.8 dates
back to Jan 2019 and is on the 4.2 branch which, at time of writing,
is 1843 commits behind the master branch, so imho no option.

 package/tvheadend/0001-no-check_config.patch | 2 +-
 package/tvheadend/tvheadend.hash             | 2 +-
 package/tvheadend/tvheadend.mk               | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tvheadend/0001-no-check_config.patch b/package/tvheadend/0001-no-check_config.patch
index 361ebcd41c..9261e5fff6 100644
--- a/package/tvheadend/0001-no-check_config.patch
+++ b/package/tvheadend/0001-no-check_config.patch
@@ -12,7 +12,7 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile
 --- tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile	2014-03-09 14:47:43.780025330 +0100
 +++ tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile	2014-03-09 14:48:40.836539093 +0100
-@@ -566,7 +566,7 @@
+@@ -708,7 +708,7 @@
  	$(ROOTDIR)/configure $(CONFIGURE_ARGS)
  
  # Binary
diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 5202ac8cd9..3bda417fb8 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 9c7888ec3754e20a728dcc06e69c8fa53fd085879ee5191bbcf35105f82cc1d2  tvheadend-6fbb30d039c763268b3e9017e062b0c9ec6bebeb.tar.gz
+sha256 831ffec13240a93b63d74d508a416091b67f0d54f3596775a698c4ded4781ec4  tvheadend-6540ff23747499bfa28ba04cc76347a9209f4a1e.tar.gz
 sha256 54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 4ad6317ff1..df88cdc31d 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 6fbb30d039c763268b3e9017e062b0c9ec6bebeb
+TVHEADEND_VERSION = 6540ff23747499bfa28ba04cc76347a9209f4a1e
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.20.1
