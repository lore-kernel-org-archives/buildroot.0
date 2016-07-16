From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 22:53:55 +0200
Subject: [Buildroot] [git commit] package/ti-gfx: list supported SoCs in
	Config.in help text
Message-ID: <20160716205406.9EE3C7FCC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97308d8e9ae0f096ec2df8275deb063266583b91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ti-gfx package supports a set of SGX implementations which are
used in some TI SoCs, newer parts are not supported by this package.
This patch adds a list of supported TI SoCs to the help text.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
[Thomas: update with the new name of packages: ti-sgx-{km,um}.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ti-gfx/Config.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index 39b0a93..6ec2f23 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -8,7 +8,12 @@ config BR2_PACKAGE_TI_GFX
 	select BR2_PACKAGE_FBSET if !BR2_PACKAGE_BUSYBOX # Runtime dependency only
 	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
 	help
-	  Graphics libraries for TI boards.
+	  Graphics libraries for TI boards using SGX acceleration.
+
+	  Supports OMAP35xx, DM37xx/AM37xx, DM816x, DM814x, AM335x and
+	  AM43xx.
+
+	  For newer CPUs or kernels use the ti-sgx-{km,um} packages.
 
 	  http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk/
 
