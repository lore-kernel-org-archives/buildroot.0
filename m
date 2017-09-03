From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Sep 2017 11:44:31 +0200
Subject: [Buildroot] [PATCH 5/8] arch/bfin: needs gcc >= 6
In-Reply-To: <cover.1504431850.git.yann.morin.1998@free.fr>
References: <cover.1504431850.git.yann.morin.1998@free.fr>
Message-ID: <03807def3a53f42a87ba1dc548b275e659709290.1504431850.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in             | 1 +
 package/gcc/Config.in.host | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 607da36c1d..d3f63da34f 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -79,6 +79,7 @@ config BR2_aarch64_be
 config BR2_bfin
 	bool "Blackfin"
 	select BR2_ARCH_HAS_FDPIC_SUPPORT
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	help
 	  The Blackfin is a family of 16 or 32-bit microprocessors developed,
 	  manufactured and marketed by Analog Devices.
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 69bebc1f9e..df836d96e4 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -24,7 +24,7 @@ config BR2_GCC_VERSION_4_9_X
 	bool "gcc 4.9.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 	# Broken or unsupported architectures
-	depends on !BR2_arc && !BR2_bfin && !BR2_or1k
+	depends on !BR2_arc && !BR2_or1k
 	# Broken or unsupported ARM cores
 	depends on !BR2_cortex_a17 && !BR2_cortex_a17_a7
 	depends on !BR2_cortex_a72 && !BR2_cortex_a72_a53
@@ -46,7 +46,7 @@ config BR2_GCC_VERSION_5_X
 	bool "gcc 5.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	# Broken or unsupported architectures
-	depends on !BR2_arc && !BR2_bfin && !BR2_or1k
+	depends on !BR2_arc && !BR2_or1k
 	# Broken or unsupported ARM cores
 	depends on !BR2_cortex_a57_a53 && !BR2_cortex_a72_a53
 	# musl ppc64 unsupported
-- 
2.11.0
