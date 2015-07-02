From: Tal Zilcer <talz@ezchip.com>
Date: Thu, 2 Jul 2015 17:44:54 +0300
Subject: [Buildroot] [PATCH 1/1] package/gcc: fix ARC failure to build in 2
	phases.
Message-ID: <1435848294-5891-1-git-send-email-talz@ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tal Zilcer <talz@ezchip.com>

When working with GCC initial at override source dir mode the
HOST_GCC_INITIAL_POST_PATCH_HOOKS is not called and compilation failes.
The solution is to use HOST_GCC_INITIAL_POST_RSYNC_HOOKS since this hook
is being called at override source dir mode.

Signed-off-by: Tal Zilcer <talz@ezchip.com>
---
 package/gcc/gcc-initial/gcc-initial.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 0fa2353..6bb7997 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -34,6 +34,7 @@ define HOST_GCC_INITIAL_DISABLE_LIBGMON
 		$(@D)/libgcc/config.host
 endef
 HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_INITIAL_DISABLE_LIBGMON
+HOST_GCC_INITIAL_POST_RSYNC_HOOKS += HOST_GCC_INITIAL_DISABLE_LIBGMON
 endif
 
 HOST_GCC_INITIAL_CONF_OPTS = \
-- 
1.7.1
