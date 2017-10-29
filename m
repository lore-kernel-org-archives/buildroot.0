From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Oct 2017 16:55:47 +0100
Subject: [Buildroot] [PATCH] package/libbsd: not available for arc
Message-ID: <20171029155547.25602-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libbsd has explicit, hard-coded checks about the architectures it can
work on, and arc is not one of those.

Add an explicit exclusion.

Fixes:
    http://autobuild.buildroot.org/results/603baa77e95620ad1416e0d1dc4202c334801efc
    http://autobuild.buildroot.org/results/8a2ee5431501615cb150233e6d7bc9e7c3c5c1eb
    http://autobuild.buildroot.org/results/ea52364f536485ff4e43e3bc37f2175eb6178c5a
    http://autobuild.buildroot.org/results/32581f7a79372b525e4ad21e029ff0ede743ba94

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 package/libbsd/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index 9b5b89812f..091b668075 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -1,7 +1,9 @@
 config BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	bool
-	# libbsd does not support the MicroBlaze ELF machine type (see local-elf.h)
-	default y if !BR2_microblaze
+	# libbsd does not support those architectures (see src/local-elf.h)
+	default y
+	depends on !BR2_microblaze
+	depends on !BR2_arcle && !BR2_arcle
 
 config BR2_PACKAGE_LIBBSD
 	bool "libbsd"
-- 
2.11.0
