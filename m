From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 21:47:38 +0200
Subject: [Buildroot] [git commit branch/next] package/sdl2: enable SSE only
 if it's supported by the target
Message-ID: <20200515193151.7E0CB91950@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a14a9629837a4de32a7a06a2f7b0e88958948ce5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Nicolas Robin <nrosfs@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl2/sdl2.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 501bb4699d..4a287b66a3 100644
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
