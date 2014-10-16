From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 Oct 2014 11:06:19 -0300
Subject: [Buildroot] [PATCHv2] pciutils: add hash file
Message-ID: <1413468379-2055-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also switch to xz tarball to avoid cached tarball hash conflict.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pciutils/pciutils.hash | 2 ++
 package/pciutils/pciutils.mk   | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/pciutils/pciutils.hash

diff --git a/package/pciutils/pciutils.hash b/package/pciutils/pciutils.hash
new file mode 100644
index 0000000..b5892b6
--- /dev/null
+++ b/package/pciutils/pciutils.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
+sha256	8d62f84fe7a7401af2ed62d6303255a0cf7333f606c136927f0ba9110ab6824a	pciutils-3.2.1.tar.xz
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 819d6a4..54dc1d9 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PCIUTILS_VERSION = 3.2.1
-PCIUTILS_SITE = ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
+PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
+PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
 PCIUTILS_LICENSE = GPLv2+
 PCIUTILS_LICENSE_FILES = COPYING
-- 
2.0.4
