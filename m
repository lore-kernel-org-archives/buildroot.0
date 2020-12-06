From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Dec 2020 23:25:19 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/libcamera: fix
 BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS handling
Message-ID: <20201206221100.C1EB4838D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72578f6ebb433626774ab25a02a05707e1c4fe43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fix BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS handling, change from
'depends on BR2_m68k' to 'depends on !BR2_m68k'.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ff60c4c533096f8fd69c31d9f57ed1daa596d08a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcamera/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 39741e4412..e2607032fa 100644
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
