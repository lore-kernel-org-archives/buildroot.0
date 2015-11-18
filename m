From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Wed, 18 Nov 2015 18:29:10 +0900
Subject: [Buildroot] package/gauche: fix build error on BR2_STATIC_LIBS
Message-ID: <201511180929.tAI9TATJ023961@ms-omx02.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building gauche depends on dynamic link, so add dependency on
!BR2_STATIC_LIBS.

Fix:
http://autobuild.buildroot.org/results/da5/da5b9605552d4914c5e6f0d890367b92536419c1

Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
---
 package/gauche/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gauche/Config.in b/package/gauche/Config.in
index 0720672..24377c4 100644
--- a/package/gauche/Config.in
+++ b/package/gauche/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GAUCHE
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_STATIC_LIBS
 	help
 	  Gauche is an R7RS Scheme implementation developed to be a
 	  handy script interpreter, which allows programmers and
@@ -13,7 +14,7 @@ config BR2_PACKAGE_GAUCHE
 
 	  http://practical-scheme.net/gauche/
 
-comment "gauche needs a toolchain w/ NPTL"
+comment "gauche needs a toolchain w/ NPTL, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
============================================================
    Hiroshi Kawashima
