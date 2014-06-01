From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 22:21:05 +0200
Subject: [Buildroot] [git commit] qhull: do not override CMAKE_BUILD_TYPE
Message-ID: <20140601202128.6C9479CE00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3663bc4ff295b98fbbc1aafb38fdbc46fee7c80e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This flag is already correctly set by the cmake-package infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qhull/qhull.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/qhull/qhull.mk b/package/qhull/qhull.mk
index 15fb46e..6992d71 100644
--- a/package/qhull/qhull.mk
+++ b/package/qhull/qhull.mk
@@ -9,6 +9,5 @@ QHULL_SITE = git://gitorious.org/qhull/qhull.git
 QHULL_INSTALL_STAGING = YES
 QHULL_LICENSE = BSD-Style
 QHULL_LICENSE_FILES = COPYING.txt
-QHULL_CONF_OPT = -DCMAKE_BUILD_TYPE=Release
 
 $(eval $(cmake-package))
