From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 19 Jan 2018 12:17:42 -0600
Subject: [Buildroot] [PATCH 1/2] package/fmc: Remove hash check
Message-ID: <20180119181743.30625-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package uses a kconfig value for the version,
so ignore the hash check which will fail when the
user specifies something other then the kconfig default.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/fmc/fmc.hash | 2 --
 package/fmc/fmc.mk   | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)
 delete mode 100644 package/fmc/fmc.hash

diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
deleted file mode 100644
index 13d9d77ee5..0000000000
--- a/package/fmc/fmc.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256	a91e0c9b7c7f238634c64a755c05671f33f2acdb6ae2d09cad4d683b364ee8e4	fmc-fsl-sdk-v2.0.tar.gz
diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index 2a95fec0b7..5dda914858 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -10,6 +10,8 @@ FMC_LICENSE = MIT
 FMC_LICENSE_FILES = COPYING
 FMC_DEPENDENCIES = libxml2 tclap fmlib
 
+BR_NO_CHECK_HASH_FOR += $(FMC_SOURCE)
+
 FMC_MAKE_OPTS = \
 	CC="$(TARGET_CC)" \
 	CXX="$(TARGET_CXX)" \
-- 
2.14.2
