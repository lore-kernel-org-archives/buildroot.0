From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Sep 2013 07:18:10 -0300
Subject: [Buildroot] [PATCH] aiccu: needs mmu
Message-ID: <1379499490-13797-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/549/549bc89aeaa0ebf9162fc5853cb637f4f70d0b51/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/aiccu/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
index 15959b1..9cff8cc 100644
--- a/package/aiccu/Config.in
+++ b/package/aiccu/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_AICCU
 	depends on BR2_INET_IPV6
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_GNUTLS
 	help
 	  SixXS Automatic IPv6 Connectivity Client Utility
-- 
1.8.1.5
