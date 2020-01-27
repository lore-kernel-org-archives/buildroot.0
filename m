From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 27 Jan 2020 19:54:13 +0100
Subject: [Buildroot] [PATCH 2/2] package/kodi-visualisation-goom: fix build
 with gcc-4.9
In-Reply-To: <20200127185413.1760-1-bernd.kuhls@t-online.de>
References: <20200127185413.1760-1-bernd.kuhls@t-online.de>
Message-ID: <20200127185413.1760-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build error:

output/build/kodi-visualisation-goom-2.1.0-Leia/lib/goom/src/lines.c:
In function 'goom_lines_draw':
output/build/kodi-visualisation-goom-2.1.0-Leia/lib/goom/src/lines.c:232:3:
error: 'for' loop initial declarations are only allowed in C99 or C11 mode
   for (int i = 1; i < AUDIO_SAMPLE_LEN; i++) {

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-visualisation-goom/kodi-visualisation-goom.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index d742e00e5a..0184d8474c 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -11,4 +11,7 @@ KODI_VISUALISATION_GOOM_LICENSE_FILES = src/Main.cpp
 
 KODI_VISUALISATION_GOOM_DEPENDENCIES = glm kodi
 
+KODI_VISUALISATION_GOOM_CONF_OPTS += \
+	-DCMAKE_C_FLAGS="-std=c11"
+
 $(eval $(cmake-package))
-- 
2.20.1
