From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 17:39:34 +0200
Subject: [Buildroot] [git commit] flann: bump version to fix build with gcc 6
Message-ID: <20160524153957.B2CAD81F0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cfed4be8aea849577d6b49898f081887178fb37d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current version of flann in Buildroot fails to build with gcc 6.x,
with the following failure:

  error: call of overloaded 'abs(flann::KDTreeIndex<flann::L2<float> >::ElementType)' is ambiguous

By bumping the upstream version one commit further, we get an upstream
fix that fixes the build problem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flann/flann.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flann/flann.mk b/package/flann/flann.mk
index 8af58e3..af86a02 100644
--- a/package/flann/flann.mk
+++ b/package/flann/flann.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLANN_VERSION = 04b4a56533faf8c8228d011d05ba376038364b49
+FLANN_VERSION = 3645f0c30a47267e56e5acdecfc7bac2b76bc3d5
 FLANN_SITE = $(call github,mariusmuja,flann,$(FLANN_VERSION))
 FLANN_INSTALL_STAGING = YES
 FLANN_LICENSE = BSD-3c
