From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 19 Oct 2017 16:19:41 -0400
Subject: [Buildroot] [PATCH 1/1] glibmm: bump required gcc version to 4.9
Message-ID: <20171019201941.32404-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

std::regex_replace does not work on gcc version less than 4.9 and will
result in build failures.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/glibmm/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibmm/Config.in b/package/glibmm/Config.in
index 7218db24b3..ca38ecedc4 100644
--- a/package/glibmm/Config.in
+++ b/package/glibmm/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GLIBMM
 	bool "glibmm"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # regex_replace
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-- 
2.13.6
