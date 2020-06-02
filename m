From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 02 Jun 2020 20:01:51 -0000
Subject: [Buildroot] [git commit] package/sdl2: enable 3DNOW only if it's
 supported by the target
Message-ID: <20200602200120.638C68256A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe29913fa96d2265ecf91e259f334dbdd67f92fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nicolas Robin <nrosfs@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
