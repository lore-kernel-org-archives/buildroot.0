From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Thu, 17 Sep 2015 17:46:33 +0300
Subject: [Buildroot] [PATCH 2/2] Add dependency on gzip to lxc for runtime
In-Reply-To: <1442501193-6059-1-git-send-email-yba@tkos.co.il>
References: <1442501193-6059-1-git-send-email-yba@tkos.co.il>
Message-ID: <1442501193-6059-2-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

lxc executables such as lxc-checkconfig require scripts provided by
gzip such as zgrep.

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/lxc/Config.in |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index ffd9b4a..e774eee 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_LXC
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
+	depends on BR2_PACKAGE_GZIP
 	help
 	  Linux Containers (LXC), provides the ability to group and isolate
 	  of a set of processes in a jail by virtualizing and accounting the
@@ -16,10 +17,11 @@ config BR2_PACKAGE_LXC
 
 	  https://linuxcontainers.org/
 
-comment "lxc needs a toolchain w/ threads, headers >= 3.0, dynamic library"
+comment "lxc needs gzip, toolchain w/ threads, headers >= 3.0, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS \
+		|| !BR2_PACKAGE_GZIP
-- 
1.7.9.5
