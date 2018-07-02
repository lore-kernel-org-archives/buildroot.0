From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:12:05 +0200
Subject: [Buildroot] [PATCH 31/50] package/busybox: invert dependency with
 ifupdown
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <07f7eabc952f5a9f1119f33ca0ea047cf9c8e189.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk   | 1 +
 package/ifupdown/ifupdown.mk | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 50c71af284..c6834f44a3 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_IFUPDOWN),ifupdown) \
 	$(if $(BR2_PACKAGE_IPROUTE2),iproute2) \
 	$(if $(BR2_PACKAGE_IPUTILS),iputils) \
 	$(if $(BR2_PACKAGE_KMOD),kmod) \
diff --git a/package/ifupdown/ifupdown.mk b/package/ifupdown/ifupdown.mk
index dfc3f3cc11..84d24aedab 100644
--- a/package/ifupdown/ifupdown.mk
+++ b/package/ifupdown/ifupdown.mk
@@ -7,7 +7,6 @@
 IFUPDOWN_VERSION = 0.8.16
 IFUPDOWN_SOURCE = ifupdown_$(IFUPDOWN_VERSION).tar.xz
 IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20160922T165503Z/pool/main/i/ifupdown
-IFUPDOWN_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 IFUPDOWN_LICENSE = GPL-2.0+
 IFUPDOWN_LICENSE_FILES = COPYING
 
-- 
2.14.1
