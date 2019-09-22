From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:37 +0200
Subject: [Buildroot] [PATCH 21/30] package/libselinux: re-enable on ARC
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-22-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build on ARC was disabled in commit
881845f5fcc7e30654a95ea8a21e574df60980d1 ("libselinux: mark as not
available on ARC") and since then the ARC toolchain support has made a
lot of progress. libselinux now builds fine on ARC, so we can
re-enable it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libselinux/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
index 8cebd34fb2..62070c8d59 100644
--- a/package/libselinux/Config.in
+++ b/package/libselinux/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_LIBSELINUX
 	bool "libselinux"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	# Toolchain issue: "fixup not contained within frag"
-	depends on !BR2_arc
 	select BR2_PACKAGE_LIBSEPOL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
@@ -19,5 +17,4 @@ config BR2_PACKAGE_LIBSELINUX
 	  http://selinuxproject.org/page/Main_Page
 
 comment "libselinux needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
2.21.0
