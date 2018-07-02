From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:12:19 +0200
Subject: [Buildroot] [PATCH 45/50] package/busybox: invert dependency with
 coreutils
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <9b47ce9dcd7d31d8f871810e4c2bf0873cb825e1.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk     | 1 +
 package/coreutils/coreutils.mk | 6 ------
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 29134e658d..0ba8d792fb 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_COREUTILS),coreutils) \
 	$(if $(BR2_PACKAGE_CPIO),cpio) \
 	$(if $(BR2_PACKAGE_DCRON),dcron) \
 	$(if $(BR2_PACKAGE_DEBIANUTILS),debianutils) \
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 4ef888829f..3cb96589f2 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -59,12 +59,6 @@ COREUTILS_BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false \
 	kill link ln ls mkdir mknod mktemp mv nice printenv pwd rm rmdir \
 	vdir sleep stty sync touch true uname join
 
-# If both coreutils and busybox are selected, make certain coreutils
-# wins the fight over who gets to have their utils actually installed.
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-COREUTILS_DEPENDENCIES = busybox
-endif
-
 ifeq ($(BR2_PACKAGE_ACL),y)
 COREUTILS_DEPENDENCIES += acl
 else
-- 
2.14.1
