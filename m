From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 13:08:05 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 iproute2
Message-ID: <20180708110810.D16ED863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b83204d038b5f948c20235e677725f9312cfb2a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk   | 1 +
 package/iproute2/iproute2.mk | 6 ------
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 399db06bb9..a7823d82ae 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_IPROUTE2),iproute2) \
 	$(if $(BR2_PACKAGE_IPUTILS),iputils) \
 	$(if $(BR2_PACKAGE_KMOD),kmod) \
 	$(if $(BR2_PACKAGE_LESS),less) \
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 1f276ac7ed..48413401cd 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -12,12 +12,6 @@ IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
 IPROUTE2_LICENSE = GPL-2.0+
 IPROUTE2_LICENSE_FILES = COPYING
 
-# If both iproute2 and busybox are selected, make certain we win
-# the fight over who gets to have their utils actually installed.
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-IPROUTE2_DEPENDENCIES += busybox
-endif
-
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 IPROUTE2_DEPENDENCIES += elfutils
 endif
