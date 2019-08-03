From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 21:14:52 +0200
Subject: [Buildroot] [PATCH 14/23] package/efl: SVG loader needs gcc >= 4.8
In-Reply-To: <20190803191501.5412-1-bernd.kuhls@t-online.de>
References: <20190803191501.5412-1-bernd.kuhls@t-online.de>
Message-ID: <20190803191501.5412-15-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to the harfbuzz bump to version 2.5.2 the SVG loader needs gcc >=
4.8.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/efl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 05be5aae56..4d98c187c1 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -295,6 +295,7 @@ config BR2_PACKAGE_EFL_LIBRAW
 config BR2_PACKAGE_EFL_SVG
 	bool "SVG loader"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # librsvg -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_CAIRO
 	help
-- 
2.20.1
