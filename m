From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 May 2015 12:35:52 +0200
Subject: [Buildroot] [git commit] libstrophe: install into target
Message-ID: <20150527103736.07BF07FC60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb7d670e8e35da3bd1d2322f4a74312f2344e9da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since a7134ce6745 (libstrophe: bump version), the package does in fact build
and install a shared library, so ensure it also ends up in target so it can
be found at runtime.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libstrophe/libstrophe.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index d7202d7..8493692 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -10,11 +10,7 @@ LIBSTROPHE_DEPENDENCIES = openssl host-pkgconf
 LIBSTROPHE_AUTORECONF = YES
 LIBSTROPHE_LICENSE = MIT or GPLv3
 LIBSTROPHE_LICENSE_FILES = MIT-LICENSE.txt GPL-LICENSE.txt
-
-# This package does not build a dynamic library, so there is nothing
-# to be installed to the target.
 LIBSTROPHE_INSTALL_STAGING = YES
-LIBSTROPHE_INSTALL_TARGET = NO
 
 ifeq ($(BR2_PACKAGE_EXPAT),y)
 # Passing --without-libxml2 doesn't work, due to how AC_ARG_WITH is
