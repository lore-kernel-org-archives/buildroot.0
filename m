From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 21:14:42 +0200
Subject: [Buildroot] [PATCH 04/23] package/qt5/qt5base: harfbuzz support
 needs gcc >= 4.8
In-Reply-To: <20190803191501.5412-1-bernd.kuhls@t-online.de>
References: <20190803191501.5412-1-bernd.kuhls@t-online.de>
Message-ID: <20190803191501.5412-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to the harfbuzz bump to version 2.5.2 we need gcc >= 4.8.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/qt5/qt5base/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 696e689758..c2f1736d95 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -236,7 +236,9 @@ config BR2_PACKAGE_QT5BASE_FONTCONFIG
 
 config BR2_PACKAGE_QT5BASE_HARFBUZZ
 	bool "harfbuzz support"
-	select BR2_PACKAGE_HARFBUZZ if BR2_TOOLCHAIN_HAS_SYNC_4
+	select BR2_PACKAGE_HARFBUZZ if \
+		BR2_TOOLCHAIN_HAS_SYNC_4 && \
+		BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	help
 	  This option enables HarfBuzz support (either system harfbuzz
 	  if the toolchain supports __sync for 4 bytes, or the qt
-- 
2.20.1
