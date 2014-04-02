From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  2 Apr 2014 21:46:33 +0200
Subject: [Buildroot] [PATCH v2 19/41] DO NOT COMMIT package/vlc: depends on
	the virtual package libgl
In-Reply-To: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396468015-1724-19-git-send-email-bernd.kuhls@t-online.de>
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
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk |    4 ++--
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
1.7.10.4
