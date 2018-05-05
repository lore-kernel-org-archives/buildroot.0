From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Sat,  5 May 2018 22:13:10 +0200
Subject: [Buildroot] [PATCH 1/2] package/assimp: remove redundant ':' sign
Message-ID: <1525551191-7113-1-git-send-email-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
 package/assimp/assimp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index 4d44748..e391145 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -20,7 +20,7 @@ endif
 # not passed) in gcc versions 5.x or older. The -Os optimization level
 # causes a "unable to find a register to spill in class
 # ?GENERAL_REGS?" error. -O2 works fine.
-ifeq ($(BR2_sh):$(BR2_STATIC_LIBS):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:y:)
+ifeq ($(BR2_sh)$(BR2_STATIC_LIBS):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),yy:)
 ASSIMP_CXXFLAGS += -O2
 endif
 
-- 
1.9.1
