From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 22:46:12 +0100
Subject: [Buildroot] [git commit] atk: remove useless configuration options
Message-ID: <20130112215437.E40F2996EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8b95ee78a4cdf77ffcb86d30aee1a72e848e04cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ATK is not directly related to X11, and the --with-x, --x-includes,
--x-libraries and --without-x options do not exist.

The --disable-glibtest was duplicated, and is therefore still passed
to the configuration options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/atk/atk.mk |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 987a1cb..0453acb 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -41,14 +41,6 @@ ATK_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes \
 ATK_CONF_OPT =  --disable-glibtest --enable-explicit-deps=no \
 		--disable-debug
 
-ifeq ($(BR2_PACKAGE_XORG7),y)
-ATK_CONF_OPT += --with-x \
-		--x-includes=$(STAGING_DIR)/usr/include/X11 \
-		--x-libraries=$(STAGING_DIR)/usr/lib --disable-glibtest
-else
-ATK_CONF_OPT += --without-x
-endif
-
 ATK_DEPENDENCIES = libglib2 host-pkgconf
 
 HOST_ATK_CONF_OPT = \
