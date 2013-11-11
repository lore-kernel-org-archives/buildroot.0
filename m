From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Mon, 11 Nov 2013 16:07:48 +0100
Subject: [Buildroot] [PATCH] icu: Doesn't work on ARC yet
Message-ID: <1384182468-18493-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

icu depends on __sync_sub_and_fetch and other atomic primitives that
don't exist in the ARC toolchain yet.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/icu/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/icu/Config.in b/package/icu/Config.in
index 585bffb..3c041bb 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_ICU
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_arc # atomic builtins
 	help
 	  International Components for Unicode.
 
-- 
1.7.9.5
