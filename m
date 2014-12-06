From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  6 Dec 2014 14:15:38 +0100
Subject: [Buildroot] [PATCH 2/2] package/libnss: need dynamic library support
In-Reply-To: <1417871738-13421-1-git-send-email-s.martin49@gmail.com>
References: <1417871738-13421-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1417871738-13421-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/e01733c4b8c23f62e2081f0c4aadc16e22c4a2c4/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/libnss/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index 690f928..d57c7a2 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBNSS
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  Network Security Services (NSS) is a set of libraries designed
 	  to support development of security-enabled client and server
@@ -15,6 +16,7 @@ config BR2_PACKAGE_LIBNSS
 
 	  http://www.mozilla.org/projects/security/pki/nss/
 
-comment "libnss needs a toolchain w/ largefile, threads"
+comment "libnss needs a toolchain w/ largefile, threads, dynamic librairy"
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS \
+		BR2_PREFER_STATIC_LIB
-- 
2.1.3
