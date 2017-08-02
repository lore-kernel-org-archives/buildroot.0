From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 21:37:46 +0200
Subject: [Buildroot] [git commit] isl: bump to version 0.18
Message-ID: <20170802193535.2FF097FA27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94afc741a0cd837d9549c346babc5b8be68dea5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we no longer support Graphite optimizations in gcc 4.9 (which
required ISL 0.14.1), we can bump ISL to a newer version, which allows
to support Graphite optimizations in GCC >= 5.x.

The comment about the version being limited to 0.14.1 because of cloog
is no longer relevant, so it is removed.

Our libtool patch now applies properly, so we can remove
ISL_LIBTOOL_PATCH = NO.

Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
[Thomas:
 - remove ISL_LIBTOOL_PATCH = NO
 - improved commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/isl/isl.hash | 2 +-
 package/isl/isl.mk   | 9 +--------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/isl/isl.hash b/package/isl/isl.hash
index e2c14ad..43e5a46 100644
--- a/package/isl/isl.hash
+++ b/package/isl/isl.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	8882c9e36549fc757efa267706a9af733bb8d7fe3905cbfde43e17a89eea4675	isl-0.14.1.tar.xz
+sha256	0f35051cc030b87c673ac1f187de40e386a1482a0cfdf2c552dd6031b307ddc4	isl-0.18.tar.xz
diff --git a/package/isl/isl.mk b/package/isl/isl.mk
index 74de125..b5f01c4 100644
--- a/package/isl/isl.mk
+++ b/package/isl/isl.mk
@@ -4,18 +4,11 @@
 #
 ################################################################################
 
-# The latest 0.15 version is not yet compatible with cloog 0.18.3, so
-# bumping isl is not possible until a new version of cloog is
-# published.
-ISL_VERSION = 0.14.1
+ISL_VERSION = 0.18
 ISL_SOURCE = isl-$(ISL_VERSION).tar.xz
 ISL_SITE = http://isl.gforge.inria.fr
 ISL_LICENSE = MIT
 ISL_LICENSE_FILES = LICENSE
 HOST_ISL_DEPENDENCIES = host-gmp
 
-# Our libtool patch doesn't apply, and since this package is only
-# built for the host, we don't really care about it.
-ISL_LIBTOOL_PATCH = NO
-
 $(eval $(host-autotools-package))
