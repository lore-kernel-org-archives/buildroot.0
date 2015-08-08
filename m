From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:44 -0000
Subject: [Buildroot] [git commit branch/next] package: fix fallout from
	checking kconfig config files
Message-ID: <20150808105632.67980818F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cdcd83f31ded1dbf6d13d16b4aafdf594b964d94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Those checks should only be done when the package is actually enabled.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |    2 +-
 package/uclibc/uclibc.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d8c8bad..6b2abca 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -225,7 +225,7 @@ endef
 
 # Checks to give errors that the user can understand
 # Must be before we call to kconfig-package
-ifeq ($(BR_BUILDING),y)
+ifeq ($(BR2_PACKAGE_BUSYBOX)$(BR_BUILDING),yy)
 ifeq ($(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG)),)
 $(error No BusyBox configuration file specified, check your BR2_PACKAGE_BUSYBOX_CONFIG setting)
 endif
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 3aceae3..9dfafad 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -476,7 +476,7 @@ endef
 
 # Checks to give errors that the user can understand
 # Must be before we call to kconfig-package
-ifeq ($(BR_BUILDING),y)
+ifeq ($(BR2_PACKAGE_UCLIBC)$(BR_BUILDING),yy)
 ifeq ($(call qstrip,$(BR2_UCLIBC_CONFIG)),)
 $(error No uClibc configuration file specified, check your BR2_UCLIBC_CONFIG setting)
 endif
