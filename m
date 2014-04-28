From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Apr 2014 22:16:37 +0200
Subject: [Buildroot] [git commit] upstream glibc 2.18/2.19 works fine with
	microblaze
Message-ID: <20140429125019.19BD59CA71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a72b73852568227ee948a380c720756fbbdbec46
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no need for Xilinx Git.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/Config.in |    2 +-
 package/glibc/glibc.mk  |   12 ------------
 2 files changed, 1 insertions(+), 13 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index a92b5ea..693a33e 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -8,7 +8,7 @@ choice
 		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
 		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
 		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
-		   BR2_x86_64
+		   BR2_x86_64 || BR2_microblaze
 
 config BR2_GLIBC_VERSION_2_18
        bool "2.18"
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 6579f46..d02ab7e 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -4,17 +4,6 @@
 #
 ################################################################################
 
-ifeq ($(BR2_microblaze),y)
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_EGLIBC),y)
-GLIBC_VERSION = 7f0bcce417c47aefad06ddfec7cd4ced3a4e10ff
-GLIBC_SITE = $(call github,Xilinx,eglibc,$(GLIBC_VERSION))
-GLIBC_SRC_SUBDIR = .
-else
-GLIBC_VERSION = b86835ca92a1942ed08d8b5ee47498e711feaddb
-GLIBC_SITE = $(call github,Xilinx,glibc,$(GLIBC_VERSION))
-GLIBC_SRC_SUBDIR = .
-endif
-else
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_EGLIBC),y)
 GLIBC_VERSION = 2.18-svnr23787
 GLIBC_SITE = http://downloads.yoctoproject.org/releases/eglibc/
@@ -26,7 +15,6 @@ GLIBC_SITE = $(BR2_GNU_MIRROR)/libc
 GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
 GLIBC_SRC_SUBDIR = .
 endif
-endif
 
 GLIBC_LICENSE = GPLv2+ (programs), LGPLv2.1+, BSD-3c, MIT (library)
 GLIBC_LICENSE_FILES = $(addprefix $(GLIBC_SRC_SUBDIR)/,COPYING COPYING.LIB LICENSES)
