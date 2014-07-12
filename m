From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 12 Jul 2014 14:27:04 -0300
Subject: [Buildroot] [PATCH 3/3] wget: remove redundant gettextize run
In-Reply-To: <1405186024-8170-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405186024-8170-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1405186024-8170-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wget/wget.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 56ccfb5..c546aba 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -13,14 +13,6 @@ WGET_LICENSE_FILES = COPYING
 # patching gnulib .m4 file
 WGET_AUTORECONF = YES
 
-# Ugly kludge to fix autoreconf with old gettext infra
-# We need to gettextize before autoreconf to upgrade
-WGET_DEPENDENCIES += host-gettext
-define WGET_GETTEXTIZE
-	cd $(@D) ; $(HOST_DIR)/usr/bin/gettextize -f
-endef
-WGET_PRE_CONFIGURE_HOOKS += WGET_GETTEXTIZE
-
 # Prefer full-blown wget over busybox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	WGET_DEPENDENCIES += busybox
-- 
1.8.5.5
