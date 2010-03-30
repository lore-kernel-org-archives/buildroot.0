From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 30 Mar 2010 17:23:23 +0200
Subject: [Buildroot] [git commit master] binutils: simplify BINUTILS_SITE
	selection
Message-ID: <20100330152415.186B621342@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8628082b83110acad71c27b79edd5f5345c405b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All versions are available on gnu.org.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/binutils/binutils.mk |   21 ++-------------------
 1 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
index b02bcdf..3f48c18 100644
--- a/toolchain/binutils/binutils.mk
+++ b/toolchain/binutils/binutils.mk
@@ -6,27 +6,10 @@
 BINUTILS_VERSION:=$(call qstrip,$(BR2_BINUTILS_VERSION))
 
 EXTRA_BINUTILS_CONFIG_OPTIONS=$(call qstrip,$(BR2_EXTRA_BINUTILS_CONFIG_OPTIONS))
-BINUTILS_SITE:=$(BR2_KERNEL_MIRROR)/linux/devel/binutils
-ifeq ($(BINUTILS_VERSION),2.20.1)
-BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
-endif
-ifeq ($(BINUTILS_VERSION),2.20)
-BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
-endif
-ifeq ($(BINUTILS_VERSION),2.19.1)
-BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
-endif
-ifeq ($(BINUTILS_VERSION),2.19)
-BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
-endif
-ifeq ($(BINUTILS_VERSION),2.18)
-BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
-endif
-ifeq ($(BINUTILS_VERSION),2.17)
-BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
-endif
 ifeq ($(findstring avr32,$(BINUTILS_VERSION)),avr32)
 BINUTILS_SITE:=ftp://www.at91.com/pub/buildroot/
+else
+BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
 endif
 
 # We do not rely on the host's gmp/mpfr but use a known working one
-- 
1.6.3.3
