From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  1 Jun 2014 11:24:33 +0200
Subject: [Buildroot] [PATCH v4 11/11] qhull: do not override CMAKE_BUILD_TYPE
In-Reply-To: <1401614673-3703-1-git-send-email-s.martin49@gmail.com>
References: <1401614673-3703-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1401614673-3703-12-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This flag is already correctly set by the cmake-package infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v3 -> v4:
- rebase

changes v2 -> v3:
- new patch
---
 package/qhull/qhull.mk | 1 -
 1 file changed, 1 deletion(-)

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
-- 
1.9.2
