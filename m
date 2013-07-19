From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Jul 2013 23:46:06 +0200
Subject: [Buildroot] [git commit] gcc/arm: disable mudflap for thumb(1)
Message-ID: <20130719220803.04BAB99CD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9053e0685fcb86269e4daa821868709fa34cf4e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libmudflap doesn't build for a thumb(1) toolchain so disable it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gcc/gcc.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index c0d821b..85cd7d4 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -194,6 +194,11 @@ ifeq ($(BR2_avr32),y)
 HOST_GCC_COMMON_CONF_OPT += --disable-libmudflap
 endif
 
+# ARM Thumb and mudflap aren't friends
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+HOST_GCC_COMMON_CONF_OPT += --disable-libmudflap
+endif
+
 # Disable mudflap and enable proper double/long double for SPE ABI
 ifeq ($(BR2_powerpc_SPE),y)
 HOST_GCC_COMMON_CONF_OPT += \
