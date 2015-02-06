From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  6 Feb 2015 09:15:48 +0100
Subject: [Buildroot] [PATCH] qemu: add architecture dependencies for host
	qemu
Message-ID: <1423210548-4891-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host-qemu package currently builds the user mode emulation, which
isn't available on all architectures, so this commit adds the
necessary architecture dependencies to the Config.in.host file.

Fixes:

  http://autobuild.buildroot.net/results/4298ce40cbe3db50ffe53ecf6856523157df591d/

Reported-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qemu/Config.in.host | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index a1f0531..c5c3f05 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -1,5 +1,14 @@
 config BR2_PACKAGE_HOST_QEMU
 	bool "host qemu"
+	# So far, we only build the user mode emulation, so this list
+	# of architecture dependencies only takes into account this
+	# emulation mode.
+	depends on BR2_arm       || BR2_armeb       || BR2_aarch64      || \
+		BR2_i386         || BR2_m68k        || BR2_microblazeel || \
+		BR2_microblazebe || BR2_mips        || BR2_mipsel       || \
+		BR2_mips64       || BR2_mips64el    || BR2_powerpc      || \
+		BR2_powerpc64    || BR2_powerpc64le || BR2_sh           || \
+		BR2_sparc        || BR2_x86_64
 	help
 	  QEMU is a generic and open source machine emulator and virtualizer.
 
-- 
2.1.0
