From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 18:10:54 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/sdl2: enable SSE
 only if it's supported by the target
Message-ID: <20200716161642.EA9A986303@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=add03d2fcf3050e8034e4e2c7ba5a13207a9899c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Nicolas Robin <nrosfs@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a14a9629837a4de32a7a06a2f7b0e88958948ce5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2/sdl2.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index e39c51d4d9..80238bd062 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -30,6 +30,12 @@ else
 SDL2_CONF_OPTS += --disable-libudev
 endif
 
+ifeq ($(BR2_X86_CPU_HAS_SSE),y)
+SDL2_CONF_OPTS += --enable-sse
+else
+SDL2_CONF_OPTS += --disable-sse
+endif
+
 ifeq ($(BR2_PACKAGE_SDL2_DIRECTFB),y)
 SDL2_DEPENDENCIES += directfb
 SDL2_CONF_OPTS += --enable-video-directfb
