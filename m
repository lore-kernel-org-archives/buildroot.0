From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 12:05:53 +0100
Subject: [Buildroot] [git commit] bootlader/grub2: disable x86-64-efi choice
	on !BR2_ARCH_IS_64
Message-ID: <20150203110656.0628480E39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fcc8d123ea18dfbe41800ffd84a864b9ce9ff10e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When x86-64-efi platform is selected, grub2 automatically adds -m64 to the
CFLAGS. This makes the configure script failed when the toolchain does not
have multilib support (like the Buildroot ones).

Reported-by: Noe Rubinstein <nrubinstein@aldebaran-robotics.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub2/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 626344a..c465a4d 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -132,6 +132,7 @@ config BR2_TARGET_GRUB2_I386_EFI
 
 config BR2_TARGET_GRUB2_X86_64_EFI
 	bool "x86-64-efi"
+	depends on BR2_ARCH_IS_64
 	help
 	  Select this option if the platform you're targetting has a
 	  64 bits EFI BIOS.
