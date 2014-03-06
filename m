From: Alvaro G. M <alvaro.gamez@hazent.com>
Date: Thu,  6 Mar 2014 09:53:33 +0100
Subject: [Buildroot] [PATCH 1/1] libxmlrpc: disable parallel build
In-Reply-To: <20140305154228.76f34797@skate>
References: <20140305154228.76f34797@skate>
Message-ID: <1394096013-18180-1-git-send-email-alvaro.gamez@hazent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although upstream tries to support parallel builds, there are several
dependencies that, if fixed, would end up making the library build
linearly, so in the end there would be no benefit to fix those.

Fixes:

  http://autobuild.buildroot.net/results/996/996fc95b302fb6dfc7cd9a468fd395226a36c6c4/

Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Alvaro G. M. <alvaro.gamez@hazent.com>
Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
---
 package/libxmlrpc/libxmlrpc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index 3d1af7e..ef120f9 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -12,6 +12,7 @@ LIBXMLRPC_LICENSE_FILES = doc/COPYING
 LIBXMLRPC_INSTALL_STAGING = YES
 LIBXMLRPC_DEPENDENCIES = libcurl
 LIBXMLRPC_CONFIG_SCRIPTS = xmlrpc-c-config
+LIBXMLRPC_MAKE = $(MAKE1)
 
 LIBXMLRPC_CONF_OPT = \
 	$(if $(BR2_USE_WCHAR),,ac_cv_header_wchar_h=no) \
-- 
1.9.0.rc3
