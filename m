From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 23 Nov 2014 14:20:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: Fix static build
Message-ID: <1416748839-5316-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/17d/17d1d94e6f1617851e374f4fe9804f1e5ea9e99f/
http://autobuild.buildroot.net/results/c08/c08b7be40c8f208147a4f95ad897e4a1df7e108d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/nfs-utils/nfs-utils.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 522e790..4049024 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -29,6 +29,9 @@ NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD) += usr/sbin/rpc.rquotad
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 NFS_UTILS_CONF_OPTS += --enable-tirpc --with-tirpcinclude=$(STAGING_DIR)/usr/include/tirpc/
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+NFS_UTILS_CONF_ENV += LIBS="-lpthread"
+endif
 NFS_UTILS_DEPENDENCIES += libtirpc
 else
 NFS_UTILS_CONF_OPTS += --disable-tirpc
-- 
1.7.10.4
