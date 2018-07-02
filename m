From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:12:21 +0200
Subject: [Buildroot] [PATCH 47/50] package/busybox: invert dependency with bc
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <791cd8203be317f7a64d899963c5953f07745877.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bc/bc.mk           | 5 -----
 package/busybox/busybox.mk | 1 +
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/bc/bc.mk b/package/bc/bc.mk
index a6446cef66..ee0e43848b 100644
--- a/package/bc/bc.mk
+++ b/package/bc/bc.mk
@@ -11,9 +11,4 @@ BC_DEPENDENCIES = host-flex
 BC_LICENSE = GPL-2.0+, LGPL-2.1+
 BC_LICENSE_FILES = COPYING COPYING.LIB
 
-# Build after busybox so target ends up with bc's "dc" version
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-BC_DEPENDENCIES += busybox
-endif
-
 $(eval $(autotools-package))
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d0a49c7495..2ff6c94e85 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_BC),bc) \
 	$(if $(BR2_PACKAGE_BINUTILS),binutils) \
 	$(if $(BR2_PACKAGE_COREUTILS),coreutils) \
 	$(if $(BR2_PACKAGE_CPIO),cpio) \
-- 
2.14.1
