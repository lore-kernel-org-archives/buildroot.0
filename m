From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Oct 2012 18:58:24 +0200
Subject: [Buildroot] [PATCH] mesa3d: add dependency on host-xutil_makedepend
Message-ID: <1350061104-5523-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mesa3d now requires the makedepend host utility, otherwise, it
fails with:

configure: error: makedepend is required to build Mesa

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reported-by: Noel Vellemans <Noel.Vellemans@visionBMS.com>
---
 package/x11r7/mesa3d/mesa3d.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index 3c2635e..8d311e1 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -27,6 +27,7 @@ MESA3D_DEPENDENCIES = \
 	xlib_libXfixes \
 	xproto_dri2proto \
 	libdrm \
-	expat
+	expat \
+	host-xutil_makedepend
 
 $(eval $(autotools-package))
-- 
1.7.9.5
