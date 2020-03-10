From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Mar 2020 09:19:01 +0100
Subject: [Buildroot] [PATCH v1 3/4] package/pinentry: add missing qt5
 dependencies
In-Reply-To: <20200310081902.3488-1-ps.report@gmx.net>
References: <20200310081902.3488-1-ps.report@gmx.net>
Message-ID: <20200310081902.3488-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 - !BR2_arc

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/pinentry/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index 9048edd21b..7d76ee7ea9 100644
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
@@ -68,8 +70,9 @@ config BR2_PACKAGE_PINENTRY_QT5
 	help
 	  The pinentry-qt5 tool
 
-comment "pinentry-qt5 needs a toolchain w/ wchar, NPTL, C++, dynamic library"
+comment "pinentry-qt5 needs a toolchain w/ wchar, NPTL, gcc >= 4.8, C++, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_arc || BR2_STATIC_LIBS
 
 endif
-- 
2.25.1
