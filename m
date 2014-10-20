From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Oct 2014 11:09:10 +0200
Subject: [Buildroot] [git commit] ffmpeg: remove dangling reference to
	BR2_arm10
Message-ID: <20141020091130.254B3B0013@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=adaf895e2bbb46a21002c5c33f73531766037eb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_arm10 has been removed in commit
d60489a6e5e733a20d18b128646088981da57867 ("arch: remove BR2_arm10t"),
so there is no point in keeping a reference to it in the ffmpeg
package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 166b5ce..21ec1c9 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -285,7 +285,7 @@ FFMPEG_CONF_OPTS += --enable-armv6
 else
 FFMPEG_CONF_OPTS += --disable-armv6 --disable-armv6t2
 endif
-ifeq ($(BR2_arm10)$(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s)$(BR2_cortex_a5)$(BR2_cortex_a8)$(BR2_cortex_a9)$(BR2_cortex_a15),y)
+ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s)$(BR2_cortex_a5)$(BR2_cortex_a8)$(BR2_cortex_a9)$(BR2_cortex_a15),y)
 FFMPEG_CONF_OPTS += --enable-vfp
 else
 FFMPEG_CONF_OPTS += --disable-vfp
