From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:31 +0100
Subject: [Buildroot] [PATCH 19/28] atk: remove useless configuration options
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fab626bf3a29d960cffe4ceac5f04205715fc0a8.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ATK is not directly related to X11, and the --with-x, --x-includes,
--x-libraries and --without-x options do not exist.

The --disable-glibtest was duplicated, and is therefore still passed
to the configuration options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/atk/atk.mk |    8 --------
 1 file changed, 8 deletions(-)

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
-- 
1.7.9.5
