From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 16:48:20 +0200
Subject: [Buildroot] [git commit branch/next] libebml: needs wchar support
Message-ID: <20150808105649.E1B568190C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b38205c79ac56a6fc61e614ff52f7a8d43ca0ab2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:

  http://autobuild.buildroot.org/results/83a/83af643e377f53feea044eb6fe1447f7ea502612/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libebml/Config.in     |    5 +++--
 package/libmatroska/Config.in |    5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libebml/Config.in b/package/libebml/Config.in
index b50a492..a00b894 100644
--- a/package/libebml/Config.in
+++ b/package/libebml/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_LIBEBML
 	bool "libebml"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
 	help
 	  Access library for the EBML (Extensible Binary Meta
 	  Language, a binary derivative of XML) format.
 
 	  http://matroska.org
 
-comment "libebml needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "libebml needs a toolchain w/ C++, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/libmatroska/Config.in b/package/libmatroska/Config.in
index 81270de..5815a46 100644
--- a/package/libmatroska/Config.in
+++ b/package/libmatroska/Config.in
@@ -2,11 +2,12 @@ config BR2_PACKAGE_LIBMATROSKA
 	bool "libmatroska"
 	select BR2_PACKAGE_LIBEBML
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
 	help
 	  Extensible open standard audio/video container format access
 	  library.
 
 	  http://matroska.org
 
-comment "libmatroska needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "libmatroska needs a toolchain w/ C++, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
