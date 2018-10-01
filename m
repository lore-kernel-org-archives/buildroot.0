From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Oct 2018 17:33:59 +0200
Subject: [Buildroot] [git commit] pkg-toolchain-external.mk: fix
 s/CC_TARGET_ARCH/GCC_TARGET_ARCH/ typo
Message-ID: <20181001153510.42AC68A6BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1eed7fae365fa1813ba1061554eb3e72f400a7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

commit e0d14fb21b (toolchain-external: drop no longer needed
CC_TARGET_<foo>_ variables) dropped the CC_TARGET_* variables, but missed
one.  Fix that.

Reported-by: Mark Corbin <mark.corbin@embecosm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index b1c41b0d97..db3570d96f 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -159,7 +159,7 @@ TOOLCHAIN_EXTERNAL_CFLAGS += -m64
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_64
 endif
 ifneq ($(GCC_TARGET_ARCH),)
-TOOLCHAIN_EXTERNAL_CFLAGS += -march=$(CC_TARGET_ARCH)
+TOOLCHAIN_EXTERNAL_CFLAGS += -march=$(GCC_TARGET_ARCH)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ARCH='"$(GCC_TARGET_ARCH)"'
 endif
 ifneq ($(GCC_TARGET_CPU),)
