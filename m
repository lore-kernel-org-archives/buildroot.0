From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 13:08:06 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with bc
Message-ID: <20180708110811.6C53E863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=942e801b3d1236c7fab068c51be07e4e76b7d4a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
index d920987d11..75a2dc4c6d 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_BC),bc) \
 	$(if $(BR2_PACKAGE_BINUTILS),binutils) \
 	$(if $(BR2_PACKAGE_COREUTILS),coreutils) \
 	$(if $(BR2_PACKAGE_CPIO),cpio) \
