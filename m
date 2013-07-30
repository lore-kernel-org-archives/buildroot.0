From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jul 2013 23:26:56 +0200
Subject: [Buildroot] [git commit] libfuse: remove unused configure options
Message-ID: <20130730212952.9EA769AEBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b70b927391071f835433e802b269259fa3652269
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Current versions of libfuse do not recognize configure options
--disable-nls and --disable-kernel-module. Remove them.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfuse/libfuse.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 6057077..84ca922 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -11,9 +11,8 @@ LIBFUSE_LICENSE = GPLv2 LGPLv2.1
 LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
 LIBFUSE_INSTALL_STAGING = YES
 LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-LIBFUSE_CONF_OPT = --disable-nls \
+LIBFUSE_CONF_OPT = \
 		--disable-example \
-		--disable-kernel-module \
 		--enable-lib \
 		--enable-util
 
