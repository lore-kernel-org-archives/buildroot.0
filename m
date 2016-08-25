From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Aug 2016 23:55:35 +0200
Subject: [Buildroot] [git commit] package/uboot-tols: fix dependency of
	comment about FIT support
Message-ID: <20160825215944.0CDBA822DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=791e35f222da58e815a657d07b620635b78a80e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When commit 031130a4 added the dependency on shared libs for FIT support
in uboot-tools, the dependency of the comment was added exactly as the
dependency of the symbol.

That means the comment is shown when FIT support is possible, and hidden
when it is not, while we want it the other way around...

Fix the dependency.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
