From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  1 Apr 2014 00:00:00 +0200
Subject: [Buildroot] [PATCH 4/6] package/vlc: depends on the virtual package
	libgl
In-Reply-To: <cover.1396302677.git.yann.morin.1998@free.fr>
References: <cover.1396302677.git.yann.morin.1998@free.fr>
Message-ID: <44a8749bc3ef2c283fa679da79efd8764e482682.1396302677.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, vlc depends on mesa3d to provide the openGL support.

We now have a virtual package, libgl, which ensures openGL is available.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
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
