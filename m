From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 29 Nov 2013 15:23:20 +0000
Subject: [Buildroot] [PATCH] qt5: Disable on MIPS64 BigEndian n64 platforms
Message-ID: <1385738600-13376-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5base fails to compile on MIPS64 BigEndian n64 platforms because there
are multiple calls to some functions that are disabled. Since every Qt5
package depends on qt5base we can disable Qt5 entirely. This is a quick
fix for the next release. In the meantime, a proposed patch to fix this
problem has already been sent to Qt:

https://bugreports.qt-project.org/browse/QTBUG-35228

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/qt5/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 42724dc..b92d329 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -9,6 +9,7 @@ menuconfig BR2_PACKAGE_QT5
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_PACKAGE_QT
+	depends on !BR2_mips64 || !BR2_MIPS_NABI64
 	help
 	  This option enables the Qt5 framework. Sub-options allow to
 	  select which modules should be built.
-- 
1.7.1
