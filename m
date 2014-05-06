From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 06 May 2014 12:51:19 +0200
Subject: [Buildroot] [PATCH] toolchain package: set version as 'virtual'
 instead of 'undefined'
Message-ID: <0533846efc9952901283.1399373479@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch causes the log messages to change from:

>>> toolchain-external undefined Downloading
>>> toolchain-external undefined Extracting
...

to

>>> toolchain-external virtual Downloading
>>> toolchain-external virtual Extracting
...

and similar for 'toolchain' and 'toolchain-buildroot', simply because it
looks nicer.
At the same time, the directory names also become toolchain-virtual,
toolchain-buildroot-virtual, toolchain-external-virtual instead of the
corresponding 'undefined' variants.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 toolchain/toolchain-buildroot/toolchain-buildroot.mk |  1 +
 toolchain/toolchain-external/toolchain-external.mk   |  2 ++
 toolchain/toolchain/toolchain.mk                     |  1 +
 3 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
--- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 TOOLCHAIN_BUILDROOT_SOURCE =
+TOOLCHAIN_BUILDROOT_VERSION = virtual
 
 BR_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
 
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -383,6 +383,8 @@ TOOLCHAIN_EXTERNAL_SITE =
 TOOLCHAIN_EXTERNAL_SOURCE =
 endif
 
+TOOLCHAIN_EXTERNAL_VERSION = virtual
+
 TOOLCHAIN_EXTERNAL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 TOOLCHAIN_SOURCE =
+TOOLCHAIN_VERSION = virtual
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TOOLCHAIN_DEPENDENCIES += toolchain-buildroot
