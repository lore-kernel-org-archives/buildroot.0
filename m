From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2016 14:44:35 +0100
Subject: [Buildroot] [git commit] package/unionfs: fix musl build
Message-ID: <20160201224708.479C67F892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b65ce4caed9b8b7d673af6e1c17d3122951ad1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/020/020951a32ace3b4bca12a888eaaeb8b6c5633e4f/

[Peter: notice patch is now upstream:
 https://github.com/rpodgorny/unionfs-fuse/commit/f64b094eba93b042a1ed5964]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unionfs/unionfs.hash | 1 +
 package/unionfs/unionfs.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/unionfs/unionfs.hash b/package/unionfs/unionfs.hash
index fce98e0..c843a0e 100644
--- a/package/unionfs/unionfs.hash
+++ b/package/unionfs/unionfs.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256	2ee80bd0634a61adb2159212e155d607a0a82ad659214ae6edb3530396cccc09	unionfs-1.0.tar.gz
+sha256	c8526f80448f344fba0100e5510793b6de985b24a8b526d9a6803bcd713d9de2	0001-include-asm-ioctl.h-for-_IOC_SIZE.patch
diff --git a/package/unionfs/unionfs.mk b/package/unionfs/unionfs.mk
index cba52be..0fa9c94 100644
--- a/package/unionfs/unionfs.mk
+++ b/package/unionfs/unionfs.mk
@@ -6,6 +6,8 @@
 
 UNIONFS_VERSION = 1.0
 UNIONFS_SITE = $(call github,rpodgorny,unionfs-fuse,v$(UNIONFS_VERSION))
+UNIONFS_PATCH = \
+	http://git.alpinelinux.org/cgit/aports/plain/main/unionfs-fuse/0001-include-asm-ioctl.h-for-_IOC_SIZE.patch
 UNIONFS_DEPENDENCIES = libfuse host-pkgconf
 UNIONFS_LICENSE = BSD-3c
 UNIONFS_LICENSE_FILES = LICENSE
