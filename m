From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 17 Nov 2010 23:21:45 +0100
Subject: [Buildroot] [git commit master 1/1] module-init-tools: fix
	configure bug by bumping to 3.12
Message-ID: <20101117222502.E37178E964@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7be90dae8adc8d98b57dc4bc21630d8671523350
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

3.11 fails to configure/compile for my host (F14) due to bug
in ax_enable_builddir.m4

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                        |    2 +-
 package/module-init-tools/module-init-tools.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 39b7cd3..b4e003b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: libglib2, qt
+	Updated/fixed packages: libglib2, module-init-tools, qt
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/module-init-tools/module-init-tools.mk b/package/module-init-tools/module-init-tools.mk
index 5dfdaad..27d0159 100644
--- a/package/module-init-tools/module-init-tools.mk
+++ b/package/module-init-tools/module-init-tools.mk
@@ -3,7 +3,7 @@
 # module-init-tools
 #
 #############################################################
-MODULE_INIT_TOOLS_VERSION=3.11
+MODULE_INIT_TOOLS_VERSION=3.12
 MODULE_INIT_TOOLS_SOURCE=module-init-tools-$(MODULE_INIT_TOOLS_VERSION).tar.bz2
 MODULE_INIT_TOOLS_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/kernel/module-init-tools/
 MODULE_INIT_TOOLS_CONF_ENV = ac_cv_prog_DOCBOOKTOMAN=''
-- 
1.7.1
