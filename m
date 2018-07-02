From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:12:07 +0200
Subject: [Buildroot] [PATCH 33/50] package/busybox: invert dependency with
 ifenslave
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <bf3a6374fb751f72aac4fd08586731b16c23fe42.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk     | 1 +
 package/ifenslave/ifenslave.mk | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index b4c6c8f0fa..afd215d78e 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_IFENSLAVE),ifenslave) \
 	$(if $(BR2_PACKAGE_IFPLUGD),ifplugd) \
 	$(if $(BR2_PACKAGE_IFUPDOWN),ifupdown) \
 	$(if $(BR2_PACKAGE_IPROUTE2),iproute2) \
diff --git a/package/ifenslave/ifenslave.mk b/package/ifenslave/ifenslave.mk
index 4030d22e82..b51aa72051 100644
--- a/package/ifenslave/ifenslave.mk
+++ b/package/ifenslave/ifenslave.mk
@@ -9,7 +9,6 @@ IFENSLAVE_SOURCE = ifenslave_$(IFENSLAVE_VERSION).tar.xz
 IFENSLAVE_SITE = http://snapshot.debian.org/archive/debian/20170102T091407Z/pool/main/i/ifenslave
 IFENSLAVE_LICENSE = GPL-3.0+
 IFENSLAVE_LICENSE_FILES = debian/copyright
-IFENSLAVE_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 
 # shell script, so nothing to build
 
-- 
2.14.1
