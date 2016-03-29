From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 30 Mar 2016 00:17:16 +0200
Subject: [Buildroot] [PATCH 3/6] package/ffmpeg: cosmetic change for the
	mips fpu option
In-Reply-To: <1459289839-6230-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459289839-6230-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1459289839-6230-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 26633e4..49fc0d9 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -429,11 +429,9 @@ FFMPEG_CONF_OPTS += --enable-neon
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
 
 ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
-- 
2.8.0.rc3
