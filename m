From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 19:06:39 +0100
Subject: [Buildroot] [git commit] package/numactl: bump version to 2.0.11,
	add hash
Message-ID: <20160207181655.0DE527FA37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86028a62d4a7d0bc7cb85474964abd42e90df420
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tarball contains a working configure script, therefore removed
autoreconf.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/numactl/numactl.hash | 2 ++
 package/numactl/numactl.mk   | 5 +----
 2 files changed, 3 insertions(+), 4 deletions(-)

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
