From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Jul 2016 15:22:45 +0200
Subject: [Buildroot] [git commit] package/mesa3d: Fix udev dependency check
Message-ID: <20160710132255.AA63E7FB5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e685bcf460a9a61635805e4c072316d6bf3e93e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sorry for the typo ;)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9cce0ef..dcd43d5 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -38,7 +38,7 @@ MESA3D_DEPENDENCIES += libgcrypt
 MESA3D_CONF_OPTS += --with-sha1=libgcrypt
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 MESA3D_DEPENDENCIES += udev
 MESA3D_CONF_OPTS += --disable-sysfs
 else
