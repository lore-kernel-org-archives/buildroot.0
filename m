From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  4 Feb 2020 13:39:53 -0800
Subject: [Buildroot] [PATCH v15 2/5] package/qemu: do not support
 x86_steamroller or x86_core_avx2
In-Reply-To: <20200204213956.2124306-1-aduskett@gmail.com>
References: <20200204213956.2124306-1-aduskett@gmail.com>
Message-ID: <20200204213956.2124306-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These CPU's cause segfaults with qemu.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v15:
  - Add this patch to the series

 package/qemu/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index d6b4bf6dd4..ea9281c5fb 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -20,6 +20,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_sparc64
 	default y if BR2_xtensa
 	default y if BR2_x86_64
+	depends on !BR2_x86_steamroller && !BR2_x86_core_avx2
 	depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970
 
 config BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS
-- 
2.24.1
