From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Tue,  4 Feb 2014 15:18:47 +0100
Subject: [Buildroot] [PATCH 1/1] libxmlpp: need BR2_USE_MMU dependancy
Message-ID: <1391523527-13858-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.org/results/d4d/d4d10ddccf4f53087e2012a36fd80808f7dc7cc5/

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/libxmlpp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libxmlpp/Config.in b/package/libxmlpp/Config.in
index 77723a8..69bd220 100644
--- a/package/libxmlpp/Config.in
+++ b/package/libxmlpp/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBXMLPP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # glibmm -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glibmm -> libglib2
+	depends on BR2_USE_MMU # glibmm -> libglib2
 	help
 	  libxml++ is a C++ wrapper for the libxml XML parser library.
 
-- 
1.8.3.2
