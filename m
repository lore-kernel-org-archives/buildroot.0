From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  4 Jun 2014 22:24:35 +0200
Subject: [Buildroot] [PATCH] package/w_scan: needs kernel headers >= 3.3
Message-ID: <1401913475-2483-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

w_scan needs SYS_DVBC_ANNEX_C, introduced in Linux 3.3.

Fixes:
    http://autobuild.buildroot.net/results/143/143960dc6de5377567dd2a383becc5a7bca90b41/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/w_scan/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/w_scan/Config.in b/package/w_scan/Config.in
index 02cb2c3..23d178a 100644
--- a/package/w_scan/Config.in
+++ b/package/w_scan/Config.in
@@ -1,9 +1,9 @@
 comment "w_scan needs a toolchain w/ headers >= 3.0"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
 
 config BR2_PACKAGE_W_SCAN
 	bool "w_scan"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  w_scan is a small command line utility used to perform frequency
-- 
1.8.3.2
