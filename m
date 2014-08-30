From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Aug 2014 00:03:16 +0200
Subject: [Buildroot] [git commit] package/mesa3d: fix comment about i965 DRI
	driver
Message-ID: <20140830220339.63FD79D59A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=172e62be9845fa8c5f92b524cef1c92ef6444c4c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The help entry for the i965 DRI driver states that it supports alll
Intel GPUs. That's not true, as at least the i915 series is not handled
by this driver, but by a separate one.

Fix the help text accordingly; remove the useless second part of the
help text (which does not mean much for Buildroot.)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index c1be9e3..57d3c1f 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -81,7 +81,7 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM_INTEL
 	help
-	  Supports all Intel GPUs.  This version is most supported by Intel.
+	  Support for i965-based Intel GPUs.
 
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	bool "DRI radeon driver"
