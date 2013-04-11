From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 15:56:39 +0200
Subject: [Buildroot] [git commit] xdriver_xf86-video-geode: only available
	for i386 and x86_64
Message-ID: <20130411140826.8C1819B586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1413447256167c27364217a905ee2a4fce77df4f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Builtin-video from NSC/AMD Geode x86 processors.
Fixes build failures on other architectures.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xdriver_xf86-video-geode/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-geode/Config.in b/package/x11r7/xdriver_xf86-video-geode/Config.in
index 2d2e5bc..2b868d0 100644
--- a/package/x11r7/xdriver_xf86-video-geode/Config.in
+++ b/package/x11r7/xdriver_xf86-video-geode/Config.in
@@ -5,5 +5,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GEODE
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on (BR2_i386 || BR2_x86_64)
 	help
 	  video driver for geode device
