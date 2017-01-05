From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Date: Thu,  5 Jan 2017 10:45:18 +0100
Subject: [Buildroot] [PATCH] SDL2 depends on MMU (fork)
Message-ID: <1483609518-7756-1-git-send-email-guillaume.gardet@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes autobuilder failure http://autobuild.buildroot.net/results/2f7/2f738830bf98eb7284f99c11856a8694467b3daa

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
---
 package/sdl2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index b73611d..30d5c1a 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SDL2
 	bool "sdl2"
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_MMU # fork()
 	help
 	  Simple DirectMedia Layer 2 - SDL2 is a library that allows
 	  programs portable low level access to a video framebuffer,
-- 
1.8.4.5
