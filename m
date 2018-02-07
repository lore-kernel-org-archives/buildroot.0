From: Ryan Coe <bluemrp9@gmail.com>
Date: Tue,  6 Feb 2018 16:48:49 -0800
Subject: [Buildroot] [NEXT] glibc: depends on host-bison
Message-ID: <20180207004849.21747-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following build error:

checking for bison... no
checking if ./buildroot/output/host/bin/arm-rpi1-linux-gnueabihf-gcc is sufficient to build libc... yes
checking for arm-rpi1-linux-gnueabihf-nm... ./buildroot/output/host/bin/arm-rpi1-linux-gnueabihf-nm
checking for python3... python3
configure: error:
*** These critical programs are missing or too old: bison
*** Check the INSTALL file for required versions.
package/pkg-generic.mk:237: recipe for target './buildroot/output/build/glibc-glibc-2.27/.stamp_configured' failed
make: *** [./buildroot/output/build/glibc-glibc-2.27/.stamp_configured] Error 1

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/glibc/glibc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index b674191b22..00e114566c 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -28,7 +28,7 @@ GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 # Before glibc is configured, we must have the first stage
 # cross-compiler and the kernel headers
-GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-gawk
+GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-bison host-gawk
 
 GLIBC_SUBDIR = build
 
-- 
2.15.1
