From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 25 Jan 2017 20:24:47 +1300
Subject: [Buildroot] [PATCH] micropython-lib: Indicate that pcre is a
	runtime dependency
Message-ID: <20170125072447.23526-1-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libpcre is needed at runtime not a buildtime. Indicate this in Config.in
and remove MICROPYTHON_LIB_DEPENDENCIES.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/micropython-lib/Config.in          | 2 +-
 package/micropython-lib/micropython-lib.mk | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/micropython-lib/Config.in b/package/micropython-lib/Config.in
index be8c87562..599af7797 100644
--- a/package/micropython-lib/Config.in
+++ b/package/micropython-lib/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_MICROPYTHON_LIB
 	bool "micropython-lib"
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE # runtime
 	depends on BR2_PACKAGE_MICROPYTHON
 	help
 	  Core Python libraries ported to MicroPython.
diff --git a/package/micropython-lib/micropython-lib.mk b/package/micropython-lib/micropython-lib.mk
index 8c8b1426f..066572e5c 100644
--- a/package/micropython-lib/micropython-lib.mk
+++ b/package/micropython-lib/micropython-lib.mk
@@ -8,7 +8,6 @@ MICROPYTHON_LIB_VERSION = v1.8.6
 MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,$(MICROPYTHON_LIB_VERSION))
 MICROPYTHON_LIB_LICENSE = Python software foundation license v2 (some modules), MIT (everything else)
 MICROPYTHON_LIB_LICENSE_FILES = LICENSE
-MICROPYTHON_LIB_DEPENDENCIES = pcre
 
 define MICROPYTHON_LIB_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-- 
2.11.0.24.ge6920cf
