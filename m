From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  3 Apr 2014 21:01:09 +0200
Subject: [Buildroot] [PATCH v4 14/37] mesa3d: Explain dependency for i965
	DRI driver on xorg in Kconfig
In-Reply-To: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396551692-12371-15-git-send-email-bernd.kuhls@t-online.de>
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
index 8ed0c07..324f1b6 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -76,6 +76,9 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
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
