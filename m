From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:10 +0200
Subject: [Buildroot] [PATCH 03/24] attr: drop unused host variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-4-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/attr/attr.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index 4d5a07df0bcf..6883287aeacf 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -9,7 +9,6 @@ ATTR_SOURCE = attr-$(ATTR_VERSION).src.tar.gz
 ATTR_SITE = http://download.savannah.gnu.org/releases/attr
 ATTR_INSTALL_STAGING = YES
 ATTR_CONF_OPTS = --enable-gettext=no
-HOST_ATTR_CONF_OPTS = --enable-gettext=no
 ATTR_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
 ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 
@@ -27,11 +26,6 @@ ATTR_INSTALL_TARGET_OPTS = \
 	exec_prefix=$(TARGET_DIR)/usr \
 	install install-lib
 
-HOST_ATTR_INSTALL_OPTS = \
-	prefix=$(HOST_DIR)/usr \
-	exec_prefix=$(HOST_DIR)/usr \
-	install-dev install-lib
-
 # The libdir variable in libattr.la is empty, so let's fix it. This is
 # probably due to attr not using automake, and not doing fully the
 # right thing with libtool.
@@ -43,4 +37,3 @@ endef
 ATTR_POST_INSTALL_STAGING_HOOKS += ATTR_FIX_LIBTOOL_LA_LIBDIR
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.1.0
