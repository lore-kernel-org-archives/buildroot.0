From: Joel Stanley <joel@jms.id.au>
Date: Tue, 25 Jun 2019 11:23:40 +0930
Subject: [Buildroot] [PATCH] pdbg: Bump version to v2.2
Message-ID: <20190625015340.6531-1-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream changes:

 - libpdbg API clean-up
 - Path based targetting
 - POWER8 sreset fixes
 - gdbserver

This also adds the v back to the version string that pdbg's build system
uses, following the recent buildroot changes to remove "v" from package
versions.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/pdbg/pdbg.hash | 2 +-
 package/pdbg/pdbg.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pdbg/pdbg.hash b/package/pdbg/pdbg.hash
index 35a26eddddc6..b856e4ce8c0c 100644
--- a/package/pdbg/pdbg.hash
+++ b/package/pdbg/pdbg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 da65ebbd9a710555e9684472ee36fff37e897111034fcc2c07172cc39016d169 pdbg-2.0.tar.gz
+sha256 b3bd93475da1e68502732309fa274514fb0a1193d574adfd68d5feeabeb30571  pdbg-2.2.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
index c92920a6d619..97832f23d189 100644
--- a/package/pdbg/pdbg.mk
+++ b/package/pdbg/pdbg.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-PDBG_VERSION = 2.0
+PDBG_VERSION = 2.2
 PDBG_SITE = $(call github,open-power,pdbg,v$(PDBG_VERSION))
 PDBG_LICENSE = Apache-2.0
 PDBG_LICENSE_FILES = COPYING
 PDBG_AUTORECONF = YES
 PDBG_DEPENDENCIES = host-dtc
 
-PDBG_MAKE_OPTS = "GIT_SHA1=\"$(PDBG_VERSION)\""
+PDBG_MAKE_OPTS = "GIT_SHA1=\"v$(PDBG_VERSION)\""
 
 define PDBG_PATCH_M4
 	mkdir -p $(@D)/m4
-- 
2.20.1
