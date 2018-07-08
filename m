From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jul 2018 11:46:09 +0200
Subject: [Buildroot] [PATCH 44/50 v2] package/busybox: invert dependency
 with cpio
In-Reply-To: <cover.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <ce5de428fac1a7a68cbb817f53fc04f7eae96c7a.1531043163.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 1 +
 package/cpio/cpio.mk       | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index fe36cb3918..6351869330 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_CPIO),cpio) \
 	$(if $(BR2_PACKAGE_DCRON),dcron) \
 	$(if $(BR2_PACKAGE_DEBIANUTILS),debianutils) \
 	$(if $(BR2_PACKAGE_DIFFUTILS),diffutils) \
diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index 7e8549dbd8..9a09279572 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -7,7 +7,6 @@
 CPIO_VERSION = 2.12
 CPIO_SITE = $(BR2_GNU_MIRROR)/cpio
 CPIO_CONF_OPTS = --bindir=/bin
-CPIO_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 CPIO_LICENSE = GPL-3.0+
 CPIO_LICENSE_FILES = COPYING
 
-- 
2.14.1
