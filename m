From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Feb 2014 16:41:24 +0100
Subject: [Buildroot] [git commit] vlc: fix glx support
Message-ID: <20140209154256.AE8209C8FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b79dfc94ec68ef8b66c5f505fe1a08ef378ac64
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

glx support is provided by the mesa3d package; so, enable it only when
mesa3d is part of the package selection.

Fixes:
  http://autobuild.buildroot.org/results/9b4/9b46021ea0064850ce8f1adcb5455d6da5bff459/build-end.log

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 2730f07..fd49040 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -101,6 +101,13 @@ else
 VLC_CONF_OPT += --disable-flac
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D),y)
+VLC_CONF_OPT += --enable-glx
+VLC_DEPENDENCIES += mesa3d
+else
+VLC_CONF_OPT += --disable-glx
+endif
+
 ifeq ($(BR2_PACKAGE_OPUS),y)
 VLC_CONF_OPT += --enable-opus
 VLC_DEPENDENCIES += opus
