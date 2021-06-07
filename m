From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:45 -0000
Subject: [Buildroot] [git commit] package/uclibc: enable linuxthreads for
 all supported architectures
Message-ID: <20210607144656.CA57D8B398@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9a5448aa05f90718768302a64d2f4a57f260be0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Synchronize the list of architectures that have LinuxThreads support
with the ones from uClibc-ng.

Signed-off-by: Mircea GLIGA <mgliga@bitdefender.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/uclibc/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index e59fef3c69..2091166b62 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -53,7 +53,8 @@ config BR2_PTHREADS_NATIVE
 
 config BR2_PTHREADS
 	bool "linuxthreads"
-	depends on BR2_m68k || BR2_microblaze || BR2_or1k || BR2_arm || BR2_armeb || BR2_xtensa
+	depends on !BR2_aarch64 && !BR2_aarch64_be
+	depends on !BR2_RISCV_64
 	select BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PTHREADS_NONE
