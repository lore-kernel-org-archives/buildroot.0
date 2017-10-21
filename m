From: Alexey Brodkin <alexey.brodkin@gmail.com>
Date: Sat, 21 Oct 2017 23:49:11 +0300
Subject: [Buildroot] [PATCH 2/2] libdrm: Make Etnaviv arch-independent
In-Reply-To: <1508618951-24632-1-git-send-email-abrodkin@synopsys.com>
References: <1508618951-24632-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1508618951-24632-3-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vivante GPU could be a part of SoC along with any CPU architecture
thus get rid of nonsense dependency.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 package/libdrm/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index e48246ad785e..581f9219689a 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -64,7 +64,6 @@ config BR2_PACKAGE_LIBDRM_OMAP
 
 config BR2_PACKAGE_LIBDRM_ETNAVIV
 	bool "etnaviv (experimental)"
-	depends on BR2_arm
 	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
 	select BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 	help
-- 
2.7.5
