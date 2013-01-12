From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 21:39:02 +0100
Subject: [Buildroot] [git commit] libnl: bump to version 3.2.18
Message-ID: <20130112204056.1104D8013D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0af470265b80efe8f213644f4488537c017e8089
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 3.2.18, fixing:
http://autobuild.buildroot.org/results/28f23910e2c2090e6f37e8d6a26cdb5adf9615c2

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnl/libnl.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 12494f4..35b2a51 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBNL_VERSION = 3.2.17
+LIBNL_VERSION = 3.2.18
 LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files
 LIBNL_LICENSE = LGPLv2.1+
 LIBNL_LICENSE_FILES = COPYING
@@ -22,6 +22,7 @@ endef
 
 define LIBNL_REMOVE_TOOLS
 	rm -rf $(addprefix $(TARGET_DIR)/usr/sbin/nl-, $(LIBNL_BINARIES))
+	rm -rf $(TARGET_DIR)/usr/sbin/genl-ctrl-list
 endef
 
 ifneq ($(BR2_PACKAGE_LIBNL_TOOLS),y)
