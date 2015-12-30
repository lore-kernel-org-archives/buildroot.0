From: Alex Suykov <alex.suykov@gmail.com>
Date: Wed, 30 Dec 2015 16:05:41 +0200
Subject: [Buildroot] [PATCH 2/3] vboot-utils: ssize_t needs unistd.h
In-Reply-To: <cover.1451483256.git.alex.suykov@gmail.com>
References: <cover.1451483256.git.alex.suykov@gmail.com>
Message-ID: <8b4aafb03aca6c3b763bd90c18a601fbf3b302f1.1451483256.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/95c8708411fbb116f313a0fdeccacf92cf9e3d8d/
http://autobuild.buildroot.net/results/cf4aa60f9fc9c48ff13d3233994b77b7c0950afe/
http://autobuild.buildroot.net/results/6f7dcafde693f06dfc88c922c5f8dd70ae2e30b5/
http://autobuild.buildroot.net/results/a2e95784d32c8842f6947801fd0d8c48f68b84e2/
http://autobuild.buildroot.net/results/f69ae4c9eee27df43389ae76048fb4ddd5a3eca6/

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/vboot-utils/0002-ssize-t.patch | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 package/vboot-utils/0002-ssize-t.patch

diff --git a/package/vboot-utils/0002-ssize-t.patch b/package/vboot-utils/0002-ssize-t.patch
new file mode 100644
index 0000000..9f1df45
--- /dev/null
+++ b/package/vboot-utils/0002-ssize-t.patch
@@ -0,0 +1,14 @@
+The code uses ssize_t which is usually defined in <unistd.h>
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- a/host/lib/fmap.c
++++ a/host/lib/fmap.c
+@@ -6,6 +6,7 @@
+ 
+ #include <stdio.h>
+ #include <string.h>
++#include <unistd.h>
+ 
+ #include "fmap.h"
+ 
-- 
2.6.4
