From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 17 Jan 2014 09:39:38 +0200
Subject: [Buildroot] [PATCH] sconeserver: needs NPTL
Message-ID: <323ae6b31cfac5eb77c3f9350671a2a468713e7d.1389944378.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/fb8/fb8d071411b571780806792b7436d20f62a9a0f7/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/sconeserver/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index b8755c618495..839c1111cf45 100644
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
-- 
1.8.5.2
