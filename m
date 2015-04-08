From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 23:00:34 +0200
Subject: [Buildroot] [git commit] package/mplayer: add optional rtmpdump
	support
Message-ID: <20150408212257.D2A3180406@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ae0eb1cc86e68b987ba2c33aa4f069af1493ec0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 46bc2b0..412837d 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -166,6 +166,14 @@ else
 MPLAYER_CONF_OPTS += --disable-gif
 endif
 
+# We intentionally don't pass --enable-librtmp to let autodetection
+# find which library to link with.
+ifeq ($(BR2_PACKAGE_RTMPDUMP),y)
+MPLAYER_DEPENDENCIES += rtmpdump
+else
+MPLAYER_CONF_OPTS += --disable-librtmp
+endif
+
 ifeq ($(BR2_PACKAGE_LZO),y)
 MPLAYER_DEPENDENCIES += lzo
 MPLAYER_CONF_OPTS += --enable-liblzo
