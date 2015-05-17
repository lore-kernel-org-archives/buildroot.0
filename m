From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 May 2015 21:15:28 +0200
Subject: [Buildroot] [git commit] libuv: not available for static only builds
Message-ID: <20150517191636.598C781776@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5eff8b850c6031e74e51461f00012ae9de9bdea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/031/031c2c005f4946af5012be7432b55d11ca891d60/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuv/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libuv/Config.in b/package/libuv/Config.in
index 66cd3f2..26cb97e 100644
--- a/package/libuv/Config.in
+++ b/package/libuv/Config.in
@@ -2,12 +2,13 @@ config BR2_PACKAGE_LIBUV
 	bool "libuv"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
 	help
 	  libuv is a multi-platform support library with a focus
 	  on asynchronous I/O.
 
 	  https://github.com/libuv/libuv
 
-comment "libuv needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libuv needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
