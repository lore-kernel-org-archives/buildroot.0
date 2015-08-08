From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Aug 2015 10:56:14 -0000
Subject: [Buildroot] [git commit branch/next] fio: disable for static build
Message-ID: <20150808105601.DA193818F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c636687f71f16cac6b55b8e073527a7a647285b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/275/275dc359d72513fd567b7ccbbd4061dffd8a5266/
http://autobuild.buildroot.net/results/5e8/5e8cc28da6a17dcb142eb6d8a8cada735b211e2e/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fio/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/fio/Config.in b/package/fio/Config.in
index 75af6a7..b1f9045 100644
--- a/package/fio/Config.in
+++ b/package/fio/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FIO
 	bool "fio"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# fio uses posix_madvise(), which is not part of any official
 	# release of uClibc, but is part of uClibc Git, and backported
@@ -17,7 +18,7 @@ config BR2_PACKAGE_FIO
 
 	  http://git.kernel.dk/?p=fio.git;a=summary
 
-comment "fio needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "fio needs a toolchain w/ dynamic library, threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on !BR2_nios2
 	depends on BR2_USE_MMU
