From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 02:07:24 +0200
Subject: [Buildroot] [git commit] nfs-utils: Add rpcbind as a runtime
	dependency
Message-ID: <20150713000732.36E35818C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=182520a8af734c735c4dbdff29dc07af1d615a0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rpcbind is necessary for nfs_utils to works as a server

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nfs-utils/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 66f9c21..2806551 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_RPCBIND # runtime
 	depends on BR2_USE_MMU # fork()
 	help
 	  The NFS Linux kernel server.
