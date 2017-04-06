From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:32:28 +0200
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.77
Message-ID: <20170406203248.12F8E82670@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=137407a7f9a29daf6312a261bd50cf1d6d9622da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace sha256 hash by sha512.

Removed patch 0003, applied upstream:
https://cgit.freedesktop.org/mesa/drm/commit/?id=6796859fcce7b9d7157f066a8b0dac3ede6438dd

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0003-tests-etnaviv-link-against-libdrm.patch   | 31 ----------------------
 package/libdrm/libdrm.hash                         |  4 +--
 package/libdrm/libdrm.mk                           |  2 +-
 3 files changed, 3 insertions(+), 34 deletions(-)

diff --git a/package/libdrm/0003-tests-etnaviv-link-against-libdrm.patch b/package/libdrm/0003-tests-etnaviv-link-against-libdrm.patch
deleted file mode 100644
index 62da60e..0000000
--- a/package/libdrm/0003-tests-etnaviv-link-against-libdrm.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b1e904cd1d5989a13c0a184525e8153bac22e1d7 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 2 Apr 2017 12:17:41 +0200
-Subject: [PATCH] tests/etnaviv: link against libdrm
-
-Fixes link errors detected by buildroot autobuilders:
-
-http://autobuild.buildroot.net/results/68a/68af62f4ab6944d326468818562c05fd5cc55b03/build-end.log
-
-Patch sent upstream: https://bugs.freedesktop.org/show_bug.cgi?id=100530
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- tests/etnaviv/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/etnaviv/Makefile.am b/tests/etnaviv/Makefile.am
-index 06318643..226baee2 100644
---- a/tests/etnaviv/Makefile.am
-+++ b/tests/etnaviv/Makefile.am
-@@ -28,6 +28,7 @@ etnaviv_2d_test_SOURCES = \
- 	write_bmp.h
- 
- etnaviv_cmd_stream_test_LDADD = \
-+	$(top_builddir)/libdrm.la \
- 	$(top_builddir)/etnaviv/libdrm_etnaviv.la
- 
- etnaviv_cmd_stream_test_SOURCES = \
--- 
-2.11.0
-
diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index f9d8217..eb826ed 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2017-March/137337.html
-sha256 7cdfb83ea77def453299dd95332aa9257c9f3534ff5844f5c0ce87265c275f3a  libdrm-2.4.76.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2017-April/137998.html
+sha512 df313bdd9186efdb0e60acdd55e0d5dba402b19011bc3899d56efb4d065f67b6e8c44108fbd8fd258120d4b5c1cc53090beaab732c763bf52f8b352d3c30d101  libdrm-2.4.77.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 8223262..9a78f20 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.76
+LIBDRM_VERSION = 2.4.77
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
