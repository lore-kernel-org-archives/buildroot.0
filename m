From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 23 Jul 2015 23:08:55 +0200
Subject: [Buildroot] [PATCH] package/gcc: fix typo for CFLAGS_FOR_TARGET
Message-ID: <1437685735-7281-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CFLAGS_FOR_TARGET is initialized with GCC_COMMON_TARGET_CXXFLAGS.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index aaeba7f..accb429 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -113,7 +113,7 @@ endif
 endif
 
 # Propagate options used for target software building to GCC target libs
-HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
+HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
 HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
 
 # libitm needs sparc V9+
-- 
2.4.3
