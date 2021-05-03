From: Christian Stewart <christian@paral.in>
Date: Sun,  2 May 2021 19:33:04 -0700
Subject: [Buildroot] [PATCH v1 2/3] package/fuse-overlayfs: enable building
 as host package
In-Reply-To: <20210503023305.161122-1-christian@paral.in>
References: <20210503023305.161122-1-christian@paral.in>
Message-ID: <20210503023305.161122-2-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in.host                   | 1 +
 package/fuse-overlayfs/Config.in.host    | 7 +++++++
 package/fuse-overlayfs/fuse-overlayfs.mk | 4 ++++
 3 files changed, 12 insertions(+)
 create mode 100644 package/fuse-overlayfs/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index ba6a68c728..0dbf63f2c8 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -27,6 +27,7 @@ menu "Host utilities"
 	source "package/f2fs-tools/Config.in.host"
 	source "package/faketime/Config.in.host"
 	source "package/fatcat/Config.in.host"
+	source "package/fuse-overlayfs/Config.in.host"
 	source "package/fwup/Config.in.host"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
diff --git a/package/fuse-overlayfs/Config.in.host b/package/fuse-overlayfs/Config.in.host
new file mode 100644
index 0000000000..cf459a4a2a
--- /dev/null
+++ b/package/fuse-overlayfs/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_FUSE_OVERLAYFS
+	bool "host fuse-overlayfs"
+	help
+	  FUSE-overlayfs is an implementation of overlay+shiftfs in
+	  FUSE, intended to be used for rootless containers.
+
+	  http://github.com/containers/fuse-overlayfs
\ No newline at end of file
diff --git a/package/fuse-overlayfs/fuse-overlayfs.mk b/package/fuse-overlayfs/fuse-overlayfs.mk
index 707cacce03..36cbfc91fd 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.mk
+++ b/package/fuse-overlayfs/fuse-overlayfs.mk
@@ -12,4 +12,8 @@ FUSE_OVERLAYFS_LICENSE_FILES = COPYING
 FUSE_OVERLAYFS_AUTORECONF = YES
 FUSE_OVERLAYFS_DEPENDENCIES = libfuse3 host-pkgconf
 
+HOST_FUSE_OVERLAYFS_AUTORECONF = YES
+HOST_FUSE_OVERLAYFS_DEPENDENCIES = host-libfuse3 host-pkgconf
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.31.1
