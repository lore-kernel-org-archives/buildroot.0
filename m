From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon,  4 Nov 2013 18:38:12 +0800
Subject: [Buildroot] [PATCH] sconeserver: Can't be built with uClibc.
Message-ID: <1383561492-4646-1-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

General shadow password file API such as getspnam is not supported in uClibc.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 package/sconeserver/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 58c1e03..d4a2b6d 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -2,6 +2,7 @@ menuconfig BR2_PACKAGE_SCONESERVER
 	bool "sconeserver"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_PCRE
 	help
 	  Sconeserver is a modular, object-orientated and extremely versatile
-- 
1.7.9.5
