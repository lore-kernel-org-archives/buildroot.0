From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Nov 2014 00:14:30 +0100
Subject: [Buildroot] [git commit] gcc: do not use BR2_GCC_TARGET_TUNE anymore
Message-ID: <20141106233447.43E32B1DDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0b2c5985aa9d0cf35aebef266fe9cf01c54bc3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the BR2_GCC_TARGET_TUNE value is always empty now, there is no
longer a point in using it in the gcc package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 59f6268..cdd71aa 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -174,9 +174,6 @@ endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
 HOST_GCC_COMMON_CONF_OPTS += --with-arch=$(BR2_GCC_TARGET_ARCH)
 endif
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_TUNE)),)
-HOST_GCC_COMMON_CONF_OPTS += --with-tune=$(BR2_GCC_TARGET_TUNE)
-endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
 HOST_GCC_COMMON_CONF_OPTS += --with-abi=$(BR2_GCC_TARGET_ABI)
 endif
