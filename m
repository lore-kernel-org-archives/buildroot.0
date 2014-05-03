From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 May 2014 21:30:58 +0200
Subject: [Buildroot] [git commit] boot/syslinux: needs an ia32-capable
	compiler
Message-ID: <20140503200855.C0EA49CACC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09e7b4c89159a3e48f463b0a22e649c4fc12f4b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The pxelinux and isolionux images are 32-bit binaries, so we need a
compiler that can generate them (ie. a compiler that understands -m32).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Tested-by: Frank Hunleth <fhunleth@troodon-software.com>
Tested-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/syslinux/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index 2c39e65..5b1122d 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -1,6 +1,7 @@
 config BR2_TARGET_SYSLINUX
 	bool "syslinux"
 	depends on BR2_i386 || BR2_x86_64
+	select BR2_HOSTARCH_NEEDS_IA32_COMPILER
 	help
 	  The syslinux bootloader for x86 systems.
 	  This includes: syslinux, pxelinux, extlinux.
