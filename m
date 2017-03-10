From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 10 Mar 2017 13:35:57 +0100
Subject: [Buildroot] [PATCH 2/3] configs: snps_archs38_vdk: use same headers
	as kernel
In-Reply-To: <20170310123558.22033-1-arnout@mind.be>
References: <20170310123558.22033-1-arnout@mind.be>
Message-ID: <20170310123558.22033-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of downloading a *different* version of the kernel for the
headers as for the headers itself, use the same one.
BR2_KERNEL_HEADERS_AS_KERNEL is the default, but we have to set the
custom version.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/snps_archs38_vdk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/snps_archs38_vdk_defconfig b/configs/snps_archs38_vdk_defconfig
index d13fcb2236..7cbd68ce14 100644
--- a/configs/snps_archs38_vdk_defconfig
+++ b/configs/snps_archs38_vdk_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 BR2_TARGET_ROOTFS_EXT2=y
 
 # Linux headers same as kernel, a 4.9 series
-BR2_KERNEL_HEADERS_4_9=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
-- 
2.11.0
