From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jun 2015 03:15:23 +0200
Subject: [Buildroot] [git commit] gcc/gcc-final: install libatomic via
	HOST_GCC_FINAL_GCC_LIB_DIR
Message-ID: <20150606011527.1635681E45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1cf34a39538e58ecf50d091482b2304c2f7e6d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it's a no-op for sh4.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 8d7009b..16bf4ee 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -131,9 +131,9 @@ endef
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBGCC
 
 define HOST_GCC_FINAL_INSTALL_LIBATOMIC
-	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libatomic* \
+	-cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/libatomic* \
 		$(STAGING_DIR)/lib/
-	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libatomic* \
+	-cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/libatomic* \
 		$(TARGET_DIR)/lib/
 endef
 
