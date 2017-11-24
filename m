From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 22:17:03 +0100
Subject: [Buildroot] [git commit branch/next] arch/bfin: needs gcc >= 6
Message-ID: <20171124211341.94553801D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6df07bc58e089be6d3820099c0fbb1b8ac7e8eb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in             | 1 +
 package/gcc/Config.in.host | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 607da36..d3f63da 100644
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
index c470b43..582a409 100644
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
@@ -48,7 +48,7 @@ config BR2_GCC_VERSION_5_X
 	bool "gcc 5.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	# Broken or unsupported architectures
-	depends on !BR2_arc && !BR2_bfin && !BR2_or1k
+	depends on !BR2_arc && !BR2_or1k
 	# Broken or unsupported ARM cores
 	depends on !BR2_cortex_a57_a53 && !BR2_cortex_a72_a53
 	# musl ppc64 unsupported
