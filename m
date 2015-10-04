From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun,  4 Oct 2015 19:55:17 +0200
Subject: [Buildroot] [PATCH] portaudio: fix dependency on alsa-lib
Message-ID: <1443981317-26663-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_PORTAUDIO_ALSA is misspelled in one place, resulting in
alsa-lib not being listed in the dependencies.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/portaudio/portaudio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/portaudio/portaudio.mk b/package/portaudio/portaudio.mk
index 0cccd20..0353d65 100644
--- a/package/portaudio/portaudio.mk
+++ b/package/portaudio/portaudio.mk
@@ -13,7 +13,7 @@ PORTAUDIO_LICENSE = portaudio license (MIT-like plus special clause)
 PORTAUDIO_LICENSE_FILES = LICENSE.txt
 
 PORTAUDIO_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_PORTAUDIO_WITH_ALSA),alsa-lib)
+	$(if $(BR2_PACKAGE_PORTAUDIO_ALSA),alsa-lib)
 
 PORTAUDIO_CONF_OPTS = \
 	$(if $(BR2_PACKAGE_PORTAUDIO_ALSA),--with-alsa,--without-alsa) \
-- 
1.9.1
