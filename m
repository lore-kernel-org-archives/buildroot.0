From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 12:32:23 +0200
Subject: [Buildroot] [git commit] package/yaffs2utils: create
 $(HOST_DIR)/bin before installation
Message-ID: <20190421102949.10D9B81441@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01a0bd3f739ce1284a89641b7f41705c57b5bd04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The yaffs2utils Makefile uses plain "cp", which fails when
$(HOST_DIR)/bin doesn't exist. Fix that by creationg $(HOST_DIR)/bin
beforehand.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339624

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/yaffs2utils/yaffs2utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/yaffs2utils/yaffs2utils.mk b/package/yaffs2utils/yaffs2utils.mk
index c2a87eac7b..d3a8bdc9d2 100644
--- a/package/yaffs2utils/yaffs2utils.mk
+++ b/package/yaffs2utils/yaffs2utils.mk
@@ -15,6 +15,7 @@ define HOST_YAFFS2UTILS_BUILD_CMDS
 endef
 
 define HOST_YAFFS2UTILS_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/bin
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) INSTALLDIR=$(HOST_DIR)/bin install
 endef
 
