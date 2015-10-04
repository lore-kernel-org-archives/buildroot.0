From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 18:58:56 +0100
Subject: [Buildroot] [git commit] portaudio: fix dependency on alsa-lib
Message-ID: <20151004180127.E2532818C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd47f22bc09b46380c25ccf31abff4167b48831e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_PORTAUDIO_ALSA is misspelled in one place, resulting in
alsa-lib not being listed in the dependencies.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/portaudio/portaudio.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
