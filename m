From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Apr 2017 10:35:11 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: use
	BR2_TOOLCHAIN_HAS_LIBATOMIC
Message-ID: <20170416084136.4CF1681898@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc8798197b57488a852e2c14b4677b5eb0114a0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/69d/69d33792f2e7ec62bfe593eb4bbc8fb2652d7011/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index adc0f5d..10e4e74 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -452,6 +452,11 @@ else
 FFMPEG_CONF_OPTS += --disable-altivec
 endif
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+FFMPEG_CONF_OPTS += --extra-libs=-latomic
+endif
+
 ifeq ($(BR2_STATIC_LIBS),)
 FFMPEG_CONF_OPTS += --enable-pic
 else
