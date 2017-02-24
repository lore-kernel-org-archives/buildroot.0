From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Feb 2017 10:40:06 +0100
Subject: [Buildroot] [PATCH] package/libepoxy: needs host-pkgconf
Message-ID: <1487929206-9186-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

configure.ac uses PKG_CHECK_MODULES() so it needs host-pkgconf.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libepoxy/libepoxy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libepoxy/libepoxy.mk b/package/libepoxy/libepoxy.mk
index 7436e8f..1dd583e 100644
--- a/package/libepoxy/libepoxy.mk
+++ b/package/libepoxy/libepoxy.mk
@@ -9,7 +9,7 @@ LIBEPOXY_SITE = $(call github,anholt,libepoxy,$(LIBEPOXY_VERSION))
 LIBEPOXY_INSTALL_STAGING = YES
 # For patches 0001-0006:
 LIBEPOXY_AUTORECONF = YES
-LIBEPOXY_DEPENDENCIES = xutil_util-macros
+LIBEPOXY_DEPENDENCIES = host-pkgconf xutil_util-macros
 LIBEPOXY_LICENSE = MIT
 LIBEPOXY_LICENSE_FILES = COPYING
 
-- 
2.7.4
