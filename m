From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Apr 2014 18:04:25 +0200
Subject: [Buildroot] [PATCH 13/14] package/vlc: depends on the virtual
	package libgl
In-Reply-To: <cover.1397750571.git.yann.morin.1998@free.fr>
References: <cover.1397750571.git.yann.morin.1998@free.fr>
Message-ID: <cbcfca898ac3b32abbce57e78a2bc576251ed249.1397750571.git.yann.morin.1998@free.fr>
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
-- 
1.8.3.2
