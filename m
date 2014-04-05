From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Apr 2014 14:10:17 +0200
Subject: [Buildroot] [PATCH 13/13] package/vlc: depends on the virtual
	package libgl
In-Reply-To: <cover.1396699629.git.yann.morin.1998@free.fr>
References: <cover.1396699629.git.yann.morin.1998@free.fr>
Message-ID: <55d8bed0fa397c30345e1ba8318eeeb76fac7a3a.1396699629.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, vlc depends on mesa3d to provide the openGL support.

We now have a virtual package, libgl, which ensures openGL is available.

This is support for full OpenGL, which is only available when X.Org is
enabled, which is anyway a dependency of full OpenGL.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>
---
 package/vlc/vlc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index a9ee620..f78f209 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -118,9 +118,9 @@ else
 VLC_CONF_OPT += --disable-flac
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D),y)
+ifeq ($(BR2_PACKAGE_HAS_OPENGL),y)
 VLC_CONF_OPT += --enable-glx
-VLC_DEPENDENCIES += mesa3d
+VLC_DEPENDENCIES += libgl
 else
 VLC_CONF_OPT += --disable-glx
 endif
-- 
1.8.3.2
