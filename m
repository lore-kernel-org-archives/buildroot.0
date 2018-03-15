From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Thu, 15 Mar 2018 20:45:54 +0100
Subject: [Buildroot] [PATCH] wine: Depend on shared libraries
Message-ID: <1521143154-19605-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/wine/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wine/Config.in b/package/wine/Config.in
index 627a9a7..52d7d2e 100644
--- a/package/wine/Config.in
+++ b/package/wine/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WINE
 	bool "wine"
+	depends on !BR2_STATIC_LIBS
 	# Wine only builds on certain architectures
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" || \
 	           BR2_HOSTARCH = "powerpc" || BR2_HOSTARCH = "arm" || \
-- 
2.7.4
