From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 18 Mar 2018 15:01:27 -0400
Subject: [Buildroot] [PATCH v5 1/5] qemu-host: remove support for some
 powerpc processors.
In-Reply-To: <20180318190131.21404-1-aduskett@gmail.com>
References: <20180318190131.21404-1-aduskett@gmail.com>
Message-ID: <20180318190131.21404-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 620, 630, and 970 are not supported at this time by qemu.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v4:
  - Add patch to series.

Changes v4 -> v5:
 - Seperate this patch into it's own patch.

 package/qemu/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 78fe54a85c..bbc2aa27c5 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -6,6 +6,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 		BR2_mips64       || BR2_mips64el    || BR2_powerpc      || \
 		BR2_powerpc64    || BR2_powerpc64le || BR2_sh           || \
 		BR2_sparc        || BR2_x86_64
+		depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970
 
 config BR2_PACKAGE_HOST_QEMU
 	bool "host qemu"
-- 
2.14.3
