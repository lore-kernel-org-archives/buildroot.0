From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Tue,  1 Aug 2017 16:43:01 -0700
Subject: [Buildroot] [PATCH 2/2] isl: bump to version 0.18
In-Reply-To: <20170801234301.23840-1-yurovsky@gmail.com>
References: <20170801234301.23840-1-yurovsky@gmail.com>
Message-ID: <20170801234301.23840-3-yurovsky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is needed by GCC 7.X for graphite support. There's no longer any
tie to cloog, so remove the comment related to that.

Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
---
 package/isl/isl.hash | 2 +-
 package/isl/isl.mk   | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/isl/isl.hash b/package/isl/isl.hash
index e2c14ad149..43e5a463af 100644
--- a/package/isl/isl.hash
+++ b/package/isl/isl.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	8882c9e36549fc757efa267706a9af733bb8d7fe3905cbfde43e17a89eea4675	isl-0.14.1.tar.xz
+sha256	0f35051cc030b87c673ac1f187de40e386a1482a0cfdf2c552dd6031b307ddc4	isl-0.18.tar.xz
diff --git a/package/isl/isl.mk b/package/isl/isl.mk
index 74de125b60..32e7691f6b 100644
--- a/package/isl/isl.mk
+++ b/package/isl/isl.mk
@@ -4,10 +4,7 @@
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
-- 
2.13.3
