From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Mar 2014 15:53:05 +0100
Subject: [Buildroot] [PATCH 10/13] package/w_scan: requires kernel headers
	>= 3.0
In-Reply-To: <cover.1393685422.git.yann.morin.1998@free.fr>
References: <cover.1393685422.git.yann.morin.1998@free.fr>
Message-ID: <706c94f2d133b042391c37e5809a034a75abc4f9.1393685422.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

It needs DVB API version 5.3 or later, introduced in linux 3.0.

Fixes:
    http://autobuild.buildroot.net/results/6e7/6e7c691099a8f3eef4fc84860ceb1a94f25873eb

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/w_scan/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/w_scan/Config.in b/package/w_scan/Config.in
index 4487b0a..02cb2c3 100644
--- a/package/w_scan/Config.in
+++ b/package/w_scan/Config.in
@@ -1,5 +1,9 @@
+comment "w_scan needs a toolchain w/ headers >= 3.0"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+
 config BR2_PACKAGE_W_SCAN
 	bool "w_scan"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  w_scan is a small command line utility used to perform frequency
-- 
1.8.3.2
