From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 21:41:21 +0100
Subject: [Buildroot] [git commit] mesa3d: use positive logic for XA enabling
Message-ID: <20150202204228.0DFFA80109@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d538b8bf93f684b0ea00dc61dd4cb25394345971
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to commit 2dde40081c49852bac0ee9c723911761bd5fc91e
("package/mesa3d: Refactor XA support to prepare support for ATI
drivers"), we now have the blind option BR2_PACKAGE_MESA3D_NEEDS_XA
that indicates whether XA support is needed. This allows to switch to
use positive logic in the test for XA in mesa3d.mk, which this commit
does.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 4ff7e09..de647a6 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -36,7 +36,7 @@ MESA3D_DEPENDENCIES += \
 	libxcb
 MESA3D_CONF_OPTS += --enable-glx
 # quote from mesa3d configure "Building xa requires at least one non swrast gallium driver."
-ifneq ($(BR2_PACKAGE_MESA3D_NEEDS_XA),)
+ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_XA),y)
 MESA3D_CONF_OPTS += --enable-xa
 else
 MESA3D_CONF_OPTS += --disable-xa
