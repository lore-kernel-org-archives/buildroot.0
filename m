From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon,  3 Jun 2013 07:57:24 +0100
Subject: [Buildroot] [PATCH] sconeserver: requires thread support
Message-ID: <1370242644-17574-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Fixes autobuild failures such as the following.

  http://autobuild.buildroot.net/results/a290aa34bd44c0e08f7aa44a7c606420668eef6d/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/sconeserver/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 0fc3a13..a467476 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -1,6 +1,7 @@
 menuconfig BR2_PACKAGE_SCONESERVER
 	bool "sconeserver"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_PCRE
 	help
 	  Sconeserver is a modular, object-orientated and extremely versatile
@@ -90,5 +91,5 @@ comment "ui module requires X.org"
 
 endif # BR2_PACKAGE_SCONESERVER
 
-comment "sconeserver requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "sconeserver requires a toolchain with C++ and thread support enabled"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
-- 
1.8.1.2
