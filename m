From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2020 23:13:32 +0100
Subject: [Buildroot] [git commit] package/kodi-visualisation-goom: fix build
 with gcc-4.9
Message-ID: <20200128220311.C385D83DDE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f36b03e25c3572c4dc6c267610bc808b2f1e965c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build error:

output/build/kodi-visualisation-goom-2.1.0-Leia/lib/goom/src/lines.c:
In function 'goom_lines_draw':
output/build/kodi-visualisation-goom-2.1.0-Leia/lib/goom/src/lines.c:232:3:
error: 'for' loop initial declarations are only allowed in C99 or C11 mode
   for (int i = 1; i < AUDIO_SAMPLE_LEN; i++) {

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
