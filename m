From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 13:01:51 +0200
Subject: [Buildroot] [git commit branch/next] packages/libfreeimage:
	requires wchar
Message-ID: <20150808105649.DA1808190C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f893d08181e348202e56307885c22f4e9c62ec4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes http://autobuild.buildroot.net/results/6e9/6e9f2bf02e0a165826e9fab194d6bad7901051a9/

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfreeimage/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libfreeimage/Config.in b/package/libfreeimage/Config.in
index 04fb278..4b462cb 100644
--- a/package/libfreeimage/Config.in
+++ b/package/libfreeimage/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBFREEIMAGE
 	bool "libfreeimage"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
 	# compiler issue: "Error: invalid register number `63'"
 	depends on !BR2_arc
 	# Numerous build issues
@@ -14,7 +15,7 @@ config BR2_PACKAGE_LIBFREEIMAGE
 
 	  http://freeimage.sourceforge.net
 
-comment "libfreeimage needs a toolchain w/ C++, dynamic library"
+comment "libfreeimage needs a toolchain w/ C++, dynamic library, wchar"
 	depends on !BR2_arc
 	depends on !BR2_bfin
-	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
