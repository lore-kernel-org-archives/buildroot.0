From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 11 Mar 2016 03:45:22 +0300
Subject: [Buildroot] [PATCH 2/2] Revert "gcc/gcc-final: pass TARGET_ABI
	flags to configure with --enable-cxx-flags"
In-Reply-To: <1457657122-7283-1-git-send-email-jcmvbkbc@gmail.com>
References: <1457657122-7283-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1457657122-7283-3-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 2dcab526a97d1dbcb73c3cd578e5bf2853853a10.

Now that gcc correctly propagates CXXFLAGS_FOR_TARGET for libstdc++
build this is no longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/gcc/gcc-final/gcc-final.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index dbdb615..69fdc0c 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -195,8 +195,4 @@ endef
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_USR_LIBS
 endif
 
-ifeq ($(BR2_xtensa),y)
-HOST_GCC_FINAL_CONF_OPTS += --enable-cxx-flags="$(TARGET_ABI)"
-endif
-
 $(eval $(host-autotools-package))
-- 
2.1.4
