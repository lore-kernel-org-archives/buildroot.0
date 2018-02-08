From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 23:48:43 +0100
Subject: [Buildroot] [git commit branch/next] glibc: needs host-bison
Message-ID: <20180208224857.441BD8860E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61addf9107e5369b6dbc77724ab0b0ecede74897
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since upstream commit 1faaf7035cabda101e1d6653bff7a539f201db91
("plural.c: improve reproducibility"), glibc now requires bison to be
available on the host for its build process. This is needed starting
with glibc 2.27.

Fixes:

  http://autobuild.buildroot.net/results/ca4d883793c1674d3a052edd5e56897f79683448/

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
