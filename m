From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 16:02:27 +0200
Subject: [Buildroot] [git commit] linux: kconfig needs the toolchain
Message-ID: <20180820140105.6AC208DEF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fc990a79834ce20992aca963817fcb6bf456171
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting with linux-4.18, the kconfig from the kernel can call
to the compiler to test its capabilities; see:

    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/Kconfig.include

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Jan Kundr??t <jan.kundrat@cesnet.cz>
Tested-by: Jan Kundr??t <jan.kundrat@cesnet.cz>
Reviewed-by: Jan Kundr??t <jan.kundrat@cesnet.cz>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index d6b0853518..675e7906a8 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -71,6 +71,11 @@ LINUX_KCONFIG_DEPENDENCIES = \
 	$(BR2_BISON_HOST_DEPENDENCY) \
 	$(BR2_FLEX_HOST_DEPENDENCY)
 
+# Starting with 4.18, the kconfig in the kernel calls the
+# cross-compiler to check its capabilities. So we need the
+# toolchain before we can call the configurators.
+LINUX_KCONFIG_DEPENDENCIES += toolchain
+
 # host tools needed for kernel compression
 ifeq ($(BR2_LINUX_KERNEL_LZ4),y)
 LINUX_DEPENDENCIES += host-lz4
