From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Oct 2014 22:21:24 +0200
Subject: [Buildroot] [git commit] ti-utils: link with pthread to avoid build
	failure
Message-ID: <20141007203313.44205B0F27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ae29cdfe0b04a0a824463f462d2fd6dc26b8d9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add '-lpthread' option to LIBS in ti-utils.mk file
to link this package with pthread

Fixes:
http://autobuild.buildroot.net/results/132/132072d849a3ec572aa80e51833bf6906a54400a//

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ti-utils/ti-utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index c0a3663..7ee7afa 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -13,7 +13,7 @@ TI_UTILS_LICENSE_FILES = COPYING
 define TI_UTILS_BUILD_CMDS
 	$(MAKE1) NFSROOT="$(STAGING_DIR)" \
 		CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -I$(STAGING_DIR)/usr/include/libnl3" \
-		LIBS="-lnl-3 -lnl-genl-3 -lm" -C $(@D) all
+		LIBS="-lnl-3 -lnl-genl-3 -lpthread -lm" -C $(@D) all
 endef
 
 define TI_UTILS_INSTALL_TARGET_CMDS
