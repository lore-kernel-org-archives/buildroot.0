From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 19 Dec 2013 21:20:41 +0000
Subject: [Buildroot] [PATCH] zyre: use a git snapshot that builds
Message-ID: <1387488041-25911-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Commit abe6a13ceaed147449220ee671dc8574f4e7068c bumped the git snapshot for
zyre. Unfortunately, the newer snapshot requires a newer version of
czmq than is currently available in Buildroot. The simplest short-term fix is
to roll zyre back to an earlier git snapshot.

Fixes autobuild failures such as the following.

  http://autobuild.buildroot.net/results/0ef/0efbbcc7e94cdb184c5d032469e03b2b7da3d054/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/zyre/zyre.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index 405697a..423091f 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZYRE_VERSION = 378b8b5cf76d10f5e41b339a4bcb0dc6197a9edf
+ZYRE_VERSION = d5b8cb1f66fb5059d9eeb0702a7c2055a63cd8a7
 ZYRE_SITE = $(call github,zeromq,zyre,$(ZYRE_VERSION))
 ZYRE_LICENSE = LGPLv3+
 ZYRE_LICENSE_FILES = COPYING COPYING.LESSER
-- 
1.8.3.2
