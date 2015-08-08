From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:29 -0000
Subject: [Buildroot] [git commit branch/next] arch: aarch64 always has a MMU
Message-ID: <20150808105629.0378B7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f410de414072f1aea6ed32f4e6aef8769f2ae665
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Following the addition of AArch64 big endian, the AArch64 little
endian option had lost its 'select BR2_ARCH_HAS_MMU_MANDATORY', so
let's reintroduce it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 39ce046..875f412 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -61,6 +61,7 @@ config BR2_armeb
 config BR2_aarch64
 	bool "AArch64 (little endian)"
 	select BR2_ARCH_IS_64
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
 	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
