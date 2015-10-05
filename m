From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Mon,  5 Oct 2015 13:55:01 -0300
Subject: [Buildroot] [PATCH v2 1/2] axfsutils: add new package
In-Reply-To: <1444064102-13575-1-git-send-email-ariel@vanguardiasur.com.ar>
References: <1444064102-13575-1-git-send-email-ariel@vanguardiasur.com.ar>
Message-ID: <1444064102-13575-2-git-send-email-ariel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tools for building AXFS Filesystem.

The Advanced XIP File System is a Linux kernel filesystem driver that enables
files to be executed directly from flash or ROM memory rather than being copied
into RAM.

Source:
	https://github.com/jaredeh/axfs

Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
---
 package/axfsutils/axfsutils.mk | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/axfsutils/axfsutils.mk

diff --git a/package/axfsutils/axfsutils.mk b/package/axfsutils/axfsutils.mk
new file mode 100644
index 0000000..ce5b892
--- /dev/null
+++ b/package/axfsutils/axfsutils.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# axfsutils
+#
+################################################################################
+
+AXFSUTILS_VERSION = f26ae785e33df76f658b71ef2cfbc7f511ff875d
+AXFSUTILS_SITE = $(call github,jaredeh,axfs,$(AXFSUTILS_VERSION))
+AXFSUTILS_LICENSE = GPLv2
+AXFSUTILS_LICENSE_FILES = COPYING
+
+define HOST_AXFSUTILS_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/mkfs.axfs-legacy
+endef
+
+define HOST_AXFSUTILS_INSTALL_CMDS
+	cp $(@D)/mkfs.axfs-legacy/mkfs.axfs $(HOST_DIR)/usr/bin/
+endef
+
+$(eval $(host-generic-package))
-- 
1.9.1
