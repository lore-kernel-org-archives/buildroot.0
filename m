From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Feb 2013 08:03:31 +0100
Subject: [Buildroot] [git commit] libfuse: add patch to fix AArch64 build
	issue
Message-ID: <20130204213437.159DD9A939@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c118c4350b38d2c936afbe2d696229eb8dd7ae8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/1fb89ab412935ab02494b269a367b283cf9618c1/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libfuse/libfuse-fix-aarch64-build.patch |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/libfuse/libfuse-fix-aarch64-build.patch b/package/libfuse/libfuse-fix-aarch64-build.patch
new file mode 100644
index 0000000..3b88687
--- /dev/null
+++ b/package/libfuse/libfuse-fix-aarch64-build.patch
@@ -0,0 +1,22 @@
+Fix build on the AArch64 platform
+
+Upstream-Status: Submitted
+
+Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
+
+--- a/include/fuse_kernel.h
++++ b/include/fuse_kernel.h
+@@ -88,12 +88,7 @@
+ #ifndef _LINUX_FUSE_H
+ #define _LINUX_FUSE_H
+ 
+-#include <sys/types.h>
+-#define __u64 uint64_t
+-#define __s64 int64_t
+-#define __u32 uint32_t
+-#define __s32 int32_t
+-#define __u16 uint16_t
++#include <linux/types.h>
+ 
+ /*
+  * Version negotiation:
