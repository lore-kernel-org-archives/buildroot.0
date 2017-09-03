From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Sep 2017 11:44:28 +0200
Subject: [Buildroot] [PATCH 2/8] package/gcc: hide versions too old for the
	current arch
In-Reply-To: <cover.1504431850.git.yann.morin.1998@free.fr>
References: <cover.1504431850.git.yann.morin.1998@free.fr>
Message-ID: <dc9aa0e8f3f64c074e08c8fc0bc949eda81f98c1.1504431850.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Begin the conversion from hard-coded dependencies on architectures, to
architecture-specified version requirement, using the newly introduced
BR2_ARCH_NEEDS_GCC_AT_LEAST_XXX symbols.

Hard-coded dependencies will be removed progressively, as archs are
individually coonverted over to using the new symbols.

We do not change the architecture-specific versions for arc and
openrisc, because there is no point in doing so for those, as they
use special, non-upstream versions anyway.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/gcc/Config.in.host | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index ec7b6924ee..69bebc1f9e 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -22,6 +22,7 @@ config BR2_GCC_VERSION_OR1K
 
 config BR2_GCC_VERSION_4_9_X
 	bool "gcc 4.9.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 	# Broken or unsupported architectures
 	depends on !BR2_arc && !BR2_bfin && !BR2_or1k
 	# Broken or unsupported ARM cores
@@ -43,6 +44,7 @@ config BR2_GCC_VERSION_4_9_X
 
 config BR2_GCC_VERSION_5_X
 	bool "gcc 5.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	# Broken or unsupported architectures
 	depends on !BR2_arc && !BR2_bfin && !BR2_or1k
 	# Broken or unsupported ARM cores
@@ -57,6 +59,7 @@ config BR2_GCC_VERSION_5_X
 
 config BR2_GCC_VERSION_6_X
 	bool "gcc 6.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	# Broken or unsupported architectures
 	depends on !BR2_arc
 	depends on !BR2_or1k
-- 
2.11.0
