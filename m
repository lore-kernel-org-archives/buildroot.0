From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:34:06 +0200
Subject: [Buildroot] [git commit] package/mediastreamer: add another
 optional dependency to speexdsp
Message-ID: <20180617123156.6C156886BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b08b9490a1f766f111c974b90228dda0d9cdff24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/b21/b2104c491f0898981c652043161c52ac6c43110f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mediastreamer/mediastreamer.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index d3b70f4ca9..3c9756936a 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -60,7 +60,7 @@ else
 MEDIASTREAMER_CONF_OPTS += --disable-pulseaudio
 endif
 
-ifeq ($(BR2_PACKAGE_SPEEX),y)
+ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
 MEDIASTREAMER_CONF_OPTS += --enable-speex
 MEDIASTREAMER_DEPENDENCIES += speex
 else
