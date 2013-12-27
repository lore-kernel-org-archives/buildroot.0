From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Dec 2013 19:53:04 +0100
Subject: [Buildroot] [git commit] qt5: disable on avr32
Message-ID: <20131227185310.F18B79B967@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1980c2d30cd2d2a9b766793a4a170d949c80b8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
