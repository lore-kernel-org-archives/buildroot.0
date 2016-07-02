From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 Jul 2016 15:32:15 +0200
Subject: [Buildroot] [PATCH v4 3/7] package/ffmpeg: cosmetic change for the
	mips fpu option
In-Reply-To: <1467466339-19422-1-git-send-email-bernd.kuhls@t-online.de>
References: <1467466339-19422-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1467466339-19422-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v4: no changes
v3: no changes
v2: no changes

 package/ffmpeg/ffmpeg.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index a5511d4..08914b8 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -422,11 +422,9 @@ FFMPEG_CONF_OPTS += --enable-neon
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
2.8.1
