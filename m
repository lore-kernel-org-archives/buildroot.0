From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 18:02:25 +0200
Subject: [Buildroot] [git commit] yaffs2utils: new package
Message-ID: <20140420161457.6A0449C7BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f27831ae132eab5524b4b3ecec8747c1e9471b3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: remove target variant of the package, use labelled version
0.2.9 instead of latest.tar.gz, use 'make install' instead of doing
manual installation, add license informations.]

Signed-off-by: Will Wagner <willw@carallon.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/yaffs2utils/yaffs2utils.mk |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/yaffs2utils/yaffs2utils.mk b/package/yaffs2utils/yaffs2utils.mk
new file mode 100644
index 0000000..ba24958
--- /dev/null
+++ b/package/yaffs2utils/yaffs2utils.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# yaffs2utils
+#
+#############################################################
+
+YAFFS2UTILS_VERSION = 0.2.9
+YAFFS2UTILS_SOURCE = $(YAFFS2UTILS_VERSION).tar.gz
+YAFFS2UTILS_SITE = https://yaffs2utils.googlecode.com/files/
+YAFFS2UTILS_LICENSE = GPLv2
+YAFFS2UTILS_LICENSE_FILES = COPYING
+
+define HOST_YAFFS2UTILS_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_YAFFS2UTILS_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) INSTALLDIR=$(HOST_DIR)/usr/bin install
+endef
+
+$(eval $(host-generic-package))
