From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 27 Dec 2013 16:53:10 +0200
Subject: [Buildroot] [PATCH] qt5: disable on avr32
Message-ID: <1388155990-10572-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index bf10075..0f89019 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -1,9 +1,11 @@
 comment "Qt5 needs a toolchain w/ wchar, IPv6, threads, C++"
 	depends on !BR2_PACKAGE_QT
+	depends on !BR2_avr32
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
 
 menuconfig BR2_PACKAGE_QT5
 	bool "Qt5"
+	depends on !BR2_avr32
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_INET_IPV6
-- 
1.8.5.1
