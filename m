From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 23:29:54 +0100
Subject: [Buildroot] [git commit] package/pinentry: add missing qt5
 dependencies
Message-ID: <20200315222221.532CE81848@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a1c35f0db012a9e175ba8b679d9cbfaee990c87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
- !BR2_arc

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pinentry/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index 9048edd21b..ef70908502 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -61,6 +61,8 @@ config BR2_PACKAGE_PINENTRY_QT5
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on !BR2_arc
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE_GUI
@@ -68,8 +70,10 @@ config BR2_PACKAGE_PINENTRY_QT5
 	help
 	  The pinentry-qt5 tool
 
-comment "pinentry-qt5 needs a toolchain w/ wchar, NPTL, C++, dynamic library"
+comment "pinentry-qt5 needs a toolchain w/ wchar, NPTL, gcc >= 4.8, C++, dynamic library"
+	depends on !BR2_arc
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		BR2_STATIC_LIBS
 
 endif
