From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 18:22:42 +0100
Subject: [Buildroot] [git commit] libxmlrpc: disable parallel build
Message-ID: <20140306172251.8378F9BDCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1af0b6ee90f2253d5d37b5bb2b87555eddca59e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although upstream tries to support parallel builds, there are several
dependencies that, if fixed, would end up making the library build
linearly, so in the end there would be no benefit to fix those.

Fixes:

  http://autobuild.buildroot.net/results/996/996fc95b302fb6dfc7cd9a468fd395226a36c6c4/

Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Alvaro G. M. <alvaro.gamez@hazent.com>
Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxmlrpc/libxmlrpc.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
