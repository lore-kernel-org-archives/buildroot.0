From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 31 May 2019 17:37:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: fix build due to gcc bug
 68485
Message-ID: <20190531153756.4592-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/c78eac84d1c5a6702e7759cd5364da1c3e399b4b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opencv3/opencv3.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 292ce81432..49b29d9f1e 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -23,6 +23,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_64735),y)
 OPENCV3_CXXFLAGS += -DCV__EXCEPTION_PTR=0
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+OPENCV3_CXXFLAGS += -O0
+endif
+
 # OpenCV component options
 OPENCV3_CONF_OPTS += \
 	-DCMAKE_CXX_FLAGS="$(OPENCV3_CXXFLAGS)" \
-- 
2.20.1
