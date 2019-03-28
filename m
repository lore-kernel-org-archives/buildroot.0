From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Mar 2019 11:12:34 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/kexec: enable
 powerpc64 platform
Message-ID: <20190328100938.92E79880D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4b4a301391efbea3280f5c9b345351929f16517
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

kexec has fully support of ppc64 platform:
https://www.kernel.org/doc/Documentation/kdump/kdump.txt
Added BR2_powerpc64 platform support.

Signed-off-by: Artem Senichev <artemsen@gmail.com>
Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7c0a3f879582e3ddce6c4be2c6f2f387c384556d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kexec/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index c4a09be109..410e503d9e 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_KEXEC
 	bool "kexec"
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
 		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
-		BR2_powerpc || BR2_powerpc64le || BR2_sh4 || BR2_sh4a || BR2_aarch64
+		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
+		BR2_sh4 || BR2_sh4a || BR2_aarch64
 	help
 	  Kexec is a user space utility for loading another kernel
 	  and asking the currently running kernel to do something with
