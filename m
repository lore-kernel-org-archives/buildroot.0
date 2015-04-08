From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 22:59:25 +0200
Subject: [Buildroot] [git commit] package/mplayer: add optional lzo support
Message-ID: <20150408212257.C0D4E80797@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a12927a85cc9b72dc395a7a003030993a9980ddf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 14e8c77..c8f4dd3 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -159,6 +159,13 @@ else
 MPLAYER_CONF_OPTS += --disable-gif
 endif
 
+ifeq ($(BR2_PACKAGE_LZO),y)
+MPLAYER_DEPENDENCIES += lzo
+MPLAYER_CONF_OPTS += --enable-liblzo
+else
+MPLAYER_CONF_OPTS += --disable-liblzo
+endif
+
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBTHEORA),libtheora)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_JPEG),jpeg)
