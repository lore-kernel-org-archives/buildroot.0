From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 16:08:03 +0100
Subject: [Buildroot] [git commit] package/mplayer: add optional support for
	pulseaudio
Message-ID: <20170312203334.C916A81E95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a085b7c3139b2c4543530fb0adf0047d8a4c1fd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
