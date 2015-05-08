From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Fri,  8 May 2015 14:27:49 +1000
Subject: [Buildroot] [PATCH 2/2] powerpc-utils: remove --without-librtas
In-Reply-To: <cover.1431059241.git.sam.bobroff@au1.ibm.com>
References: <cover.1431059241.git.sam.bobroff@au1.ibm.com>
Message-ID: <05714bb15869de4bead83eec7df5e9c9b0bd8fa7.1431059241.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that librtas is available, remove --without-librtas and make the
rtas-dependant functions available.

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
 package/powerpc-utils/Config.in        |    1 +
 package/powerpc-utils/powerpc-utils.mk |    3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/powerpc-utils/Config.in b/package/powerpc-utils/Config.in
index eded41e..a754899 100644
--- a/package/powerpc-utils/Config.in
+++ b/package/powerpc-utils/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_POWERPC_UTILS
 	bool "powerpc-utils"
 	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBRTAS
 	help
 	  System utilities for PowerPC machines.
 
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index 3b30458..3fb9e24 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -6,11 +6,10 @@
 
 POWERPC_UTILS_VERSION = 1.2.24
 POWERPC_UTILS_SITE = http://downloads.sourceforge.net/project/powerpc-utils/powerpc-utils
-POWERPC_UTILS_DEPENDENCIES = zlib
+POWERPC_UTILS_DEPENDENCIES = zlib librtas
 POWERPC_UTILS_LICENSE = Common Public License Version 1.0
 POWERPC_UTILS_LICENSE_FILES = COPYRIGHT
 
-POWERPC_UTILS_CONF_OPTS = --without-librtas
 POWERPC_UTILS_CONF_ENV = \
 	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
 
-- 
1.7.10.4
