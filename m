From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2020 00:11:55 +0200
Subject: [Buildroot] [git commit] package/libhttpserver: bump to version
 0.18.0
Message-ID: <20200605221141.5507580124@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5daac880feb0db45b7ec597705c8bfb933267a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Stephan Hoffmann <sho@relinux.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...x-lib-expectations-in-libhttpserver.pc.in.patch | 27 ----------------------
 package/libhttpserver/libhttpserver.hash           |  4 ++--
 package/libhttpserver/libhttpserver.mk             |  2 +-
 3 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/package/libhttpserver/0001-Fix-lib-expectations-in-libhttpserver.pc.in.patch b/package/libhttpserver/0001-Fix-lib-expectations-in-libhttpserver.pc.in.patch
deleted file mode 100644
index 74ca58bb31..0000000000
--- a/package/libhttpserver/0001-Fix-lib-expectations-in-libhttpserver.pc.in.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 2bc7cf0beb6b8a124c1c7360c4fb5279e8763f07 Mon Sep 17 00:00:00 2001
-From: Sebastiano Merlino <electrictwister2000@gmail.com>
-Date: Sat, 8 Jun 2019 15:36:06 -0700
-Subject: [PATCH] Fix lib expectations in libhttpserver.pc.in
-
-Signed-off-by: Stephan Hoffmann <stephan.hoffmann@ext.grandcentrix.net>
----
-Patch status: upstream commit 458d16b922304006fe418897044e14
-
- libhttpserver.pc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libhttpserver.pc.in b/libhttpserver.pc.in
-index 36355ee..55f7c0e 100644
---- a/libhttpserver.pc.in
-+++ b/libhttpserver.pc.in
-@@ -8,6 +8,6 @@ Description: A C++ library for creating an embedded Rest HTTP server
- Version: @VERSION@
- Requires: libmicrohttpd >= 0.9.37
- Conflicts:
--Libs: -L${libdir} -lmicrohttpd
-+Libs: -L${libdir} -lhttpserver
- Libs.private: @LHT_LIBDEPS@
- Cflags: -I${includedir} -I${includedir}/httpserver
--- 
-2.17.1
-
diff --git a/package/libhttpserver/libhttpserver.hash b/package/libhttpserver/libhttpserver.hash
index 0333aabbae..0791d800b8 100644
--- a/package/libhttpserver/libhttpserver.hash
+++ b/package/libhttpserver/libhttpserver.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 778fa0aec199bf8737b2d540c2563a694c18957329f9885e372f7aaafb838351 libhttpserver-0.17.5.tar.gz
-sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a COPYING.LESSER
+sha256  b4a745a9f32a1ac02b545c062fc85342a655c3770cd8d4d7218f34509ea27d98  libhttpserver-0.18.0.tar.gz
+sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LESSER
diff --git a/package/libhttpserver/libhttpserver.mk b/package/libhttpserver/libhttpserver.mk
index 2c536cf012..170d46b06a 100644
--- a/package/libhttpserver/libhttpserver.mk
+++ b/package/libhttpserver/libhttpserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTTPSERVER_VERSION = 0.17.5
+LIBHTTPSERVER_VERSION = 0.18.0
 LIBHTTPSERVER_SITE = $(call github,etr,libhttpserver,$(LIBHTTPSERVER_VERSION))
 LIBHTTPSERVER_LICENSE = LGPL-2.1+
 LIBHTTPSERVER_LICENSE_FILES = COPYING.LESSER
