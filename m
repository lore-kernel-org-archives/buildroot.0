From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Date: Wed, 30 Dec 2015 15:45:55 +0100
Subject: [Buildroot] [v2 2/2] vlc: add support for libdvbpsi
In-Reply-To: <1451486755-7314-1-git-send-email-pieterjan.camerlynck@gmail.com>
References: <1451482256-11816-1-git-send-email-pieterjan.camerlynck@gmail.com>
 <1451486755-7314-1-git-send-email-pieterjan.camerlynck@gmail.com>
Message-ID: <1451486755-7314-2-git-send-email-pieterjan.camerlynck@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index ca1f09c..ee21c16 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -179,6 +179,13 @@ else
 VLC_CONF_OPTS += --disable-libass
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDVBPSI),y)
+VLC_CONF_OPTS += --enable-dvbpsi
+VLC_DEPENDENCIES += libdvbpsi
+else
+VLC_CONF_OPTS += --disable-dvbpsi
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 VLC_CONF_OPTS += --enable-libgcrypt
 VLC_DEPENDENCIES += libgcrypt
-- 
1.9.1
