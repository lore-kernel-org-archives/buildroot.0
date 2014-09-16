From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Sep 2014 23:09:35 +0200
Subject: [Buildroot] [git commit] ARC: gcc - Fix SIZE_TYPE to be "unsigned
	int" instead of "long unsigned int"
Message-ID: <20140916211020.27BCD9D6B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f236c1fef669192c8f5cc8ef26e93da91438dc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This makes size_t to be "unsigned" ssize_t which makes happy compiler on data
type checks.

Fix is taken from current development branch of GCC for ARC and will be a
part of the next release of ARC tools, so at that point patch should be dropped.

https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/249f040299402647525c3f15b79d319fa7acddd3

Fixes http://autobuild.buildroot.net/results/405/405da9a945511329929b18740b983c51b8dcc43e

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../arc-2014.08/200-size_type_unsigned_int.patch   |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/gcc/arc-2014.08/200-size_type_unsigned_int.patch b/package/gcc/arc-2014.08/200-size_type_unsigned_int.patch
new file mode 100644
index 0000000..a6a0419
--- /dev/null
+++ b/package/gcc/arc-2014.08/200-size_type_unsigned_int.patch
@@ -0,0 +1,24 @@
+Fixes SIZE_TYPE to be "unsigned int" instead of "long unsigned int".
+
+This makes size_t to be "unsigned" ssize_t which makes happy compiler on data
+type checks.
+
+Fix is taken from current development branch of GCC for ARC and will be a
+part of the next release of ARC tools, so at that point patch should be dropped.
+
+https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/249f040299402647525c3f15b79d319fa7acddd3
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+
+--- a/gcc/config/arc/arc.h
++++ b/gcc/config/arc/arc.h
+@@ -487,7 +487,7 @@ if (GET_MODE_CLASS (MODE) == MODE_INT		\
+ /* Define this as 1 if `char' should by default be signed; else as 0.  */
+ #define DEFAULT_SIGNED_CHAR 0
+ 
+-#define SIZE_TYPE "long unsigned int"
++#define SIZE_TYPE "unsigned int"
+ #define PTRDIFF_TYPE "long int"
+ #define WCHAR_TYPE "int"
+ #define WCHAR_TYPE_SIZE 32
