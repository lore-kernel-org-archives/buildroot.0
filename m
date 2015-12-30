From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 15:56:28 +0100
Subject: [Buildroot] [git commit] vboot-utils: MTD_CHAR_MAJOR definition
Message-ID: <20151230145745.257FD82750@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9aebcc3c1c6b46ba956e2bde6b73a7b1da5af87b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/a6360fd21314899321071c34fcb4892c5eed9bcc/
http://autobuild.buildroot.net/results/0af3aa4a429c45d3a2609913ec1040f32378f3c8/
http://autobuild.buildroot.net/results/cc4940fd6f51b31d71014f5aedee5223180eb36e/

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vboot-utils/0001-mtd-char-major.patch | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/vboot-utils/0001-mtd-char-major.patch b/package/vboot-utils/0001-mtd-char-major.patch
new file mode 100644
index 0000000..9db90b2
--- /dev/null
+++ b/package/vboot-utils/0001-mtd-char-major.patch
@@ -0,0 +1,17 @@
+This definition missing from <linux/major.h> for kernels <= 3.13.
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- a/cgpt/cgpt_wrapper.c
++++ b/cgpt/cgpt_wrapper.c
+@@ -25,6 +25,10 @@
+ #include "cgpt_nor.h"
+ #include "cryptolib.h"
+ 
++#ifndef MTD_CHAR_MAJOR
++#define MTD_CHAR_MAJOR 90
++#endif
++
+ // Check if cmdline |argv| has "-D". "-D" signifies that GPT structs are stored
+ // off device, and hence we should not wrap around cgpt.
+ static bool has_dash_D(int argc, const char *const argv[]) {
