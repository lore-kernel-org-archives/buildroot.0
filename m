From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Aug 2013 12:15:17 +0200
Subject: [Buildroot] [git commit] mesa3d: fix download URL
Message-ID: <20130829102210.5907A9B5E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a831a0e06521298eaea3d8862eebd022d7915de0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The MesaLib 7.10.3 tarball has been moved on ftp.freedesktop.org from
pub/mesa/7.10.3/ to pub/mesa/old_versions/7.x/7.10.3/.
A bump to a newer release is only coming after Buildroot 2013.08, so for now
let us just change URL to let the download work properly.

Reported-by: Ryan Wilkins <ryan@deadfrog.net>
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/mesa3d/mesa3d.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index f9d35a9..d4080d4 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -6,7 +6,7 @@
 
 MESA3D_VERSION = 7.10.3
 MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.gz
-MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
+MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/older-versions/7.x/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
 MESA3D_LICENSE_FILES = docs/license.html
 
