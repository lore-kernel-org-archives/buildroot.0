From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 31 Jul 2013 13:27:01 -0300
Subject: [Buildroot] [PATCH] qt5jsbackend: needs ARM v5+
Message-ID: <1375288021-23307-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just like nodejs and other v8-based javascript engines for ARM interwork
it needs the BLX instruction which is only available on V5+ cores.
Fixes:
http://autobuild.buildroot.net/results/853/853cd29bf427902b2cb82a101964a4e45714cb86/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/qt5/qt5jsbackend/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/qt5jsbackend/Config.in b/package/qt5/qt5jsbackend/Config.in
index 2f5ac1f..d9301d0 100644
--- a/package/qt5/qt5jsbackend/Config.in
+++ b/package/qt5/qt5jsbackend/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
 	bool
 	# v8 is only available on certain architectures
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
+	# ARM needs BLX, so v5t+
+	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
 	default y
 
 config BR2_PACKAGE_QT5JSBACKEND
-- 
1.8.1.5
