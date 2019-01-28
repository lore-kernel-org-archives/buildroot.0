From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 22:05:15 +0100
Subject: [Buildroot] [git commit] clamav: needs C++
Message-ID: <20190128210844.6758A81062@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d85d5038ec0a7fb127cd58a48dfd7113c9c22c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

clamav needs C++ since bump to version 0.101.1 and
https://github.com/Cisco-Talos/clamav-devel/commit/d39cb6581f3c854476044f069d2393fc44702c36

Fixes:
 - http://autobuild.buildroot.org/results/be14aa571309cda32a5963feed9fd7f220e87fe6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index bc934ea452..56bf0af38c 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CLAMAV
 	bool "clamav"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBTOOL
@@ -11,6 +12,6 @@ config BR2_PACKAGE_CLAMAV
 
 	  http://www.clamav.net
 
-comment "clamav needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "clamav needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
