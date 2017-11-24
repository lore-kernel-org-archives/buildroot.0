From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 22:09:58 +0100
Subject: [Buildroot] [git commit] package/gcc: hide versions too old for the
 current arch
Message-ID: <20171201205336.41BE77FF82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f33e55df0704067c270a452f92c323c52406025
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Begin the conversion from hard-coded dependencies on architectures, to
architecture-specified version requirement, using the newly introduced
BR2_ARCH_NEEDS_GCC_AT_LEAST_XXX symbols.

Hard-coded dependencies will be removed progressively, as archs are
individually converted over to using the new symbols.

We do not change the architecture-specific versions for ARC and
OpenRISC, because there is no point in doing so for those, as they use
special, non-upstream versions anyway.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 1fb6b60..c470b43 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -22,6 +22,7 @@ config BR2_GCC_VERSION_OR1K
 
 config BR2_GCC_VERSION_4_9_X
 	bool "gcc 4.9.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 	# Broken or unsupported architectures
 	depends on !BR2_arc && !BR2_bfin && !BR2_or1k
 	# Broken or unsupported ARM cores
@@ -45,6 +46,7 @@ config BR2_GCC_VERSION_4_9_X
 
 config BR2_GCC_VERSION_5_X
 	bool "gcc 5.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	# Broken or unsupported architectures
 	depends on !BR2_arc && !BR2_bfin && !BR2_or1k
 	# Broken or unsupported ARM cores
@@ -61,6 +63,7 @@ config BR2_GCC_VERSION_5_X
 
 config BR2_GCC_VERSION_6_X
 	bool "gcc 6.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	# Broken or unsupported architectures
 	depends on !BR2_arc
 	depends on !BR2_or1k
