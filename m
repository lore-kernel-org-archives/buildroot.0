From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 12 Jul 2016 10:26:22 +0200
Subject: [Buildroot] [PATCH 1/7] ti-gfx: config help text: list supported
	processors
In-Reply-To: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
References: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <1468311988-22059-2-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ti-gfx package supports a set of SGX implementations which are used in
some TI SoCs, newer parts are not supported by this package.
This patch adds a list of supported TI SoCs.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 package/ti-gfx/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index 39b0a93..e4a102f 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -8,7 +8,9 @@ config BR2_PACKAGE_TI_GFX
 	select BR2_PACKAGE_FBSET if !BR2_PACKAGE_BUSYBOX # Runtime dependency only
 	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
 	help
-	  Graphics libraries for TI boards.
+	  Graphics libraries for TI boards using SGX acceleration.
+	  Supports OMAP35xx, DM37xx/AM37xx, DM816x, DM814x, AM335x and AM43xx.
+	  For newer CPUs or kernels use the ti-sgx package.
 
 	  http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk/
 
-- 
1.9.1
