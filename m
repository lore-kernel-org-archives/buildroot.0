From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Sep 2016 14:56:38 +0200
Subject: [Buildroot] [PATCH] core: distclean is a noconfig target
Message-ID: <1473598598-5546-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the .config contains invalid configuration *(e.g. two providers for
a same virtual pacakge), it is not possible to run "make distclean"
becasue the .config file is sourced and packages interpreted in this
case.

Add distclean to the noconfig list, so that we can run it in all cases.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index dfef021..f29f957 100644
--- a/Makefile
+++ b/Makefile
@@ -86,7 +86,7 @@ export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlo
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-	print-version olddefconfig
+	print-version olddefconfig distclean
 
 # Some global targets do not trigger a build, but are used to collect
 # metadata, or do various checks. When such targets are triggered,
-- 
2.7.4
