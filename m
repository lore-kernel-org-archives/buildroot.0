From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:24:38 -0300
Subject: [Buildroot] [PATCH 2/4] pciutils: add hash file
In-Reply-To: <1413329080-25292-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413329080-25292-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413329080-25292-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And switch to kernel.org mirror because of inconsistency with it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pciutils/pciutils.hash | 2 ++
 package/pciutils/pciutils.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/pciutils/pciutils.hash

diff --git a/package/pciutils/pciutils.hash b/package/pciutils/pciutils.hash
new file mode 100644
index 0000000..07b9ed6
--- /dev/null
+++ b/package/pciutils/pciutils.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
+sha256	9c1ad30d1e40e353ea78b0c7ca41487cc0923d91e560a6e07072c93bcf520c02	pciutils-3.2.1.tar.gz
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 819d6a4..972e2cc 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PCIUTILS_VERSION = 3.2.1
-PCIUTILS_SITE = ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
+PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
 PCIUTILS_INSTALL_STAGING = YES
 PCIUTILS_LICENSE = GPLv2+
 PCIUTILS_LICENSE_FILES = COPYING
-- 
2.0.4
