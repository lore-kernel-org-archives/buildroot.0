From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 23:07:22 +0200
Subject: [Buildroot] [PATCH] linknx: deprecate the package
Message-ID: <1471554442-4397-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The upstream for this package is dead: the last release is from 2013,
the project is still using a CVS repository on SourceForge, and the
build breaks with gcc 6.x. Let's deprecate this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linknx/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/linknx/Config.in b/package/linknx/Config.in
index ca55c8b..0da136b 100644
--- a/package/linknx/Config.in
+++ b/package/linknx/Config.in
@@ -6,6 +6,9 @@ config BR2_PACKAGE_LINKNX
 	       if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # libpthsem
+	# upstream is dead (CVS on SourceForge), no release since
+	# 2013, build breaks with gcc 6.x
+	depends on BR2_DEPRECATED_SINCE_2016_08
 	help
 	  Linknx is an automation platform providing high level functionalities
 	  to EIB/KNX installation.
@@ -15,3 +18,4 @@ config BR2_PACKAGE_LINKNX
 comment "linknx needs a toolchain w/ C++"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_DEPRECATED_SINCE_2016_08
-- 
2.7.4
