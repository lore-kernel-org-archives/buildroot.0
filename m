From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:07:52 +0200
Subject: [Buildroot] [git commit] package/setools: now available on !glibc
 configs
Message-ID: <20191009221023.EED6081201@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b49a27919fe85a9596987bc532a5d05818804b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that libselinux can be built on !glibc configs, we can re-enable
setools as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/setools/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/setools/Config.in b/package/setools/Config.in
index 0a7899b5eb..f22e1cec08 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_SETOOLS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_ENUM34 if !BR2_PACKAGE_PYTHON3
@@ -22,8 +21,7 @@ config BR2_PACKAGE_SETOOLS
 
 	  https://github.com/TresysTechnology/setools
 
-comment "setools needs a glibc toolchain w/ threads, C++, wchar, dynamic library"
+comment "setools needs a toolchain w/ threads, C++, wchar, dynamic library"
 	depends on BR2_USE_MMU && !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
