From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 29 Feb 2016 09:57:06 -0300
Subject: [Buildroot] [PATCH] powerpc-utils: needs dynamic toolchain
Message-ID: <1456750626-4217-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/a12/a1240ed6facb99518d71153c099dbd7d3d847af6/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/powerpc-utils/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/powerpc-utils/Config.in b/package/powerpc-utils/Config.in
index 8e02e76..e18254c 100644
--- a/package/powerpc-utils/Config.in
+++ b/package/powerpc-utils/Config.in
@@ -1,5 +1,10 @@
+comment "powerpc-utils tools needs a toolchain w/ dynamic library"
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_POWERPC_UTILS
 	bool "powerpc-utils"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	select BR2_PACKAGE_ZLIB
 	help
-- 
2.4.10
