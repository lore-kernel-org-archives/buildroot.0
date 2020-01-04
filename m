From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jan 2020 20:55:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcodec2: bump version to 0.9.2
Message-ID: <20200104195558.149158-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream:
https://github.com/drowe67/codec2/commit/375d4c8d782c3bcadbb2240efed39b64ffd28430

Switched _SITE to github as suggested by
http://www.rowetel.com/?page_id=452

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcodec2/0001-fix-codec2-pc-in.patch | 20 -------------------
 package/libcodec2/libcodec2.hash              |  2 +-
 package/libcodec2/libcodec2.mk                |  5 ++---
 3 files changed, 3 insertions(+), 24 deletions(-)
 delete mode 100644 package/libcodec2/0001-fix-codec2-pc-in.patch

diff --git a/package/libcodec2/0001-fix-codec2-pc-in.patch b/package/libcodec2/0001-fix-codec2-pc-in.patch
deleted file mode 100644
index 5950219de2..0000000000
--- a/package/libcodec2/0001-fix-codec2-pc-in.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Fix includedir in codec2.pc.in
-
-The template file codec2.pc.in contains the wrong path to the header
-files: they are installed in /usr/include/codec2 and not /usr/include/
-directly.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/codec2.pc.in
-===================================================================
---- a/codec2.pc.in
-+++ b/codec2.pc.in
-@@ -1,6 +1,6 @@
- prefix=@CMAKE_INSTALL_PREFIX@
- libdir=@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@
--includedir=@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_INCLUDEDIR@/
-+includedir=@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_INCLUDEDIR@/codec2
- 
- Name: codec2
- Description: A speech codec for 2400 bit/s and below
diff --git a/package/libcodec2/libcodec2.hash b/package/libcodec2/libcodec2.hash
index e401e9d30e..ec4f1f1a32 100644
--- a/package/libcodec2/libcodec2.hash
+++ b/package/libcodec2/libcodec2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 0695bb93cd985dd39f02f0db35ebc28a98b9b88747318f90774aba5f374eadb2  codec2-0.7.tar.xz
+sha256 19181a446f4df3e6d616b50cabdac4485abb9cd3242cf312a0785f892ed4c76c  libcodec2-0.9.2.tar.gz
 sha256 9ebb6f82b7380a62ac74c5f0322c88e6744dedf2ebe1f54d6f088282b39844bf  COPYING
diff --git a/package/libcodec2/libcodec2.mk b/package/libcodec2/libcodec2.mk
index 3253a35956..8410ffc90a 100644
--- a/package/libcodec2/libcodec2.mk
+++ b/package/libcodec2/libcodec2.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBCODEC2_VERSION = 0.7
-LIBCODEC2_SITE = https://freedv.com/wp-content/uploads/sites/8/2017/10
-LIBCODEC2_SOURCE = codec2-$(LIBCODEC2_VERSION).tar.xz
+LIBCODEC2_VERSION = 0.9.2
+LIBCODEC2_SITE = $(call github,drowe67,codec2,v$(LIBCODEC2_VERSION))
 LIBCODEC2_LICENSE = LGPL-2.1
 LIBCODEC2_LICENSE_FILES = COPYING
 LIBCODEC2_INSTALL_STAGING = YES
-- 
2.20.1
