From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon,  7 Jul 2008 22:41:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/docker
Message-ID: <20080708054144.507E03C67C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-07 22:41:44 -0700 (Mon, 07 Jul 2008)
New Revision: 22682

Log:
Add glib2.0 specific include/pkconfig paths in 'docker'

Modified:
   trunk/buildroot/package/docker/docker.mk


Changeset:
Modified: trunk/buildroot/package/docker/docker.mk
===================================================================
--- trunk/buildroot/package/docker/docker.mk	2008-07-08 05:14:36 UTC (rev 22681)
+++ trunk/buildroot/package/docker/docker.mk	2008-07-08 05:41:44 UTC (rev 22682)
@@ -11,10 +11,13 @@
 DOCKER_INSTALL_TARGET = YES
 
 DOCKER_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_LD) \
-					CFLAGS="-I$(STAGING_DIR)/usr/include" \
+					CFLAGS="-I$(STAGING_DIR)/usr/include \
+						-I$(STAGING_DIR)/usr/include/glib-2.0 \
+						-I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
 					LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
 					PKGCONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
-					PKG_CONFIG_SYSROOT="$(STAGING_DIR)"
+					PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
+					PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
 
 DOCKER_INSTALL_TARGET_OPT = PREFIX=$(TARGET_DIR)/usr install
 
