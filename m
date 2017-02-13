From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 13 Feb 2017 21:06:19 +0100
Subject: [Buildroot] [PATCH] glmark2: bump version
Message-ID: <20170213200619.10535-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package otherwise fails to build with a recent toolchain with GCC6
(tested with Linaro ARM 2016.11).

It used to fail at sqrt check during package configuration:
 Checking for function sqrt               : not found
 The configuration failed

Bumping version to latest HEAD fixes the issue as explained in the
following discussion:
https://github.com/glmark2/glmark2/issues/15

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/glmark2/glmark2.hash | 2 +-
 package/glmark2/glmark2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glmark2/glmark2.hash b/package/glmark2/glmark2.hash
index 7868b37d9..92c53e541 100644
--- a/package/glmark2/glmark2.hash
+++ b/package/glmark2/glmark2.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 421bdb87ed8c04a25f60816c7754d45e91a45136f5489df59d74001c159882b8 glmark2-fa71af2dfab711fac87b9504b6fc9862f44bf72a.tar.gz
+sha256 ea59bd267a88e2c773423eec43f7cb90b0ca1c369762e836dec575ebdcdcc012 glmark2-7215c0f337dae0b232535549c37fca441747a891.tar.gz
diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index e35e36a4e..f9631a0c3 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLMARK2_VERSION = fa71af2dfab711fac87b9504b6fc9862f44bf72a
+GLMARK2_VERSION = 7215c0f337dae0b232535549c37fca441747a891
 GLMARK2_SITE = $(call github,glmark2,glmark2,$(GLMARK2_VERSION))
 GLMARK2_LICENSE = GPLv3+ SGIv1
 GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
-- 
2.11.0
