From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 May 2014 23:27:25 +0200
Subject: [Buildroot] [git commit] fluxbox: uses fork(),
	not available on noMMU platforms
Message-ID: <20140517213137.2D1539CC59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad7ea9452034f04c9eb1d25b2da1d1a564869ac3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fluxbox uses the fork() system call, not available on noMMU
platforms. It's also fairly unlikely to have to use a full-blown
X.org window manager on such platforms.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fluxbox/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/fluxbox/Config.in b/package/fluxbox/Config.in
index cb4d76f..ab479a9 100644
--- a/package/fluxbox/Config.in
+++ b/package/fluxbox/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_FLUXBOX
 	bool "fluxbox"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
 	# Runtime dependency, needed by startup script
 	select BR2_PACKAGE_XAPP_XMODMAP
@@ -11,4 +12,5 @@ config BR2_PACKAGE_FLUXBOX
 	  http://fluxbox.org
 
 comment "fluxbox needs a toolchain w/ C++"
+	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7 && !BR2_INSTALL_LIBSTDCPP
