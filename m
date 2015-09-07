From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Sep 2015 23:28:13 +0200
Subject: [Buildroot] [PATCH] toolchain-external: finish removal of SH2A
	toolchains
Message-ID: <1441661293-1638-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit c68c365d2937920df1f2062e4821ebb6d21d195e ("toolchain-external:
remove CS sh2 toolchains") removed the definitions of the
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103 and
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009, but did not actually
remove the code that was using those options.

So this commit removes the parts of the code that are currently dead
due to this: the definition of the prefix of those toolchains, the
hashes, and the URLs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in               | 2 --
 toolchain/toolchain-external/toolchain-external.hash | 2 --
 toolchain/toolchain-external/toolchain-external.mk   | 6 ------
 3 files changed, 10 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index e7aed2e..18bf98c 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -954,8 +954,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209
-	default "sh-uclinux"             if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
-	default "sh-uclinux"             if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 3980c62..8424dca 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -37,8 +37,6 @@ sha256 d6c94587d546197836e7e1a6909f6aabfa5879e91f501ab03088a6887cc242fc  mentor-
 sha256 ce8115844619a8b02f85e801999fe4cc2e603788be784ae860a070f92ab8053d  renesas-2011.03-37-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 sha256 a545a9d412c47d85edcad09a86fe1d12a48e2b6e19d0ccf86b63d2cf0bffa687  renesas-2012.03-35-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 sha256 59d6766fde244931aa52db01433d5acd051998762a931121c5fc109536a1a802  renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 deaae7338c51f526ef809857e0335080e22ddbc2355cad14ade0813b40cd2e22  renesas-2010.09-60-sh-uclinux-i686-pc-linux-gnu.tar.bz2
-sha256 e7d87fc62daecfb3989168bc5b84e099013fe9b796df3da5daebd2e0c0b1af6c  renesas-2011.03-36-sh-uclinux-i686-pc-linux-gnu.tar.bz2
 # x86
 sha256 5f308a3fe0752f181fd0d33a70a17efb8300d0e34a94ed18a1a0304dc18e150e  ia32-2011.09-24-i686-pc-linux-gnu-i386-linux.tar.bz2
 sha256 6ac2f0d9ec56242ecbe4315533f3e00a675909850a41bdafc052fbfe27ece300  ia32-2012.03-27-i686-pc-linux-gnu-i386-linux.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 3cb59c6..da9ad3d 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -318,12 +318,6 @@ TOOLCHAIN_EXTERNAL_SOURCE = renesas-2012.03-35-sh-linux-gnu-i686-pc-linux-gnu.ta
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-uclinux
-TOOLCHAIN_EXTERNAL_SOURCE = renesas-2010.09-60-sh-uclinux-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-uclinux
-TOOLCHAIN_EXTERNAL_SOURCE = renesas-2011.03-36-sh-uclinux-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = ia32-2011.09-24-i686-pc-linux-gnu-i386-linux.tar.bz2
-- 
2.5.1
