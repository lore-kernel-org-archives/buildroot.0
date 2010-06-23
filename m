From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jun 2010 11:27:29 +0200
Subject: [Buildroot] [git commit master 1/1] linux: Add dependency on
	host-module-init-tools
Message-ID: <20100623092836.57D0D81886@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dc4d5647a528b366d88d4c6f94405c12a1aa0ebf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to not depend on module init tools being installed on the
development environment of the Buildroot user, let's build module init
tools for the host.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk                                 |    2 +-
 package/module-init-tools/module-init-tools.mk |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 3e91eca..8b83e30 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -111,7 +111,7 @@ $(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
 	fi
 	$(Q)touch $@
 
-linux26: $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed
+linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed
 
 ifeq ($(BR2_LINUX_KERNEL),y)
 TARGETS+=linux26
diff --git a/package/module-init-tools/module-init-tools.mk b/package/module-init-tools/module-init-tools.mk
index 3e8b06b..ea7c014 100644
--- a/package/module-init-tools/module-init-tools.mk
+++ b/package/module-init-tools/module-init-tools.mk
@@ -17,3 +17,5 @@ MODULE_INIT_TOOLS_AUTORECONF=YES
 HOST_MODULE_INIT_TOOLS_AUTORECONF=YES
 
 $(eval $(call AUTOTARGETS,package,module-init-tools))
+$(eval $(call AUTOTARGETS,package,module-init-tools,host))
+
-- 
1.7.1
