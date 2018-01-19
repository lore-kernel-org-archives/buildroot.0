From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 19 Jan 2018 12:17:43 -0600
Subject: [Buildroot] [PATCH 2/2] package/fmlib: Remove hash check
In-Reply-To: <20180119181743.30625-1-matthew.weber@rockwellcollins.com>
References: <20180119181743.30625-1-matthew.weber@rockwellcollins.com>
Message-ID: <20180119181743.30625-2-matthew.weber@rockwellcollins.com>
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
 package/fmlib/fmlib.hash | 2 --
 package/fmlib/fmlib.mk   | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)
 delete mode 100644 package/fmlib/fmlib.hash

diff --git a/package/fmlib/fmlib.hash b/package/fmlib/fmlib.hash
deleted file mode 100644
index 3746695db9..0000000000
--- a/package/fmlib/fmlib.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256	e5870756c7432b15f7a48b860625808f3c95d5f7fa5e251552eb2324ca51b0fa	fmlib-fsl-sdk-v2.0.tar.gz
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index e67ab1e5de..29d242a432 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -11,6 +11,8 @@ FMLIB_LICENSE_FILES = COPYING
 FMLIB_DEPENDENCIES = linux
 FMLIB_INSTALL_STAGING = YES
 
+BR_NO_CHECK_HASH_FOR += $(FMLIB_SOURCE)
+
 # This package installs a static library only, so there's
 # nothing to install to the target
 FMLIB_INSTALL_TARGET = NO
-- 
2.14.2
