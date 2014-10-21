From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 22:27:15 +0200
Subject: [Buildroot] [PATCH v2 28/30] gcc: do not use BR2_GCC_TARGET_TUNE
	anymore
In-Reply-To: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413923237-2861-29-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the BR2_GCC_TARGET_TUNE value is always empty now, there is no
longer a point in using it in the gcc package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gcc/gcc.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 7bed159..f5ec96a 100644
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
-- 
2.0.0
