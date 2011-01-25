From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Jan 2011 16:08:50 +0100
Subject: [Buildroot] [git commit master 1/1] package/Makefile.in: Fix LIBC
	calculation for internal ct-ng toolchains
Message-ID: <20110125150944.5AF498D24D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f82604657871e11af7fd833b97bec2dc7d27841e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use uclibc for internal ct-ng toolchains configured with uClibc as well.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index fae0e0e..468d30c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -12,9 +12,7 @@ MAKE:=$(HOSTMAKE) -j$(BR2_JLEVEL)
 # Compute GNU_TARGET_NAME and REAL_GNU_TARGET_NAME
 GNU_TARGET_NAME=$(ARCH)-linux
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-LIBC=uclibc
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG_uClibc)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 LIBC=uclibc
 else
 LIBC=gnu
-- 
1.7.3.4
