From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Dec 2012 21:22:29 +0100
Subject: [Buildroot] [git commit] toolchain/gcc: also disable largefile for
	pass 1/2 if needed
Message-ID: <20121212203440.D63439A146@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ce93438c12ca68c9bb12ed28c4d15d1fa840c94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes issue with !BR2_LARGEFILE builds on Ubuntu 12.04 and GCC 4.6+

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 7a0b4ca..b0d741b 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -308,6 +308,7 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) $(GCC_WITH_CPU) \
+		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
 	)
 	touch $@
@@ -373,6 +374,7 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
 		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) $(GCC_WITH_CPU) \
+		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
 	)
 	touch $@
