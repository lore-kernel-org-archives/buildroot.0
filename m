From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 21:52:18 +0200
Subject: [Buildroot] [git commit] liblinear: bump to version 2.20
Message-ID: <20180503195235.11E9C8B532@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=629085320ce08476cdec6ffc44c67a9efa32db85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Slightly update first patch so it can apply on this version
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/liblinear/0001-blas-don-t-overwrite-ar-options.patch | 5 +++--
 package/liblinear/liblinear.hash                             | 3 ++-
 package/liblinear/liblinear.mk                               | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/liblinear/0001-blas-don-t-overwrite-ar-options.patch b/package/liblinear/0001-blas-don-t-overwrite-ar-options.patch
index 5d1ef3f52a..0c13e35c4c 100644
--- a/package/liblinear/0001-blas-don-t-overwrite-ar-options.patch
+++ b/package/liblinear/0001-blas-don-t-overwrite-ar-options.patch
@@ -7,6 +7,7 @@ ar's rcv options get lost when AR is passed on
 the command line.
 
 Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  blas/Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -18,14 +19,14 @@ index 895fd24..78cec9a 100644
 @@ -1,4 +1,4 @@
 -AR     = ar rcv
 +AR     = ar
- RANLIB = ranlib 
+ RANLIB = ranlib
  
  HEADERS = blas.h blasp.h
 @@ -8,7 +8,7 @@ CFLAGS = $(OPTFLAGS)
  FFLAGS = $(OPTFLAGS)
  
  blas: $(FILES) $(HEADERS)
--	$(AR) blas.a $(FILES)  
+-	$(AR) blas.a $(FILES)
 +	$(AR) rcv blas.a $(FILES)  
  	$(RANLIB) blas.a
  
diff --git a/package/liblinear/liblinear.hash b/package/liblinear/liblinear.hash
index 4f03fa4a84..9644bc02dd 100644
--- a/package/liblinear/liblinear.hash
+++ b/package/liblinear/liblinear.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	fa5c12dedc76ffca12f1681de7073b03af68163c4e4be65194217c99e55a7d68	liblinear-2.1.tar.gz
+sha256	3f9fef20e76267bed1b817c9dc96d561ab5ee487828109bd44ed268fbf42048f	liblinear-2.20.tar.gz
+sha256	2ad9363447d0afeca34d53619163cffd502ec172bdb44d8d112c7acb99ae2558	COPYRIGHT
diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index 84527ab8f5..e1a0d10909 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLINEAR_VERSION = 2.1
+LIBLINEAR_VERSION = 2.20
 LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear
 LIBLINEAR_LICENSE = BSD-3-Clause
 LIBLINEAR_LICENSE_FILES = COPYRIGHT
