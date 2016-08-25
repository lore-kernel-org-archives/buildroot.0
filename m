From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Aug 2016 20:45:51 +0200
Subject: [Buildroot] [PATCH] package/uboot-tols: fix dependency of comment
	about FIT support
Message-ID: <1472150751-29450-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When commit 031130a4 added the dependency on sharedlibs for FIT support
in uboot-tools, the dependency of the comment was added exactly as the
dependency of the symbol.

That means the comment is shown when FIT support is possible, and hidden
when it is not, while we want it the other way around...

Fix the dependency.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uboot-tools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index df61fda..f55614b 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
 	  pass the address of the blob to the "bootm" command.
 
 comment "u-boot tools FIT support needs a toolchain w/ dynamic library"
-	depends on !BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS
 
 if BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
 
-- 
2.7.4
