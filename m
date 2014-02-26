From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2014 13:17:44 +0100
Subject: [Buildroot] [git commit] vlc: needs toolchain with c++ support
Message-ID: <20140226121827.51A339BAE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=666addf1bc14d793cc279f77f89b1fba84496f12
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index 9c9d028..ec1daf4 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -6,6 +6,7 @@ endif
 config BR2_PACKAGE_VLC
 	bool "vlc"
 	depends on (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC) # spawn.h
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -16,5 +17,5 @@ config BR2_PACKAGE_VLC
 
 	  http://www.videolan.org/vlc/
 
-comment "vlc needs a uclibc snapshot or (e)glibc toolchain w/ largefile, wchar, threads"
-	depends on !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC) || !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+comment "vlc needs a uclibc snapshot or (e)glibc toolchain w/ C++, largefile, wchar, threads"
+	depends on !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC) || !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
