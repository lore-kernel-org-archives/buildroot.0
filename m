From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  8 Feb 2014 15:34:50 +0100
Subject: [Buildroot] [PATCH v1 1/6] vlc: fix svg support
In-Reply-To: <1391870095-3738-1-git-send-email-s.martin49@gmail.com>
References: <1391870095-3738-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1391870095-3738-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In vlc, svg support is done using librsvg, not libsvg.

Fixes:
  http://autobuild.buildroot.org/results/344/344af6e756a5f2c1ee515a355ae5b288401c4c71/build-end.log
  http://autobuild.buildroot.org/results/19f/19f1450ed5453aa666bc7aae2e965ad81e5f845d/build-end.log

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/vlc/vlc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.8.5.4
