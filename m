From: Nicolas Robin <nrosfs@gmail.com>
Date: Fri, 15 May 2020 19:53:57 +0200
Subject: [Buildroot] [PATCH 3/3] package/sdl2: enable 3DNOW only if it's
 supported by the target
In-Reply-To: <20200515175357.45954-1-nrosfs@gmail.com>
References: <20200515175357.45954-1-nrosfs@gmail.com>
Message-ID: <20200515175357.45954-3-nrosfs@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Robin <nrosfs@gmail.com>
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
-- 
2.24.0
