From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:15 -0500
Subject: [Buildroot] [PATCH 32/67] libxmlpp: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-33-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/libxmlpp/Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libxmlpp/Config.in b/package/libxmlpp/Config.in
index cf29c2c..2448bfd 100644
--- a/package/libxmlpp/Config.in
+++ b/package/libxmlpp/Config.in
@@ -3,11 +3,13 @@ config BR2_PACKAGE_LIBXMLPP
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_GLIBMM
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR
+	depends on BR2_USE_WCHAR # glibmm -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glibmm -> libglib2
 	help
 	  libxml++ is a C++ wrapper for the libxml XML parser library.
 
 	  http://libxmlplusplus.sourceforge.net/
 
-comment "libxml++ requires a toolchain with C++ & WCHAR support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "libxml++ requires a toolchain with C++, WCHAR and threading support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+	!BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
