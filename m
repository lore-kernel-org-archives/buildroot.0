From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 00:28:00 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] package/mplayer: add
	optional support for pulseaudio
Message-ID: <20170313233002.D21787FDC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ddd530004229e032dda14c64db629b862b27fa3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit a085b7c3139b2c4543530fb0adf0047d8a4c1fd3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mplayer/mplayer.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 07307ce..8288dcb 100644
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
