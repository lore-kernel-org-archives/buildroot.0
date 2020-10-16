From: Vadym Kochan <vadim4j@gmail.com>
Date: Fri, 16 Oct 2020 15:22:40 +0300
Subject: [Buildroot] [PATCH] package/keepalived: make suport for Linux
 headers >= 3.2
Message-ID: <20201016122240.4235-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vadym Kochan <vadym.kochan@plvision.eu>

There are some toolchains which is compiled with Linux 3.2 heaers, it
would good to support them too because the package bulds fine with them.

Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
---
 package/keepalived/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/keepalived/Config.in b/package/keepalived/Config.in
index c71821545c..223ed5a4e6 100644
--- a/package/keepalived/Config.in
+++ b/package/keepalived/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_KEEPALIVED
 	bool "keepalived"
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS # uses libdl
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	select BR2_PACKAGE_OPENSSL
 	help
 	  The main goal of the keepalived project is to add a strong &
@@ -15,6 +15,6 @@ config BR2_PACKAGE_KEEPALIVED
 
 	  http://www.keepalived.org/
 
-comment "keepalived needs a toolchain w/ dynamic library, headers >= 3.4"
+comment "keepalived needs a toolchain w/ dynamic library, headers >= 3.2"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-- 
2.17.1
