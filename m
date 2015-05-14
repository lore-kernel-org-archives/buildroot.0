From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 14 May 2015 07:39:00 +0300
Subject: [Buildroot] [PATCH 2/2] Revert "kmod: disable --gc-sections ld
	option when building for xtensa"
In-Reply-To: <1431578340-11753-1-git-send-email-jcmvbkbc@gmail.com>
References: <1431578340-11753-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1431578340-11753-3-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 55c83179c4b30c9ec715a75297849abd74a63e05.
Now that binutils bug with --gc-section is fixed this workaroud is no
longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/kmod/kmod.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 1ac83ea..98d9998 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -39,11 +39,6 @@ KMOD_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
 KMOD_CONF_OPTS += --enable-python
 endif
 
-# --gc-sections triggers a bug in the current Xtensa binutils
-ifeq ($(BR2_xtensa),y)
-KMOD_CONF_ENV += cc_cv_LDFLAGS__Wl___gc_sections=no
-endif
-
 ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
 
 # add license info for kmod tools
-- 
1.8.1.4
