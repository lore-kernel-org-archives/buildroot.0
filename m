From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jan 2020 15:51:24 +0100
Subject: [Buildroot] [git commit] package/snort: bump version to 2.9.15.1
Message-ID: <20200111144129.48AB88A542@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90a1652e908cda33f8932fdf4ddc3e0bb38ffeb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.net/results/17802b5ad87f494a86d158f2547e68edddcc0a68

  ../../src/util.h:377:21: error: static declaration of 'gettid' follows non-static declaration
   static inline pid_t gettid(void)
                       ^~~~~~
  In file included from .../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/unistd.h:1170,
                   from .../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/daq_common.h:25,
                   from .../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/daq.h:26,
                   from ../../src/decode.h:48,
                   from ../../src/spo_plugbase.h:31,
                   from ../../src/snort.h:36,
                   from sfcontrol.c:37:
  .../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/bits/unistd_ext.h:34:16: note: previous declaration of 'gettid' was here
   extern __pid_t gettid (void) __THROW;
                  ^~~~~~

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/snort/snort.hash | 2 +-
 package/snort/snort.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snort/snort.hash b/package/snort/snort.hash
index 898840dadc..7364df1330 100644
--- a/package/snort/snort.hash
+++ b/package/snort/snort.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 bfb437746446ef72a03c501db13cd6da5edd2b41f55c80c437ba288be6da7dba  snort-2.9.15.tar.gz
+sha256 2cccfc1d1a706586cd47ae9f085a7d5e4e36390b8e9c28cd2020b4b5b587f6c3  snort-2.9.15.1.tar.gz
 
 # Hash for license files:
 sha256 f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index 4006d176bf..0f1d6b13de 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT_VERSION = 2.9.15
+SNORT_VERSION = 2.9.15.1
 SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
