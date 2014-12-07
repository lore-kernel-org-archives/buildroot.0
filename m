From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 23:46:41 +0100
Subject: [Buildroot] [git commit] arch/powerpc: add fsl e5500 and e6500
	support
Message-ID: <20141207224728.80FE1800DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd88e49cd7a89eece58a0bd066377faaddea8e8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add Freescale E5500 and E6500 core support.
These can go in 32 or 64-bit mode.
I'm not aware of these being able to boot in LE mode so filter that out
until we get some feedback on it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Matt Weber" <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.powerpc |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index fabee9f..95bcaee 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -109,6 +109,13 @@ config BR2_powerpc_e300c3
 config BR2_powerpc_e500mc
 	bool "e500mc"
 	depends on !BR2_ARCH_IS_64
+config BR2_powerpc_e5500
+	bool "e5500"
+	depends on !BR2_powerpc64le
+config BR2_powerpc_e6500
+	bool "e6500"
+	depends on !BR2_powerpc64le
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_power4
 	bool "power4"
 config BR2_powerpc_power5
