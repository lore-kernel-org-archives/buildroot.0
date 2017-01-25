From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 22:38:30 +0100
Subject: [Buildroot] [git commit] micropython-lib: Indicate that pcre is a
	runtime dependency
Message-ID: <20170125213857.96B6981F7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f923eed010061f1d3c26332cb681f6d54c44225e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libpcre is needed at runtime not a buildtime. Indicate this in Config.in
and remove MICROPYTHON_LIB_DEPENDENCIES.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/micropython-lib/Config.in          | 2 +-
 package/micropython-lib/micropython-lib.mk | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/micropython-lib/Config.in b/package/micropython-lib/Config.in
index be8c875..599af77 100644
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
index 8c8b142..066572e 100644
--- a/package/micropython-lib/micropython-lib.mk
+++ b/package/micropython-lib/micropython-lib.mk
@@ -8,7 +8,6 @@ MICROPYTHON_LIB_VERSION = v1.8.6
 MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,$(MICROPYTHON_LIB_VERSION))
 MICROPYTHON_LIB_LICENSE = Python software foundation license v2 (some modules), MIT (everything else)
 MICROPYTHON_LIB_LICENSE_FILES = LICENSE
-MICROPYTHON_LIB_DEPENDENCIES = pcre
 
 define MICROPYTHON_LIB_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
