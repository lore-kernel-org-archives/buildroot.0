From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Jul 2021 16:05:25 +0200
Subject: [Buildroot] [git commit] package/nfs-utils: fix build with libtirpc
Message-ID: <20210717133254.413CB9123B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=bdf0a924a7bfb28a4604bb18a4bb82b5fcc4cfb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Help nfs-utils to find the path of libtirpc

Fixes:
 - http://autobuild.buildroot.org/results/a5eaf19f58729c4c00a2131b6a0c378c0fc0effb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - take the opportunity to move HOST_NFS_UTILS_DEPENDENCIES
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nfs-utils/nfs-utils.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index ab000e1ead..51a35028e2 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -23,7 +23,10 @@ NFS_UTILS_CONF_OPTS = \
 	--with-statedir=/run/nfs \
 	--with-rpcgen=$(HOST_DIR)/bin/rpcgen
 
+HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc
+
 HOST_NFS_UTILS_CONF_OPTS = \
+	--enable-tirpc \
 	--disable-nfsv4 \
 	--disable-nfsv41 \
 	--disable-gss \
@@ -32,10 +35,9 @@ HOST_NFS_UTILS_CONF_OPTS = \
 	--without-tcp-wrappers \
 	--with-statedir=/run/nfs \
 	--disable-caps \
-	--disable-tirpc \
 	--without-systemd \
-	--with-rpcgen=internal
-HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc
+	--with-rpcgen=internal \
+	--with-tirpcinclude=$(HOST_DIR)/include/tirpc
 
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPCDEBUG) += usr/sbin/rpcdebug
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_LOCKD) += usr/sbin/rpc.lockd
