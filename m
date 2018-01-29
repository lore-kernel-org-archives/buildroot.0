From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Mon, 29 Jan 2018 06:38:11 +0100
Subject: [Buildroot] [PATCH] package/pinentry: avoid building qt5 version if
 qt4 is enabled
Message-ID: <1517204291-23391-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_PINENTRY_QT5 selects BR2_PACKAGE_QT5, which can lead to Qt
version clash if otherwise Qt4 is selected as well. Making
BR2_PACKAGE_PINENTRY_QT5 depending on !BR2_PACKAGE_QT to avoid this.

Fixes:
     http://autobuild.buildroot.net/results/3c537e1260dc9ce57657ca0d49e318a10aee111e

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/pinentry/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index 781901b..5f2cb58 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -63,6 +63,7 @@ config BR2_PACKAGE_PINENTRY_QT5
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_PACKAGE_PINENTRY_QT4
+	depends on !BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS
-- 
2.7.4
