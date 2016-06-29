From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:20 +0200
Subject: [Buildroot] [PATCH 13/24] pax-utils: drop unused host variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-14-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/pax-utils/pax-utils.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/pax-utils/pax-utils.mk b/package/pax-utils/pax-utils.mk
index 747c2bb1145b..5c3238281dc0 100644
--- a/package/pax-utils/pax-utils.mk
+++ b/package/pax-utils/pax-utils.mk
@@ -27,9 +27,6 @@ else
 PAX_UTILS_CONF_OPTS += --without-seccomp
 endif
 
-# libcap is only useful for pspax (a running system)
-HOST_PAX_UTILS_DEPENDENCIES =
-
 # lddtree and symtree need bash
 ifeq ($(BR2_PACKAGE_BASH),)
 define PAX_UTILS_REMOVE_BASH_TOOLS
@@ -39,4 +36,3 @@ endif
 PAX_UTILS_POST_INSTALL_TARGET_HOOKS += PAX_UTILS_REMOVE_BASH_TOOLS
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.1.0
