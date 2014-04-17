From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 23:00:48 +0200
Subject: [Buildroot] [git commit] package/vlc: depends on the virtual
	package libgl
Message-ID: <20140417210125.6D2A39C846@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b12f0a059071d60d020b9fc259e8fd3d20b46f96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, vlc depends on mesa3d to provide the openGL support.

We now have a virtual package, libgl, which ensures openGL is available.

This is support for full OpenGL, which is only available when X.Org is
enabled, which is anyway a dependency of full OpenGL.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/vlc.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index bcb592c..e14c9c3 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -118,9 +118,9 @@ else
 VLC_CONF_OPT += --disable-flac
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 VLC_CONF_OPT += --enable-glx
-VLC_DEPENDENCIES += mesa3d
+VLC_DEPENDENCIES += libgl
 else
 VLC_CONF_OPT += --disable-glx
 endif
