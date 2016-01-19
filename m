From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 21:29:05 +0100
Subject: [Buildroot] [git commit] spi-tools: bump to version 0.8.1
Message-ID: <20160119202909.2534F82755@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=628ee06f07821803f6c70207bbdfb51db609aa49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version doesn't use GIT_VERSION anymore, so the sed hook is no
longer necessary.

Fixes http://autobuild.buildroot.net/results/ed89fae4a722b5d2adff9826bb88e55e58af77f6

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/spi-tools/spi-tools.hash |  2 +-
 package/spi-tools/spi-tools.mk   | 12 +-----------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/package/spi-tools/spi-tools.hash b/package/spi-tools/spi-tools.hash
index 61ccd5e..25c7381 100644
--- a/package/spi-tools/spi-tools.hash
+++ b/package/spi-tools/spi-tools.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256	52ab1f1de29afbac95983f5af58adcb1807e1f3479a897e9331e020b5cfa296f  spi-tools-cc6a41fdcec60610703ba6db488c621c64952898.tar.gz
+sha256	72a6c4a9d13011addc61bc3906543cd06f76f567270ae4b6ca4d0115fd6a9538 spi-tools-0.8.1.tar.gz
diff --git a/package/spi-tools/spi-tools.mk b/package/spi-tools/spi-tools.mk
index f3df435..384ae41 100644
--- a/package/spi-tools/spi-tools.mk
+++ b/package/spi-tools/spi-tools.mk
@@ -4,21 +4,11 @@
 #
 ################################################################################
 
-# git commit sha1 is used as there is no release tag with autotools support yet
-SPI_TOOLS_VERSION = cc6a41fdcec60610703ba6db488c621c64952898
+SPI_TOOLS_VERSION = 0.8.1
 SPI_TOOLS_SITE = $(call github,cpb-,spi-tools,$(SPI_TOOLS_VERSION))
 # autoreconf must be run as specified in package documentation
 SPI_TOOLS_AUTORECONF = YES
 SPI_TOOLS_LICENSE = GPLv2
 SPI_TOOLS_LICENSE_FILES = LICENSE
 
-# Package attempts to use git to obtain version, that fails within Buildroot.
-# To avoid it, set the GIT_VERSION variable to the Buildroot package version.
-define SPI_TOOLS_SET_VERSION
-	$(SED) "s/^\(GIT_VERSION:=\).*/\1$(SPI_TOOLS_VERSION)/" \
-		$(@D)/src/Makefile.am
-endef
-
-SPI_TOOLS_POST_PATCH_HOOKS = SPI_TOOLS_SET_VERSION
-
 $(eval $(autotools-package))
