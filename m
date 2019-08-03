From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 21:15:01 +0200
Subject: [Buildroot] [PATCH 23/23] package/harfbuzz: needs gcc >= 4.8
In-Reply-To: <20190803191501.5412-1-bernd.kuhls@t-online.de>
References: <20190803191501.5412-1-bernd.kuhls@t-online.de>
Message-ID: <20190803191501.5412-24-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to the version bump to 2.5.2 we need gcc >= 4.8.

Fixes:
http://autobuild.buildroot.net/results/924/9247b9773099d7995ad8fa1665dd768bb550f63c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/harfbuzz/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
index a6db9840cc..e8f407bb8f 100644
--- a/package/harfbuzz/Config.in
+++ b/package/harfbuzz/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_HARFBUZZ
 	bool "harfbuzz"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	help
 	  HarfBuzz is an OpenType text shaping engine
 
@@ -10,6 +11,7 @@ config BR2_PACKAGE_HARFBUZZ
 	  Harfbuzz can make optional use of cairo, freetype,
 	  glib2 and icu packages if they are selected.
 
-comment "harfbuzz needs a toolchain w/ C++"
+comment "harfbuzz needs a toolchain w/ C++, gcc => 4.8"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-- 
2.20.1
