From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jun 2019 16:25:51 +0200
Subject: [Buildroot] [git commit] package/openzwave: needs NPTL
Message-ID: <20190610142635.DF9268F696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e2c3c390b3cfa04b3d9f9c1dad686ec013d77f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openzwave needs pthread_setname_np

Fixes:
 - http://autobuild.buildroot.org/results/d50a79384eb346078fd83ad3a1ba8b8a04cc4d53

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/openzwave/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openzwave/Config.in b/package/openzwave/Config.in
index f2a4ca5225..b5c1b620c6 100644
--- a/package/openzwave/Config.in
+++ b/package/openzwave/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_OPENZWAVE
 	bool "openzwave"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
@@ -13,6 +13,6 @@ config BR2_PACKAGE_OPENZWAVE
 
 	  http://www.openzwave.net
 
-comment "openzwave needs a toolchain w/ C++, dynamic library, threads, wchar"
+comment "openzwave needs a toolchain w/ C++, dynamic library, NPTL, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
