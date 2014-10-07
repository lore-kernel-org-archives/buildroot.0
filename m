From: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Date: Tue, 7 Oct 2014 20:54:08 +0530
Subject: [Buildroot] [PATCH] ti-utils: link with pthread to avoid build
	failure
Message-ID: <1412695448-3117-1-git-send-email-yuvaraj.patil@wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add '-lpthread' option to LIBS in ti-utils.mk file
to link this package with pthread

Fixes:
http://autobuild.buildroot.net/results/132/132072d849a3ec572aa80e51833bf6906a54400a//

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
---
 package/ti-utils/ti-utils.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.7.9.5
