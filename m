From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 23:00:44 +0200
Subject: [Buildroot] [git commit] package/mplayer: add optional speex support
Message-ID: <20150408212257.DC7F980406@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87a292b62dea4602c4c664ee49629116889cfade
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 412837d..5e29551 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -174,6 +174,13 @@ else
 MPLAYER_CONF_OPTS += --disable-librtmp
 endif
 
+ifeq ($(BR2_PACKAGE_SPEEX),y)
+MPLAYER_DEPENDENCIES += speex
+MPLAYER_CONF_OPTS += --enable-speex
+else
+MPLAYER_CONF_OPTS += --disable-speex
+endif
+
 ifeq ($(BR2_PACKAGE_LZO),y)
 MPLAYER_DEPENDENCIES += lzo
 MPLAYER_CONF_OPTS += --enable-liblzo
