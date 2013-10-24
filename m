From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 25 Oct 2013 00:50:55 +0200
Subject: [Buildroot] [PATCH] xdriver_xf86-video-geode: only build on i386
Message-ID: <1382655055-3520-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package builds with -m32. In buildroot, we don't have multilib
support so only the 64-bit libraries are available, which can't be
linked against these 32-bit object files.

I've tested this with the Sourcery and buildroot toolchains - neither
works.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xdriver_xf86-video-geode/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-geode/Config.in b/package/x11r7/xdriver_xf86-video-geode/Config.in
index 2b868d0..0b45fb1 100644
--- a/package/x11r7/xdriver_xf86-video-geode/Config.in
+++ b/package/x11r7/xdriver_xf86-video-geode/Config.in
@@ -5,6 +5,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GEODE
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
-	depends on (BR2_i386 || BR2_x86_64)
+	depends on BR2_i386
 	help
 	  video driver for geode device
-- 
1.8.4.rc3
