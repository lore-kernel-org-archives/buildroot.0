From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  4 Apr 2014 07:18:08 +0200
Subject: [Buildroot] [PATCH v5 2/8] mesa3d: Explain dependency for i965 DRI
	driver on xorg in Kconfig
In-Reply-To: <1396588694-6377-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396588694-6377-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396588694-6377-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index f3d855b..12ec068 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -77,6 +77,9 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
 	help
 	  Supports all Intel GPUs.  This version is most supported by Intel.
 
+comment "DRI i965 driver depends on X.org"
+	depends on !BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	bool "DRI radeon driver"
 	depends on BR2_i386 || BR2_x86_64
-- 
1.7.10.4
