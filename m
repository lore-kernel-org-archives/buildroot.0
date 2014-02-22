From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Feb 2014 23:40:44 +0100
Subject: [Buildroot] [git commit branch/next] sconeserver: use
	BR2_TOOLCHAIN_HAS_THREADS_NPTL
Message-ID: <20140222224511.96962826F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0c28e36a2b2cb48943bde5dfe6fe69606c2f5166
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sconeserver/Config.in |   12 +++---------
 1 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index ccb9c00..76c3d91 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -1,11 +1,7 @@
 menuconfig BR2_PACKAGE_SCONESERVER
 	bool "sconeserver"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# pthread_setschedprio needs NPTL
-	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
-	# no NPTL for these archs
-	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_PCRE
 	help
 	  Sconeserver is a modular, object-orientated and extremely versatile
@@ -102,7 +98,5 @@ comment "ui module requires X.org"
 
 endif # BR2_PACKAGE_SCONESERVER
 
-comment "sconeserver needs a toolchain w/ C++, threads"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
-	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
-	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
+comment "sconeserver needs a toolchain w/ C++, NPTL"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
