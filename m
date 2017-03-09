From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Mar 2017 22:49:54 +0100
Subject: [Buildroot] [git commit] libplayer: add back missing endif
Message-ID: <20170309215101.D74A981D36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72599de9fab4e7ed18c75bb3487797dd1b21f36b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 0f5b3d0fd81 (libplayer: remove broken Python bindings) accidently
removed an endif from Config.in, breaking menuconfig.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libplayer/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index 89809eb..1261c1e 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_LIBPLAYER_GSTREAMER
 comment "gstreamer backend needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+endif
 
 comment "libplayer needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
