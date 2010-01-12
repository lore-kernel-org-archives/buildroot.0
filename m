From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jan 2010 00:27:21 +0100
Subject: [Buildroot] [PATCH 2/6] lzma: Use BR2_INSTALL_LIBSTDCPP instead of
	BR2_GCC_CROSS_CXX like in other packages
In-Reply-To: <cover.1263338839.git.thomas.petazzoni@free-electrons.com>
References: <cover.1263338839.git.thomas.petazzoni@free-electrons.com>
Message-ID: <99da39b5b38842c0244ef359d1ffd2ff276a5d97.1263338839.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lzma/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lzma/Config.in b/package/lzma/Config.in
index ab1ea59..11251d1 100644
--- a/package/lzma/Config.in
+++ b/package/lzma/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LZMA
 	bool "lzma"
-	depends on BR2_GCC_CROSS_CXX
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Lempel Ziv compression method (LZMA) is a compression
 	  algorithm with high compression ratio.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_LZMA
 	  http://tukaani.org/lzma/
 
 comment "lzma requires a toolchain with C++ support"
-        depends on !BR2_GCC_CROSS_CXX
+        depends on !BR2_INSTALL_LIBSTDCPP
-- 
1.6.3.3
