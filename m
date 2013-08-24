From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sat, 24 Aug 2013 14:41:57 -0500
Subject: [Buildroot] [PATCH 2/6] sunxi-mali: bug fixes for pc and init script
In-Reply-To: <1377373321-29732-1-git-send-email-spenser@gillilanding.com>
References: <1377373321-29732-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1377373321-29732-3-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fix bad escape sequences in init script and add correct lib for pc file.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/sunxi-mali/S80mali   | 2 +-
 package/sunxi-mali/glesv2.pc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali/S80mali b/package/sunxi-mali/S80mali
index 6f51cc4..ecfbab9 100644
--- a/package/sunxi-mali/S80mali
+++ b/package/sunxi-mali/S80mali
@@ -5,7 +5,7 @@ install_driver() {
 	OPTS=$2
 
 	modprobe $DRIVER $OPTS
-	maj=$(awk "$$2==\"${DRIVER}\" { print $$1; }" /proc/devices)
+	maj=$(awk "\$2==\"${DRIVER}\" { print \$1; }" /proc/devices)
 
 	rm -f /dev/${DRIVER}
 
diff --git a/package/sunxi-mali/glesv2.pc b/package/sunxi-mali/glesv2.pc
index 4e112ee..9273678 100644
--- a/package/sunxi-mali/glesv2.pc
+++ b/package/sunxi-mali/glesv2.pc
@@ -7,6 +7,6 @@ Name: glesv2
 Description: ARM Mali implementation of OpenGL ESv2
 Version: 2.0
 Requires:
-Libs: -L${libdir} -lGLESv2 -lGLES_CM -lUMP
+Libs: -L${libdir} -lGLESv2 -lGLESv1_CM -lUMP
 Cflags: -I${includedir}/GLES2
 
-- 
1.8.1.2
