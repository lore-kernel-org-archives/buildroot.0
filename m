From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Nov 2015 23:47:01 +0100
Subject: [Buildroot] [PATCH 06/21 RFC] package/gcc: add licensing information
In-Reply-To: <cover.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <ac61c991794df8089b615aee810b018840e37cc8.1447713615.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, this is not used, since there is no host-gcc (or gcc)
package, and we only build host-gcc-initial and host-gcc-final.

So, this commit only really adds the licensing terms, installing
them in the legal-info output will be handled in a futur commit.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b9551e8..1c847e0 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -9,6 +9,15 @@
 #
 
 GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
+GCC_LICENSE = \
+	GPLv2+, GPLv3+, LGPLv2.1+ (w/ exception), LGPv3+ (w/ exception), \
+	BSD-3c, MIT, BSL-1.0
+GCC_LICENSE_FILES = \
+	COPYING COPYING3 COPYING.LIB COPYING3.LIB COPYING.RUNTIME \
+	libiberty/COPYING.LIB gcc/go/gofrontend/LICENSE \
+	gcc/COPYING gcc/COPYING.LIB gcc/COPYING3 gcc/COPYING3.LIB \
+	libquadmath/COPYING.LIB libsanitizer/LICENSE.TXT libffi/LICENSE \
+	include/COPYING include/COPYING3 zlib/contrib/dotzlib/LICENSE_1_0.txt
 
 ifeq ($(BR2_arc),y)
 GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
-- 
1.9.1
