From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 3 May 2012 21:00:27 +0200
Subject: [Buildroot] [git commit] buildroot: fix BR2_GCC_TARGET_ABI for MIPS
	n64
Message-ID: <20120503190116.79E4C96C68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b66816c71a68b579a0138ef6418cb8a99a4e62d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc 4.3/4.4/4.5 accept the following arguments for --with-abi=

"" | 32 | o64 | n32 | 64 | eabi)

So, the "n64" argument coming from buildroot should be changed to "64"
so that gcc's ./configure step does not error out.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES               |    1 +
 target/Config.in.arch |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 94f584f..d7138b6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -60,6 +60,7 @@
 	Issues resolved (http://bugs.uclibc.org):
 
 	#2353: [lua] fix build with 2010.08-rc1
+	#3751: MIPS: fix BR2_GCC_TARGET_ABI for MIPS n64
 	#4880: New package lcdproc
 	#4886: New package protobuf
 	#5144: Patch to fix ixon bug in uemacs
diff --git a/target/Config.in.arch b/target/Config.in.arch
index e7a18f7..941cd1b 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -831,7 +831,7 @@ config BR2_GCC_TARGET_ABI
 	default n32		if BR2_MIPS_ABI32
 	default eabi		if BR2_MIPS_EABI
 	default o64		if BR2_MIPS_OABI64
-	default n64		if BR2_MIPS_ABI64
+	default 64		if BR2_MIPS_ABI64
 	default mmixware	if BR2_mmix && BR2_MMIX_ABI_native
 	default gnu		if BR2_mmix && !BR2_MMIX_ABI_native
 	default altivec		if BR2_powerpc && BR2_PPC_ABI_altivec
