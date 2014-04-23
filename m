From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 24 Apr 2014 00:48:33 +0200
Subject: [Buildroot] [PATCH 14/14] qhull: do not override CMAKE_BUILD_TYPE
In-Reply-To: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
References: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398293313-17580-15-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This flag is already correctly set by the cmake-package infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- new patch
---
 package/qhull/qhull.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qhull/qhull.mk b/package/qhull/qhull.mk
index f2bc771..3451775 100644
--- a/package/qhull/qhull.mk
+++ b/package/qhull/qhull.mk
@@ -9,6 +9,5 @@ QHULL_SITE = git://gitorious.org/qhull/qhull.git
 QHULL_INSTALL_STAGING = YES
 QHULL_LICENSE = BSD-Style
 QHULL_LICENSE_FILES = COPYING.txt
-QHULL_CONF_OPT = -DCMAKE_BUILD_TYPE=Release
 
 $(eval $(cmake-package))
-- 
1.9.2
