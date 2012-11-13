From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:06:01 +0100
Subject: [Buildroot] [PATCH 27/30] util-linux: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-27-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/util-linux/util-linux.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index f6028f4..73ae174 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -7,6 +7,12 @@ UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
 UTIL_LINUX_VERSION_MAJOR = 2.20
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.bz2
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
+
+# README.licensing claims that some files are GPLv2-only, but this is not true.
+# Some files are GPLv3+ but only in tests.
+UTIL_LINUX_LICENSE = GPLv2+, BSD-4c, libblkid and libmount LGPLv2+, libuuid BSD-3c
+UTIL_LINUX_LICENSE_FILES = README.licensing COPYING licenses/COPYING.UCB libblkid/COPYING.libblkid libuuid/COPYING.libuuid
+
 UTIL_LINUX_AUTORECONF = YES
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf
-- 
1.7.10.4
