From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 10:18:09 +0100
Subject: [Buildroot] [PATCH 1/2] package/numactl: bump version to 2.0.11,
	add hash
Message-ID: <1454145490-11822-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tarball contains a working configure script, therefore removed
autoreconf.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/numactl/numactl.hash | 2 ++
 package/numactl/numactl.mk   | 5 +----
 2 files changed, 3 insertions(+), 4 deletions(-)
 create mode 100644 package/numactl/numactl.hash

diff --git a/package/numactl/numactl.hash b/package/numactl/numactl.hash
new file mode 100644
index 0000000..c36e24d
--- /dev/null
+++ b/package/numactl/numactl.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	450c091235f891ee874a8651b179c30f57a1391ca5c4673354740ba65e527861	numactl-2.0.11.tar.gz
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index c9ea945..6e1d5e3 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -4,13 +4,10 @@
 #
 ################################################################################
 
-NUMACTL_VERSION = 2.0.10
+NUMACTL_VERSION = 2.0.11
 NUMACTL_SITE = ftp://oss.sgi.com/www/projects/libnuma/download
 NUMACTL_LICENSE = LGPLv2.1 (libnuma), GPLv2 (programs)
 NUMACTL_LICENSE_FILES = README
 NUMACTL_INSTALL_STAGING = YES
 
-# numactl tarball doesn't contain a pregenerated configure script.
-NUMACTL_AUTORECONF = YES
-
 $(eval $(autotools-package))
-- 
2.7.0.rc3
