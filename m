From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jul 2018 11:45:56 +0200
Subject: [Buildroot] [PATCH 31/50 v2] package/busybox: invert dependency
 with ifupdown
In-Reply-To: <cover.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <1495a1ae679b758e3c872ebf95b7dd04dbaacfb4.1531043163.git.yann.morin.1998@free.fr>
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
index a7823d82ae..b03945ad9c 100644
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
