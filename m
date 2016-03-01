From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Mar 2016 14:33:47 +0100
Subject: [Buildroot] [git commit branch/next] radvd: bump to version 2.12
Message-ID: <20160301133523.99C927FC14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3096fbd58b03fba24d2166a01db7fcaeccb420b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

musl build patch is upstream so it's no longer necessary.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/radvd/radvd.hash | 5 ++---
 package/radvd/radvd.mk   | 6 ++----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/radvd/radvd.hash b/package/radvd/radvd.hash
index 3ace4fc..ac6014b 100644
--- a/package/radvd/radvd.hash
+++ b/package/radvd/radvd.hash
@@ -1,3 +1,2 @@
-# From http://www.litech.org/radvd/dist/radvd-2.11.tar.gz.sha256
-sha256	04636288fc79fa151260eeb2bea1b05942f59c31f01358c57f930a4eb45b5acc	radvd-2.11.tar.xz
-sha256	01d12bd2970fedf5695d9177a5ea45483d5e3c709ecceed636972c3049c47d0d	1d8973e13d89802eee0b648451e2b97ac65cf9e0.patch
+# From http://www.litech.org/radvd/dist/radvd-2.12.tar.gz.sha256
+sha256	b070e77238e789e298a82cba2b1bfb0b0180b4ebc1adfc4e75058adfdbff747b	radvd-2.12.tar.xz
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 503b62d..8b6e5b2 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-RADVD_VERSION = 2.11
+RADVD_VERSION = 2.12
 RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
 RADVD_SITE = http://www.litech.org/radvd/dist
-RADVD_PATCH = \
-	https://github.com/reubenhwk/radvd/commit/1d8973e13d89802eee0b648451e2b97ac65cf9e0.patch
 RADVD_DEPENDENCIES = host-bison flex host-flex host-pkgconf
 RADVD_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-# We're patching configure.ac/Makefile.am.
+# For 0002-Don-t-force-fstack-protector-the-toolchain-might-lac.patch
 RADVD_AUTORECONF = YES
 RADVD_LICENSE = BSD-4c-like
 RADVD_LICENSE_FILES = COPYRIGHT
