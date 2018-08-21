From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 11:47:16 +0200
Subject: [Buildroot] [git commit branch/next] lvm2: host variant needs
 host-libaio
Message-ID: <20180821093949.0D2458E180@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1575512ad41e2118448daf566a6012714592aca7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since the bump of lvm2 to 2.02.180 in commit
8e666bf29e762f3c7681a48d0ee350f8396d798f, lvm2 needs libaio. This was
properly taken into account for the target lvm2 variant, but not the
host lvm2 variant. This commit adds host-libaio as a dependency of
host-lvm2.

Fixes:

  http://autobuild.buildroot.net/results/f95dd353c17bdfd00fde6762e58aa32e6830b52b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lvm2/lvm2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 2352f17af0..152381d65d 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -59,7 +59,7 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 LVM2_CONF_ENV += ac_cv_flag_HAVE_PIE=no
 endif
 
-HOST_LVM2_DEPENDENCIES = host-pkgconf
+HOST_LVM2_DEPENDENCIES = host-pkgconf host-libaio
 HOST_LVM2_CONF_OPTS = \
 	--enable-write_install \
 	--enable-pkgconfig \
