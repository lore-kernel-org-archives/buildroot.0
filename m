From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 16 Jun 2016 10:37:58 +0300
Subject: [Buildroot] [PATCH] log4cpp: needs threads
Message-ID: <8fb36864db8c572ca0d74de960eddaf4fa652eba.1466062678.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/cf9/cf942e4b8a5259414a4dcea6fa4b75183435394a/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/log4cpp/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/log4cpp/Config.in b/package/log4cpp/Config.in
index 8bae7a5e8c50..090bf565f4ac 100755
--- a/package/log4cpp/Config.in
+++ b/package/log4cpp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LOG4CPP
 	bool "log4cpp"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Log4cpp is library of C++ classes for flexible logging to
 	  files, syslog, IDSA and other destinations.  It is modeled
@@ -9,5 +10,5 @@ config BR2_PACKAGE_LOG4CPP
 
 	  http://log4cpp.sourceforge.net/
 
-comment "log4cpp needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "log4cpp needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.8.1
