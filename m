From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Feb 2017 22:37:09 +0100
Subject: [Buildroot] [git commit] glmark2: bump version to fix build
Message-ID: <20170213213728.2F196821E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b8b4f7bfe50a33bbda9ed0cbbdc5170c3147625
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package otherwise fails to build with a recent toolchain with GCC6
(tested with Linaro ARM 2016.11).

It used to fail at sqrt check during package configuration:
 Checking for function sqrt               : not found
 The configuration failed

Bumping version to latest HEAD fixes the issue as explained in the
following discussion:
https://github.com/glmark2/glmark2/issues/15

Fixes:

  http://autobuild.buildroot.net/results/8dc9400505b9087ce290981d95486598df0beb56/

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
[Thomas: add reference to autobuilder failure.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glmark2/glmark2.hash | 2 +-
 package/glmark2/glmark2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glmark2/glmark2.hash b/package/glmark2/glmark2.hash
index 7868b37..92c53e5 100644
--- a/package/glmark2/glmark2.hash
+++ b/package/glmark2/glmark2.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 421bdb87ed8c04a25f60816c7754d45e91a45136f5489df59d74001c159882b8 glmark2-fa71af2dfab711fac87b9504b6fc9862f44bf72a.tar.gz
+sha256 ea59bd267a88e2c773423eec43f7cb90b0ca1c369762e836dec575ebdcdcc012 glmark2-7215c0f337dae0b232535549c37fca441747a891.tar.gz
diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index e35e36a..f9631a0 100644
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
