From: Victor Huesca <victor.huesca@bootlin.com>
Date: Tue,  9 Jul 2019 09:45:51 +0200
Subject: [Buildroot] [PATCH 3/3] package: remove non-conventional
 prefix/suffix from git-fetched packages
In-Reply-To: <20190709074551.22747-1-victor.huesca@bootlin.com>
References: <20190709074551.22747-1-victor.huesca@bootlin.com>
Message-ID: <20190709074551.22747-4-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While many project name their git tags <version> where <version> is
just the version number, some project add other prefix/suffix to their
version number. In these laters, the suffix/suffix is often simply 'v',
'release' or the package name, but there are some weirder naming. This
patch aims to fix these special cases.

In Buildroot, we currently encode the full version (with its
prefix/suffix) in the <pkg>_VERSION variable. However, that doesn't
work well to match version numbers with the release-monitoring.org
website, which filters such prefixes/suffixes.

This commit rely on the '<pkg>_DL_VERSION' variable, so dl archive
name are unchanged.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 package/brickd/brickd.mk     | 3 ++-
 package/ctorrent/ctorrent.mk | 3 ++-
 package/fmc/fmc.mk           | 3 ++-
 package/fmlib/fmlib.mk       | 3 ++-
 package/rcw/rcw.mk           | 3 ++-
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/brickd/brickd.mk b/package/brickd/brickd.mk
index 7fe28daf78..66865f00e1 100644
--- a/package/brickd/brickd.mk
+++ b/package/brickd/brickd.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-BRICKD_VERSION = ev3dev-stretch/1.2.1
+BRICKD_VERSION = 1.2.1
+BRICKD_DL_VERSION = ev3dev-stretch/$(BRICKD_VERSION)
 BRICKD_SITE = https://github.com/ev3dev/brickd
 BRICKD_SITE_METHOD = git
 BRICKD_GIT_SUBMODULES = YES
diff --git a/package/ctorrent/ctorrent.mk b/package/ctorrent/ctorrent.mk
index 959e543f7b..26bfcc335e 100644
--- a/package/ctorrent/ctorrent.mk
+++ b/package/ctorrent/ctorrent.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-CTORRENT_VERSION = dnh3.3.2
+CTORRENT_VERSION = 3.3.2
+CTORRENT_DL_VERSION = dnh$(CTORRENT_VERSION)
 CTORRENT_SITE = http://www.rahul.net/dholmes/ctorrent
 CTORRENT_LICENSE = GPL-2.0
 CTORRENT_LICENSE_FILES = COPYING
diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index 2a95fec0b7..db1ac8509a 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-FMC_VERSION = fsl-sdk-v2.0
+FMC_VERSION = 2.0
+FMC_DL_VERSION = fsl-sdk-v$(FMC_VERSION)
 FMC_SITE = git://git.freescale.com/ppc/sdk/fmc.git
 FMC_LICENSE = MIT
 FMC_LICENSE_FILES = COPYING
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index e67ab1e5de..a5813e948b 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-FMLIB_VERSION = fsl-sdk-v2.0
+FMLIB_VERSION = 2.0
+FMLIB_DL_VERSION = fsl-sdk-v$(FMLIB_VERSION)
 FMLIB_SITE = git://git.freescale.com/ppc/sdk/fmlib.git
 FMLIB_LICENSE = BSD-3-Clause, GPL-2.0+
 FMLIB_LICENSE_FILES = COPYING
diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk
index f4570b9bde..53b4cc2a30 100644
--- a/package/rcw/rcw.mk
+++ b/package/rcw/rcw.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-RCW_VERSION = LSDK-18.12
+RCW_VERSION = 18.12
+RCW_DL_VERSION = LSDK-$(RCW_VERSION)
 RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
 RCW_SITE_METHOD = git
 RCW_LICENSE = BSD-3-Clause
-- 
2.21.0
