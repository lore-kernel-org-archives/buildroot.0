From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 17 Jul 2021 15:44:36 +0200
Subject: [Buildroot] [PATCH 3/3] package/nfs-utils: fix build with libtirpc
In-Reply-To: <20210717134436.995829-1-fontaine.fabrice@gmail.com>
References: <20210717134436.995829-1-fontaine.fabrice@gmail.com>
Message-ID: <20210717134436.995829-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Help nfs-utils to find the path of libtirpc

Fixes:
 - http://autobuild.buildroot.org/results/a5eaf19f58729c4c00a2131b6a0c378c0fc0effb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nfs-utils/nfs-utils.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 4e4cf93587..d36b3f2def 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -24,6 +24,7 @@ NFS_UTILS_CONF_OPTS = \
 	--with-rpcgen=$(HOST_DIR)/bin/rpcgen
 
 HOST_NFS_UTILS_CONF_OPTS = \
+	--enable-tirpc \
 	--disable-nfsv4 \
 	--disable-nfsv41 \
 	--disable-gss \
@@ -32,9 +33,9 @@ HOST_NFS_UTILS_CONF_OPTS = \
 	--without-tcp-wrappers \
 	--with-statedir=/run/nfs \
 	--disable-caps \
-	--disable-tirpc \
 	--without-systemd \
-	--with-rpcgen=internal
+	--with-rpcgen=internal \
+	--with-tirpcinclude=$(HOST_DIR)/include/tirpc
 HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc
 
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPCDEBUG) += usr/sbin/rpcdebug
-- 
2.30.2
