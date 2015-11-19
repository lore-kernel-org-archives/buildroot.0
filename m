From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Thu, 19 Nov 2015 19:03:41 +0900
Subject: [Buildroot] [PATCH v2] package/gauche: fix build error on
	BR2_STATIC_LIBS
Message-ID: <201511191003.tAJA3feM021882@ms-omx03.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building gauche depends on dynamic link, so add dependency on
!BR2_STATIC_LIBS.

Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
---
Changes:
    v1 -> v2: previous patch conflict with latest master, so send again.
---
 package/gauche/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gauche/Config.in b/package/gauche/Config.in
index 54a0be2..fd0617a 100644
--- a/package/gauche/Config.in
+++ b/package/gauche/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_GAUCHE
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_ARCH_HAS_ATOMICS
 	depends on BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS
 	help
 	  Gauche is an R7RS Scheme implementation developed to be a
 	  handy script interpreter, which allows programmers and
@@ -23,8 +24,8 @@ config BR2_PACKAGE_GAUCHE
 
 	  http://practical-scheme.net/gauche/
 
-comment "gauche needs a toolchain w/ NPTL"
+comment "gauche needs a toolchain w/ NPTL, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
 	depends on BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
============================================================
    Hiroshi Kawashima
