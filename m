From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Sep 2013 14:19:13 -0300
Subject: [Buildroot] [PATCH] aiccu: needs threads
Message-ID: <1379438353-17173-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/f6e/f6e1da89b3a0418a50cbfa39fc9373dad3fc968c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/aiccu/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
index 1c6f554..15959b1 100644
--- a/package/aiccu/Config.in
+++ b/package/aiccu/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_AICCU
 	bool "aiccu"
 	depends on BR2_INET_IPV6
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_GNUTLS
 	help
 	  SixXS Automatic IPv6 Connectivity Client Utility
@@ -17,5 +18,5 @@ config BR2_PACKAGE_AICCU
 
 	  http://www.sixxs.net/tools/aiccu/
 
-comment "aiccu requires a toolchain with IPv6 and WCHAR support"
-	depends on !(BR2_INET_IPV6 && BR2_USE_WCHAR)
+comment "aiccu requires a toolchain with IPv6, WCHAR and thread support"
+	depends on !(BR2_INET_IPV6 && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
-- 
1.8.1.5
