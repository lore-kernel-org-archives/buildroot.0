From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 23:14:35 +0100
Subject: [Buildroot] [git commit] Revert "gcc/gcc-final: pass TARGET_ABI
	flags to configure with --enable-cxx-flags"
Message-ID: <20160315221556.D7A137F9C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a1274705d3723b60f1ce16cdb6b2ffcfa8bd144
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 2dcab526a97d1dbcb73c3cd578e5bf2853853a10.

Now that gcc correctly propagates CXXFLAGS_FOR_TARGET for libstdc++
build this is no longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
