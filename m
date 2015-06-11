From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 11 Jun 2015 15:10:38 +0530
Subject: [Buildroot] [PATCH 1/1] gflags: define NO_THREADS if toolchain
	doesn't support threads
Message-ID: <1434015638-27165-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/a42/a4288ed5050ce0d14e589745bf26c0a95acf645e/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/gflags/gflags.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gflags/gflags.mk b/package/gflags/gflags.mk
index 661dad8..9dc4e15 100644
--- a/package/gflags/gflags.mk
+++ b/package/gflags/gflags.mk
@@ -11,7 +11,7 @@ GFLAGS_LICENSE = BSD-3c
 GFLAGS_LICENSE_FILES = COPYING.txt
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
-GFLAGS_CONF_OPTS = -DBUILD_gflags_LIB=OFF
+GFLAGS_CONF_OPTS = -DBUILD_gflags_LIB=OFF -DCMAKE_CXX_FLAGS=-DNO_THREADS
 endif
 
 $(eval $(cmake-package))
-- 
1.9.1
