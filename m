From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:11:15 +0200
Subject: [Buildroot] [git commit] package/setools: re-enable on ARC
Message-ID: <20191009221024.4B0AA815D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d90f775002e4148c8aa980ba0720e481e8035b9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libselinux is now available on ARC, so we can re-enable setools as
well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/setools/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/setools/Config.in b/package/setools/Config.in
index f22e1cec08..56a85b01c8 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SETOOLS
 	bool "setools"
-	depends on !BR2_arc # arc: libselinux not available
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
@@ -22,6 +21,6 @@ config BR2_PACKAGE_SETOOLS
 	  https://github.com/TresysTechnology/setools
 
 comment "setools needs a toolchain w/ threads, C++, wchar, dynamic library"
-	depends on BR2_USE_MMU && !BR2_arc
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
 		!BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
