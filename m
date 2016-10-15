From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Oct 2016 11:44:32 +0200
Subject: [Buildroot] [PATCH v3 3/8] package/gflags: includes TARGET_CXXFLAGS
	to the overloaded CXXFLAGS
In-Reply-To: <20161015094437.6989-1-s.martin49@gmail.com>
References: <20161015094437.6989-1-s.martin49@gmail.com>
Message-ID: <20161015094437.6989-4-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/gflags/gflags.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gflags/gflags.mk b/package/gflags/gflags.mk
index 9dc4e15..89111ed 100644
--- a/package/gflags/gflags.mk
+++ b/package/gflags/gflags.mk
@@ -11,7 +11,8 @@ GFLAGS_LICENSE = BSD-3c
 GFLAGS_LICENSE_FILES = COPYING.txt
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
-GFLAGS_CONF_OPTS = -DBUILD_gflags_LIB=OFF -DCMAKE_CXX_FLAGS=-DNO_THREADS
+GFLAGS_CONF_OPTS = -DBUILD_gflags_LIB=OFF \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -DNO_THREADS"
 endif
 
 $(eval $(cmake-package))
-- 
2.10.0
