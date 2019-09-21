From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Sep 2019 20:23:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: needs host gcc >= 4.8
Message-ID: <20190921182328.5458-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/c20/c209e1128cf4601e2f7dc131f82eec0b5df39f75/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/harfbuzz/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
index e8f407bb8f..4fa2135966 100644
--- a/package/harfbuzz/Config.in
+++ b/package/harfbuzz/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HARFBUZZ
 	bool "harfbuzz"
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
@@ -14,4 +15,5 @@ config BR2_PACKAGE_HARFBUZZ
 comment "harfbuzz needs a toolchain w/ C++, gcc => 4.8"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_HOST_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-- 
2.20.1
