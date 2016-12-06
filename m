From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Dec 2016 22:27:09 +0100
Subject: [Buildroot] [git commit] gcc: fix powerpc64le arch config name
Message-ID: <20161206213746.0378F8190D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5389d52272e26207690cfb41f6118c8bc47fcf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot references powerpc64 little endian as BR2_powerpc64le and not
BR2_powerpc64el.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 0f6ced5..4c3815b 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -25,7 +25,7 @@ choice
 		# Unsupported for MIPS R6
 		depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 		# musl ppc64 unsupported
-		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
+		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
 		# musl mips64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
@@ -51,7 +51,7 @@ choice
 		# musl microblaze unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_microblazeel || BR2_microblazebe))
 		# musl ppc64 unsupported
-		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
+		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
 		# musl mips64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
 		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
@@ -62,7 +62,7 @@ choice
 		# Broken or unsupported architectures
 		depends on !BR2_arc && !BR2_bfin
 		# musl ppc64 unsupported
-		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
+		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
 		# Unsupported MIPS cores
 		depends on !BR2_mips_interaptiv && !BR2_mips_m5150 && \
 			!BR2_mips_m6250 && !BR2_mips_i6400 && !BR2_mips_p6600
