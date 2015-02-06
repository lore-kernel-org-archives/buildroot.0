From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Feb 2015 10:32:03 +0100
Subject: [Buildroot] [git commit] qemu: add architecture dependencies for
	host qemu
Message-ID: <20150206094122.8666481791@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa270ac892b7f2539c5729d26006562a27ec6381
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host-qemu package currently builds the user mode emulation, which
isn't available on all architectures, so this commit adds the
necessary architecture dependencies to the Config.in.host file.

Fixes:

  http://autobuild.buildroot.net/results/4298ce40cbe3db50ffe53ecf6856523157df591d/

Reported-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/Config.in.host |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

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
 
