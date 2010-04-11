From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Apr 2010 21:10:35 +0200
Subject: [Buildroot] [git commit master] Move the global config cache option
	to an Advanced submenu
Message-ID: <20100411195036.4518520B98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bc59823bd553c7422170d0d20c83d394c9581aea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in |   20 ++++++++++++--------
 1 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/Config.in b/Config.in
index 1d08de7..78e6666 100644
--- a/Config.in
+++ b/Config.in
@@ -151,14 +151,6 @@ config BR2_RECENT
 	help
 	  This option show recent versions of packages.
 
-config BR2_CONFIG_CACHE
-	bool "Use a central configure cache file"
-	default y
-	help
-	  This determines if a central config cache is used by
-	  packages, reducing the configure time for packages as each
-	  one caches its findings.
-
 config BR2_ENABLE_DEBUG
 	bool "build packages with debugging symbols"
 	select BR2_PACKAGE_GDB_SERVER
@@ -318,6 +310,18 @@ config BR2_HAVE_DEVFILES
 	  Install headers and static libraries in the
 	  target filesystem
 
+menu "Advanced"
+
+config BR2_CONFIG_CACHE
+	bool "Use a central configure cache file"
+	default y
+	help
+	  This determines if a central config cache is used by
+	  packages, reducing the configure time for packages as each
+	  one caches its findings.
+
+endmenu
+
 endmenu
 
 source "toolchain/Config.in"
-- 
1.6.3.3
