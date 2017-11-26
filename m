From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 21:26:08 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] package/libplist: needs
 threads
Message-ID: <20171126213855.65DB87FAD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c467f422b7c3e717a3878b132865d47bec76eed0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Upstream added a mandatory pthread check:
https://github.com/libimobiledevice/libplist/commit/eec2e855b4f192cb1808d1f02b6bc8935a979025

Fixes
http://autobuild.buildroot.net/results/863/863bb43db222f8e63d60b1fc4a53299575727de1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dbd9915caa884073e4a644086a5783fb687d76f0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libplist/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libplist/Config.in b/package/libplist/Config.in
index 4a9575f..5a246b4 100644
--- a/package/libplist/Config.in
+++ b/package/libplist/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_LIBPLIST
 	bool "libplist"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  libplist is a client for manipulating Apple Property List
 	  (.plist) files
 
 	  http://www.libimobiledevice.org/
 
-comment "libplist needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "libplist needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
