From: Mathieu Maret <mathieu.maret@gmail.com>
Date: Thu,  7 Jun 2018 10:38:57 +0200
Subject: [Buildroot] [PATCH 1/1] opencv3: Enable NEON and VFPV3 optimizations
Message-ID: <1528360737-12613-1-git-send-email-mathieu.maret@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mathieu Maret <mathieu.maret@gmail.com>
---
 package/opencv3/opencv3.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 15e4ead..53b771e 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -99,7 +99,9 @@ OPENCV3_CONF_OPTS += \
 # * PowerPC support is turned off since its only effect is altering CFLAGS,
 #   adding '-mcpu=G3 -mtune=G5' to them, which is already handled by Buildroot.
 OPENCV3_CONF_OPTS += \
-	-DENABLE_POWERPC=OFF
+	-DENABLE_POWERPC=OFF \
+	-DENABLE_NEON=$(if $(BR2_ARM_CPU_HAS_NEON),ON,OFF) \
+	-DENABLE_VFPV3=$(if $(BR2_ARM_CPU_HAS_VFPV3),ON,OFF)
 
 # Cuda stuff
 OPENCV3_CONF_OPTS += \
-- 
2.7.4
