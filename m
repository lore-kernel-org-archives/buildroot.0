From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 18:19:11 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/sdl2: enable
 3DNOW only if it's supported by the target
Message-ID: <20200716161637.E57BE876AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fd337ec22c40534814772d8290fb468fd6ee8e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Signed-off-by: Nicolas Robin <nrosfs@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fe29913fa96d2265ecf91e259f334dbdd67f92fb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2/sdl2.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 4a287b66a3..830873c9e4 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -36,6 +36,12 @@ else
 SDL2_CONF_OPTS += --disable-sse
 endif
 
+ifeq ($(BR2_X86_CPU_HAS_3DNOW),y)
+SDL2_CONF_OPTS += --enable-3dnow
+else
+SDL2_CONF_OPTS += --disable-3dnow
+endif
+
 ifeq ($(BR2_PACKAGE_SDL2_DIRECTFB),y)
 SDL2_DEPENDENCIES += directfb
 SDL2_CONF_OPTS += --enable-video-directfb
