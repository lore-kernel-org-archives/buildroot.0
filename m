From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:57:26 +0100
Subject: [Buildroot] [git commit] glibc: remove version 2.21
Message-ID: <20160302202759.CB7347F98B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b9a7128e7b0d861e01088b780eb246aa07dec70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mask out glibc for sparc as well since it's no longer available.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibc/Config.in                 | 4 ----
 package/glibc/glibc.hash                | 1 -
 toolchain/toolchain-buildroot/Config.in | 5 ++---
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index f839e29..0565162 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -34,9 +34,6 @@ choice
 	prompt "glibc version"
 	default BR2_GLIBC_VERSION_2_22
 
-config BR2_GLIBC_VERSION_2_21
-	bool "2.21"
-
 config BR2_GLIBC_VERSION_2_22
 	bool "2.22"
 	# No support for pthread barriers on < v9 ISA
@@ -55,6 +52,5 @@ config BR2_GLIBC_VERSION_STRING
 	string
 	default "2.18-svnr23787" if BR2_EGLIBC_VERSION_2_18
 	default "2.19-svnr25243" if BR2_EGLIBC_VERSION_2_19
-	default "2.21" if BR2_GLIBC_VERSION_2_21
 	default "2.22" if BR2_GLIBC_VERSION_2_22
 	default "2.23" if BR2_GLIBC_VERSION_2_23
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index c809735..b04f214 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -4,6 +4,5 @@ md5	b395b021422a027d89884992e91734fc	eglibc-2.18-svnr23787.tar.bz2
 sha1	224d9e655e8f0ad04ffde47b97a11c64e2255b56	eglibc-2.18-svnr23787.tar.bz2
 md5	197836c2ba42fb146e971222647198dd	eglibc-2.19-svnr25243.tar.bz2
 sha1	8013c1935b46fd50d2d1fbfad3b0af362b75fb28	eglibc-2.19-svnr25243.tar.bz2
-sha256  aeeb362437965a5d3f40b151094ca79def04a115bd363fdd4a9a0c69482923b8  glibc-2.21.tar.xz
 sha256	eb731406903befef1d8f878a46be75ef862b9056ab0cde1626d08a7a05328948	glibc-2.22.tar.xz
 sha256	94efeb00e4603c8546209cefb3e1a50a5315c86fa9b078b6fad758e187ce13e9	glibc-2.23.tar.xz
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index cbeb030..37c6624 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -68,9 +68,8 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
 		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
 		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
-		   BR2_sh          || BR2_sh64       || BR2_sparc   || \
-		   BR2_sparc64     || BR2_x86_64     || BR2_microblaze || \
-		   BR2_nios2
+		   BR2_sh          || BR2_sh64       || BR2_sparc64 || \
+		   BR2_x86_64      || BR2_microblaze || BR2_nios2
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_powerpc_SPE
