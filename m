From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Oct 2013 17:04:18 +0200
Subject: [Buildroot] [git commit] icu: needs threads
Message-ID: <20131008150944.3A6359B98D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2bdef657583567cf6e832cc083a014f138596f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/ae7/ae721db2dd4e764a2af3825c388a63cad9720ebe/

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/icu/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/icu/Config.in b/package/icu/Config.in
index 21f5c2f..3dd16b7 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -2,10 +2,12 @@ config BR2_PACKAGE_ICU
 	bool "icu"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  International Components for Unicode.
 
 	  http://site.icu-project.org/
 
-comment "icu requires a toolchain with C++ support and WCHAR enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "icu requires a toolchain with C++, WCHAR and threading support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
