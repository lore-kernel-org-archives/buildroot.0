From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Jul 2016 16:12:03 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: cosmetic change for the
	mips fpu option
Message-ID: <20160702141253.EDC07801B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9aee5570b4db1c0ba7807149674aa07c707bbf1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index a2026dc..d5396ad 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -430,11 +430,9 @@ FFMPEG_CONF_OPTS += --enable-neon
 endif
 
 ifeq ($(BR2_MIPS_SOFT_FLOAT),y)
-FFMPEG_CONF_OPTS += \
-	--disable-mipsfpu
+FFMPEG_CONF_OPTS += --disable-mipsfpu
 else
-FFMPEG_CONF_OPTS += \
-	--enable-mipsfpu
+FFMPEG_CONF_OPTS += --enable-mipsfpu
 endif
 
 ifeq ($(BR2_mips_32r2),y)
