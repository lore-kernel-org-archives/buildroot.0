From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jun 2018 15:55:12 +0200
Subject: [Buildroot] [git commit] opencv3: conditionally enable NEON and
 VFPv3 optimizations
Message-ID: <20180607135333.6F3A686E97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a17402e42d8c996af239cfdb536e74188d6c6245
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mathieu Maret <mathieu.maret@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv3/opencv3.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 15e4eadfe3..53b771ef25 100644
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
