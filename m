From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Dec 2014 18:28:23 +0100
Subject: [Buildroot] [PATCH] package/w_scan: needs headers >= 3.7
Message-ID: <1418578103-4691-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

w_scan uses FEC_2_5, introduced in Linux 3.7.

Also fix the comment, that was stuck to headers 3.0 when we were
requesting headers >= 3.3.

Fixes:
    http://autobuild.buildroot.org/results/bb9/bb97bff1bf7774ebd43ba2107d84520538e530cf/
    http://autobuild.buildroot.org/results/9c2/9c28dcaf3d3bb65977d565e4fbbc25d51d45ac41/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/w_scan/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/w_scan/Config.in b/package/w_scan/Config.in
index 23d178a..2d4f634 100644
--- a/package/w_scan/Config.in
+++ b/package/w_scan/Config.in
@@ -1,9 +1,9 @@
-comment "w_scan needs a toolchain w/ headers >= 3.0"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
+comment "w_scan needs a toolchain w/ headers >= 3.7"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 
 config BR2_PACKAGE_W_SCAN
 	bool "w_scan"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  w_scan is a small command line utility used to perform frequency
-- 
1.9.1
