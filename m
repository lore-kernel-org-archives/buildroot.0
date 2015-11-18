From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 21:56:58 +0100
Subject: [Buildroot] [git commit] package/gauche: fix build error on
	BR2_STATIC_LIBS
Message-ID: <20151118205733.2561781E03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9b415ace06b416a5743c97e13f4fd7df9666d85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building gauche depends on dynamic link, so add dependency on
!BR2_STATIC_LIBS.

Fix:
http://autobuild.buildroot.org/results/da5/da5b9605552d4914c5e6f0d890367b92536419c1

Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gauche/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

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
