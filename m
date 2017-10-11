From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Wed, 11 Oct 2017 17:42:10 +0200
Subject: [Buildroot] [PATCH 1/2] libdrm: VC4 change dependency to arm OR
	aarch64
Message-ID: <20171011154211.2651-1-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable selection of VC4 driver when compiling for Rpi3 using aarch64

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/libdrm/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index b90aea7cef..b48acc00ad 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -94,7 +94,7 @@ config BR2_PACKAGE_LIBDRM_TEGRA
 
 config BR2_PACKAGE_LIBDRM_VC4
 	bool "vc4"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	help
 	  Install vc4 (Raspberry Pi) driver.
 
-- 
2.11.0
