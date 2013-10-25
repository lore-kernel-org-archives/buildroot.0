From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2013 09:28:11 +0200
Subject: [Buildroot] [git commit] xdriver_xf86-video-geode: only build on
	i386
Message-ID: <20131025073058.260819BB82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fba37e839106999a4052cfdb269f9d448fe962fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package builds with -m32. In buildroot, we don't have multilib
support so only the 64-bit libraries are available, which can't be
linked against these 32-bit object files.

I've tested this with the Sourcery and buildroot toolchains - neither
works.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xdriver_xf86-video-geode/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
