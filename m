From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Nov 2020 19:37:56 +0100
Subject: [Buildroot] [git commit] package/libcamera: fix
 BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS handling
Message-ID: <20201119182502.B9C4D86D32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff60c4c533096f8fd69c31d9f57ed1daa596d08a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS handling, change from
'depends on BR2_m68k' to 'depends on !BR2_m68k'.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
