From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Jan 2014 09:12:05 +0100
Subject: [Buildroot] [git commit] sconeserver: needs NPTL
Message-ID: <20140117081318.2E2799C533@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=304cb4d512c967ea1e4653580ef531259b2d1458
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/fb8/fb8d071411b571780806792b7436d20f62a9a0f7/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sconeserver/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index b8755c6..839c111 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -2,6 +2,10 @@ menuconfig BR2_PACKAGE_SCONESERVER
 	bool "sconeserver"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# pthread_setschedprio needs NPTL
+	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
+	# no NPTL for these archs
+	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
 	select BR2_PACKAGE_PCRE
 	help
 	  Sconeserver is a modular, object-orientated and extremely versatile
@@ -99,3 +103,5 @@ endif # BR2_PACKAGE_SCONESERVER
 
 comment "sconeserver needs a toolchain w/ C++, threads"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
+	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
