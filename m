From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Apr 2015 12:32:08 -0300
Subject: [Buildroot] [PATCH] strongswan: needs atomics
Message-ID: <1428507128-8490-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/3d1/3d13ced1b142d014c5bc098137174c4369a1e3b5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/strongswan/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 23131dc..bdbbb50 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -1,10 +1,12 @@
 comment "strongswan needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 menuconfig BR2_PACKAGE_STRONGSWAN
 	bool "strongswan"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_ARCH_HAS_ATOMICS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  strongSwan is an OpenSource IPsec implementation for the
-- 
2.0.5
