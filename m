From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  2 Mar 2014 16:35:14 +0200
Subject: [Buildroot] [PATCH] samba4: add comment arch dependencies
Message-ID: <b249dcfddfaa7cb817d4975854a2c3565515d553.1393770914.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hide the comment for unsupported architectures.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/samba4/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index fcc03dfb1528..bea26cba3625 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -20,5 +20,6 @@ config BR2_PACKAGE_SAMBA4
 	  http://www.samba.org/
 
 comment "samba4 needs a toolchain w/ IPv6, wchar, largfile, threads"
+	depends on BR2_arm || BR2_powerpc || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || \
 		!BR2_USE_WCHAR || !BR2_INET_IPV6
-- 
1.9.0
