From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 22:09:02 +0100
Subject: [Buildroot] [PATCH v2 4/6] sconeserver: use
	BR2_TOOLCHAIN_HAS_THREADS_NPTL
In-Reply-To: <1392757744-29984-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392757744-29984-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392757744-29984-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sconeserver/Config.in | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

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
-- 
1.8.3.2
