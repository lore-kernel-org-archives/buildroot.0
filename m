From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 18 Sep 2014 15:19:12 +0400
Subject: [Buildroot] [PATCH] ARC: gcc - Redefine PTRDIFF_TYPE from "long
	int" to "int"
Message-ID: <1411039152-15365-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change of SIZE_TYPE from "long unsigned int" to "unsigned int"
http://git.buildroot.net/buildroot/commit/?id=0f236c1fef669192c8f5cc8ef26e93da91438dc2
introduced regression due to existing PTRDIFF_TYPE.

Now to fix regression convert PTRDIFF_TYPE to simple "int".

Fix is taken from current development branch of GCC for ARC and will be a
part of the next release of ARC tools, so at that point patch should be dropped.

https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/846e92167aa4f486259c9ff44bb4e6cce6097fa4

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/arc-2014.08/300-ptrdiff_type_int.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/gcc/arc-2014.08/300-ptrdiff_type_int.patch

diff --git a/package/gcc/arc-2014.08/300-ptrdiff_type_int.patch b/package/gcc/arc-2014.08/300-ptrdiff_type_int.patch
new file mode 100644
index 0000000..6ee765b
--- /dev/null
+++ b/package/gcc/arc-2014.08/300-ptrdiff_type_int.patch
@@ -0,0 +1,26 @@
+Redefine PTRDIFF_TYPE
+
+Change of SIZE_TYPE from "long unsigned int" to "unsigned int" introduced
+regression due to existing PTRDIFF_TYPE.
+
+Now to fix regression convert PTRDIFF_TYPE to simple "int".
+
+Fix is taken from current development branch of GCC for ARC and will be a
+part of the next release of ARC tools, so at that point patch should be dropped.
+
+https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/846e92167aa4f486259c9ff44bb4e6cce6097fa4
+
+Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
+---
+
+--- a/gcc/config/arc/arc.h
++++ b/gcc/config/arc/arc.h
+@@ -488,7 +488,7 @@ if (GET_MODE_CLASS (MODE) == MODE_INT		\
+ #define DEFAULT_SIGNED_CHAR 0
+ 
+ #define SIZE_TYPE "unsigned int"
+-#define PTRDIFF_TYPE "long int"
++#define PTRDIFF_TYPE "int"
+ #define WCHAR_TYPE "int"
+ #define WCHAR_TYPE_SIZE 32
+ 
-- 
1.9.3
