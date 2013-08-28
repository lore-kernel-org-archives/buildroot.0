From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Aug 2013 13:44:55 +0200
Subject: [Buildroot] [git commit] sunxi-mali: bug fixes for pc and init
	script
Message-ID: <20130828121316.3C1159B5D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e1f853211fe0c0da4d7c07b587b0f7cb2909fea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fix bad escape sequences in init script and add correct lib for pc file.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sunxi-mali/S80mali   |    2 +-
 package/sunxi-mali/glesv2.pc |    2 +-
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
 
