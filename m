From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 29 Aug 2013 11:29:33 +0200
Subject: [Buildroot] [PATCH] mesa3d: fix download URL
Message-ID: <1377768573-7488-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The MesaLib 7.10.3 tarball has been moved on ftp.freedesktop.org from
pub/mesa/7.10.3/ to pub/mesa/old_versions/7.x/7.10.3/.
A bump to a newer release is only coming after Buildroot 2013.08, so for now
let us just change URL to let the download work properly.

Reported-by: Ryan Wilkins <ryan@deadfrog.net>
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/x11r7/mesa3d/mesa3d.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
 
-- 
1.8.1.2
