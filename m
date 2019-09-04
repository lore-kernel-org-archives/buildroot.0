From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  4 Sep 2019 20:46:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcamera: link with atomic when
 needed
Message-ID: <20190904184609.18560-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/1f0b8338f5f39aa86b9d432598dae2f53c5f7c84

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcamera/libcamera.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 62c48607d4..7a5b30ca49 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -15,4 +15,9 @@ LIBCAMERA_LICENSE_FILES = \
 	licenses/gnu-gpl-2.0.txt \
 	licenses/gnu-lgpl-2.1.txt
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBCAMERA_LDFLAGS += -latomic
+endif
+
 $(eval $(meson-package))
-- 
2.23.0.rc1
