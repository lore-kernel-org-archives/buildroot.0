From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Oct 2015 00:01:25 +0200
Subject: [Buildroot] [git commit] toolchain: add mips64 for uClibc-ng
Message-ID: <20151012220225.E9A27818A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7340143a5cc74019f4d37115d00ae3b1f932d6f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Filter out all other uClibc versions, as they containing
serious bugs for mips64.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in                |    4 ++--
 toolchain/toolchain-buildroot/Config.in |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 898d99d..2e10af7 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -27,7 +27,7 @@ choice
 		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
 		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
 		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL if !BR2_x86_i386
-		depends on !(BR2_arc || BR2_xtensa)
+		depends on !(BR2_arc || BR2_mips64 || BR2_mips64el || BR2_xtensa)
 
 	config BR2_UCLIBC_VERSION_ARC_GIT
 		bool "uClibc Git ARC"
@@ -50,7 +50,7 @@ choice
 		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
 		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
 		       if !BR2_x86_i386 && !BR2_xtensa
-		depends on !(BR2_arc)
+		depends on !(BR2_arc || BR2_mips64 || BR2_mips64el)
 
 endchoice
 
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index d3f685f..cee2578 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -24,7 +24,7 @@ choice
 	prompt "C library"
 	default BR2_TOOLCHAIN_UCLIBC
 	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_aarch64 || BR2_aarch64_be \
-		|| BR2_microblaze || BR2_mips64 || BR2_mips64el || BR2_powerpc64
+		|| BR2_microblaze || BR2_powerpc64
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc"
