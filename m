From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 11 Nov 2011 21:41:21 +0100
Subject: [Buildroot] [git commit branch/next] module-init-tools: bump to
	version 3.15
Message-ID: <20111111204300.A0D1E8F4FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c60be98b2d898e5d49b0fa305b7f56dec59a366
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...it-tools-3.15-add-manpages-config-option.patch} |    0
 package/module-init-tools/module-init-tools.mk     |   13 +++++++------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/module-init-tools/module-init-tools-3.11-add-manpages-config-option.patch b/package/module-init-tools/module-init-tools-3.15-add-manpages-config-option.patch
similarity index 100%
rename from package/module-init-tools/module-init-tools-3.11-add-manpages-config-option.patch
rename to package/module-init-tools/module-init-tools-3.15-add-manpages-config-option.patch
diff --git a/package/module-init-tools/module-init-tools.mk b/package/module-init-tools/module-init-tools.mk
index d7e7c24..ad92a1a 100644
--- a/package/module-init-tools/module-init-tools.mk
+++ b/package/module-init-tools/module-init-tools.mk
@@ -3,19 +3,20 @@
 # module-init-tools
 #
 #############################################################
-MODULE_INIT_TOOLS_VERSION=3.12
-MODULE_INIT_TOOLS_SOURCE=module-init-tools-$(MODULE_INIT_TOOLS_VERSION).tar.bz2
-MODULE_INIT_TOOLS_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/kernel/module-init-tools/
+
+MODULE_INIT_TOOLS_VERSION = 3.15
+MODULE_INIT_TOOLS_SOURCE = module-init-tools-$(MODULE_INIT_TOOLS_VERSION).tar.bz2
+MODULE_INIT_TOOLS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/module-init-tools/
 MODULE_INIT_TOOLS_CONF_ENV = ac_cv_prog_DOCBOOKTOMAN=''
 MODULE_INIT_TOOLS_CONF_OPT = \
 	--disable-static-utils \
 	--disable-builddir \
 	--program-transform-name=''
 
-# module-init-tools-3.11-add-manpages-config-option.patch is modifying
+# module-init-tools-3.15-add-manpages-config-option.patch is modifying
 # configure.ac and Makefile.am
-MODULE_INIT_TOOLS_AUTORECONF=YES
-HOST_MODULE_INIT_TOOLS_AUTORECONF=YES
+MODULE_INIT_TOOLS_AUTORECONF = YES
+HOST_MODULE_INIT_TOOLS_AUTORECONF = YES
 HOST_MODULE_INIT_TOOLS_CONF_ENV = ac_cv_prog_DOCBOOKTOMAN=''
 
 $(eval $(call AUTOTARGETS))
