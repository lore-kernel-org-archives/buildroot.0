From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Nov 2020 22:25:19 +0100
Subject: [Buildroot] [PATCH v1] package/libcamera: fix
 BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS handling
Message-ID: <20201117212519.7559-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS handling, change from
'depends on BR2_m68k' to 'depends on !BR2_m68k'.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libcamera/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index aadea56d19..b9c243084e 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	bool
 	default y
 	# Invalid packing size of ControlValue struct on m68k
-	depends on BR2_m68k
+	depends on !BR2_m68k
 
 menuconfig BR2_PACKAGE_LIBCAMERA
 	bool "libcamera"
-- 
2.29.2
