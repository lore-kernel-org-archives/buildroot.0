From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 21:14:39 +0200
Subject: [Buildroot] [PATCH 01/23] package/cwiid: wmgui needs gcc >= 4.8
In-Reply-To: <20190803191501.5412-1-bernd.kuhls@t-online.de>
References: <20190803191501.5412-1-bernd.kuhls@t-online.de>
Message-ID: <20190803191501.5412-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to the harfbuzz bump to version 2.5.2 wmgui needs gcc >= 4.8.

Fixed typo in BR2_TOOLCHAIN_HAS_SYNC_4 comment.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/cwiid/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index 50c05ebd91..7ee8117355 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -14,7 +14,8 @@ config BR2_PACKAGE_CWIID
 if BR2_PACKAGE_CWIID
 config BR2_PACKAGE_CWIID_WMGUI
 	bool "wmgui"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk3 -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libgtk2 -> pango -> harfbuzz
 	depends on BR2_PACKAGE_XORG7 # libgtk2
 	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
-- 
2.20.1
