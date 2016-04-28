From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 28 Apr 2016 18:41:13 +0200
Subject: [Buildroot] [PATCH v3 3/7] package/ffmpeg: cosmetic change for the
	mips fpu option
In-Reply-To: <1461861677-22146-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461861677-22146-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1461861677-22146-4-git-send-email-bernd.kuhls@t-online.de>
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
index 6ada850..80f8e22 100644
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
