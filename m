From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 26 Sep 2013 18:21:45 -0500
Subject: [Buildroot] [PATCH v3 02/11] sunxi-mali: add explicit pthread/dl/rt
	dependencies
In-Reply-To: <1380237714-2470-1-git-send-email-spenser@gillilanding.com>
References: <1380237714-2470-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1380237714-2470-3-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fixes hard float with Linaro toolchain.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/sunxi-mali/egl.pc    |    2 +-
 package/sunxi-mali/glesv2.pc |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali/egl.pc b/package/sunxi-mali/egl.pc
index 56e3990..b0375dc 100644
--- a/package/sunxi-mali/egl.pc
+++ b/package/sunxi-mali/egl.pc
@@ -7,6 +7,6 @@ Name: egl
 Description: ARM Mali implementation of EGL
 Version: 1.4
 Requires:
-Libs: -L${libdir} -lEGL -lGLESv2 -lUMP
+Libs: -L${libdir} -lEGL -lGLESv2 -lUMP -lrt -lpthread
 Cflags: -I{includedir}/EGL/ -I${includedir}
 
diff --git a/package/sunxi-mali/glesv2.pc b/package/sunxi-mali/glesv2.pc
index 9273678..b34bf72 100644
--- a/package/sunxi-mali/glesv2.pc
+++ b/package/sunxi-mali/glesv2.pc
@@ -7,6 +7,6 @@ Name: glesv2
 Description: ARM Mali implementation of OpenGL ESv2
 Version: 2.0
 Requires:
-Libs: -L${libdir} -lGLESv2 -lGLESv1_CM -lUMP
+Libs: -L${libdir} -lGLESv2 -lGLESv1_CM -lUMP -ldl -lrt -lpthread
 Cflags: -I${includedir}/GLES2
 
-- 
1.7.1
