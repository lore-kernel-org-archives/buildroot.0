From: Tony Lindgren <tony@atomide.com>
Date: Sun,  3 Dec 2017 14:39:42 -0800
Subject: [Buildroot] [PATCH] kexec: bump to 2.0.16
Message-ID: <20171203223942.6380-1-tony@atomide.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In 2.0.16 we now have uncompressed kernel size available
for ARM starting v4.14 and later kernels.

Let's also remove the extra space after the checksum while at it.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 package/kexec/kexec.hash | 2 +-
 package/kexec/kexec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256 899b7b861431eb51886d0c12866e91b036228244d35a5fb04762dd1a3c0194e7  kexec-tools-2.0.15.tar.xz
+sha256 5b103351ad752c9badd1d65b00eb6de4bce579f944f4df4e3ef3a755ba567010 kexec-tools-2.0.16.tar.xz
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.15
+KEXEC_VERSION = 2.0.16
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
-- 
2.15.0
