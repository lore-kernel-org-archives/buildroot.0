From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2014 22:02:59 +0100
Subject: [Buildroot] [git commit] vlc: fix svg support
Message-ID: <20140208212129.B5E7C9C5AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d58ca1b4833138d67f7eec2a9fd395240c79fab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In vlc, svg support is done using librsvg, not libsvg.

Fixes:
  http://autobuild.buildroot.org/results/344/344af6e756a5f2c1ee515a355ae5b288401c4c71/build-end.log
  http://autobuild.buildroot.org/results/19f/19f1450ed5453aa666bc7aae2e965ad81e5f845d/build-end.log

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index b39c6c7..5c10275 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -141,9 +141,9 @@ else
 VLC_CONF_OPT += --disable-png
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSVG),y)
+ifeq ($(BR2_PACKAGE_LIBRSVG),y)
 VLC_CONF_OPT += --enable-svg
-VLC_DEPENDENCIES += libsvg
+VLC_DEPENDENCIES += librsvg
 else
 VLC_CONF_OPT += --disable-svg
 endif
