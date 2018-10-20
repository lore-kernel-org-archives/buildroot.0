From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 17:29:13 +0200
Subject: [Buildroot] [git commit] package/mesa3d: disable opencl
Message-ID: <20181020153406.A9B1A8409D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=826b57a17064c18a7fe2b805ea689f171603e7f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Preliminary patch to prevent Mesa from building OpenCL lib as
soon as libclc is available.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
Acked-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/mesa3d.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 82a66b6d9b..0d67dcbf1c 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -43,6 +43,9 @@ else
 MESA3D_CONF_OPTS += --disable-llvm
 endif
 
+# Disable opencl in case libclc is detected
+MESA3D_CONF_OPTS += --disable-opencl
+
 ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS),y)
 MESA3D_DEPENDENCIES += elfutils
 endif
