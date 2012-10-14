From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Oct 2012 20:15:10 +0200
Subject: [Buildroot] [git commit] mesa3d: add dependency on
	host-xutil_makedepend
Message-ID: <20121014182021.D5C1C9985F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8bd0a20b14ef3347ec2de9696ec0edddf6956726
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mesa3d now requires the makedepend host utility, otherwise, it
fails with:

configure: error: makedepend is required to build Mesa

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reported-by: Noel Vellemans <Noel.Vellemans@visionBMS.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/mesa3d/mesa3d.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
