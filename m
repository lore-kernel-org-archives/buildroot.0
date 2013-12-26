From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Dec 2013 00:04:29 +0100
Subject: [Buildroot] [PATCH] Makefile: ignore .config for defconfig
Message-ID: <1388099069-10529-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, we do not include .config for all '%_defconfig' targets, but
we forgot to also exclude plain 'defconfig'.

Reported-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
This is an alternative fix for: http://patchwork.ozlabs.org/patch/247610/
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 925c1d2..3190541 100644
--- a/Makefile
+++ b/Makefile
@@ -56,7 +56,7 @@ DATE:=$(shell date +%Y%m%d)
 export BR2_VERSION_FULL:=$(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)
 
 noconfig_targets:=menuconfig nconfig gconfig xconfig config oldconfig randconfig \
-	%_defconfig allyesconfig allnoconfig silentoldconfig release \
+	defconfig %_defconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
 	source-check print-version olddefconfig
 
-- 
1.8.1.2
