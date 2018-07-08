From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jul 2018 11:46:10 +0200
Subject: [Buildroot] [PATCH 45/50 v2] package/busybox: invert dependency
 with coreutils
In-Reply-To: <cover.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <736cd6d9f74e22b29b6a88051937c949634e1f8b.1531043163.git.yann.morin.1998@free.fr>
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
index 6351869330..748f05aca3 100644
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
