From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:35 +0200
Subject: [Buildroot] [PATCH 66/69] pax-utils: remove empty host dependencies
	definition
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-67-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/pax-utils/pax-utils.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/pax-utils/pax-utils.mk b/package/pax-utils/pax-utils.mk
index 747c2bb1145b..8d5f3eea73c7 100644
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
-- 
2.1.0
