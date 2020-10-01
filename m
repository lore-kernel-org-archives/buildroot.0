From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Oct 2020 10:52:42 +0200
Subject: [Buildroot] [git commit] package/gcc: drop leftovers from PowerPC
 conditional patching
Message-ID: <20201001084230.BFBA98D69F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4fb6dedfcd78d2efbf53efac6a52109edf91b54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We used to have a conditional patch applied on PowerPC soft-float, but
this logic was dropped in commit
0c82f3f63563c4d4d7e034d0e9e4ceb766d92322 ("package/gcc: remove powerpc
conditional patching logic"). However, we still have some related
leftovers in the calculation of the hashes for ccache, which can now
be dropped.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/gcc.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 363a1d1da7..fe73bb83a8 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -291,11 +291,6 @@ HOST_GCC_COMMON_CCACHE_HASH_FILES += \
 ifeq ($(BR2_xtensa),y)
 HOST_GCC_COMMON_CCACHE_HASH_FILES += $(ARCH_XTENSA_OVERLAY_TAR)
 endif
-ifeq ($(ARCH),powerpc)
-ifneq ($(BR2_SOFT_FLOAT),)
-HOST_GCC_COMMON_CCACHE_HASH_FILES += package/gcc/$(GCC_VERSION)/1000-powerpc-link-with-math-lib.patch.conditional
-endif
-endif
 
 # _CONF_OPTS contains some references to the absolute path of $(HOST_DIR)
 # and a reference to the Buildroot git revision (BR2_VERSION_FULL),
