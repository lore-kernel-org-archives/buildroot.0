From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2013 19:42:50 +0100
Subject: [Buildroot] [git commit] qt5: Disable on MIPS64 BigEndian n64
	platforms
Message-ID: <20131129184634.C63C19BDF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=931b73e5eae4a3ba6b2e37db526fd7243a139e64
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5base fails to compile on MIPS64 BigEndian n64 platforms because there
are multiple calls to some functions that are disabled. Since every Qt5
package depends on qt5base we can disable Qt5 entirely. This is a quick
fix for the next release. In the meantime, a proposed patch to fix this
problem has already been sent to Qt:

https://bugreports.qt-project.org/browse/QTBUG-35228

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Acked-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
