From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Apr 2014 18:49:13 +0200
Subject: [Buildroot] [PATCH 5/9] package/ucl: new package
In-Reply-To: <cover.1398789775.git.yann.morin.1998@free.fr>
References: <cover.1398789775.git.yann.morin.1998@free.fr>
Message-ID: <0c86a7baa7703648a39f4aa9223cab7be8b804aa.1398789775.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Frank Hunleth <fhunleth@troodon-software.com>

UCL implements a number of compression algorithms that achieve an
excellent compression ratio while allowing *very* fast decompression.
Decompression requires no additional memory.

This is needed for UPX, which is needed for syslinux 6.x.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
[yann.morin.1998 at free.fr: don't add a menuconfig entry, since it
 currently is for internal use only]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/ucl/ucl.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 package/ucl/ucl.mk

diff --git a/package/ucl/ucl.mk b/package/ucl/ucl.mk
new file mode 100644
index 0000000..225ad7c
--- /dev/null
+++ b/package/ucl/ucl.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# ucl
+#
+################################################################################
+
+UCL_VERSION = 1.03
+UCL_SITE = http://www.oberhumer.com/opensource/ucl/download/
+UCL_LICENSE = GPLv2+
+UCL_LICENSE_FILES = COPYING
+
+$(eval $(host-autotools-package))
-- 
1.8.3.2
