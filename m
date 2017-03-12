From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Mar 2017 12:44:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/mplayer: add optional support for
	pulseaudio
Message-ID: <20170312114457.19813-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/mplayer.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 07307cede..8288dcb1e 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -224,6 +224,12 @@ else
 MPLAYER_CONF_OPTS += --disable-gif
 endif
 
+# We intentionally don't pass --enable-pulse, to let the
+# autodetection find which library to link with.
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+MPLAYER_DEPENDENCIES += pulseaudio
+endif
+
 # We intentionally don't pass --enable-librtmp to let autodetection
 # find which library to link with.
 ifeq ($(BR2_PACKAGE_RTMPDUMP),y)
-- 
2.11.0
