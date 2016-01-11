From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 11 Jan 2016 09:46:33 -0300
Subject: [Buildroot] [PATCH] cdrkit: add zlib select
Message-ID: <1452516393-15090-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's inconsistent with it's DEPENDENCIES otherwise, fixes:
http://autobuild.buildroot.net/results/ac1/ac1e671dcd66c3823cf2e289604ed56f14f7161e/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cdrkit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
index 3b0b7f1..46c0ba9 100644
--- a/package/cdrkit/Config.in
+++ b/package/cdrkit/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_CDRKIT
 	# Needed for libbz
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_ZLIB
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
 	bool "cdrkit"
-- 
2.4.10
