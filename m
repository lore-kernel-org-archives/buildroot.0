From: Michael Trimarchi <michael@amarulasolutions.com>
Date: Tue, 24 Dec 2019 12:23:30 +0100
Subject: [Buildroot] [PATCH] package/fontconfig: Fix UUIDD dependency
Message-ID: <20191224112330.14173-1-michael@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build with BR2_PACKAGE_XORG7 and BR2_PACKAGE_OPENJDK
was failing for missing include of uuid support.
The BR2_PACKAGE_UTIL_LINUX_UUIDD select automatically
BR2_PACKAGE_UTIL_LINUX_LIBUUID but the first one is needed

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 package/fontconfig/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fontconfig/Config.in b/package/fontconfig/Config.in
index d274b06350..e92e184119 100644
--- a/package/fontconfig/Config.in
+++ b/package/fontconfig/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_UUIDD
 	help
 	  Fontconfig is a library for configuring and customizing font
 	  access.
-- 
2.17.1
