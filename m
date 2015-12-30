From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 15:56:53 +0100
Subject: [Buildroot] [git commit] vboot-utils: ssize_t needs unistd.h
Message-ID: <20151230145745.348C982712@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63b4d2e49d920831837349a10669384204bc3c55
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/95c8708411fbb116f313a0fdeccacf92cf9e3d8d/
http://autobuild.buildroot.net/results/cf4aa60f9fc9c48ff13d3233994b77b7c0950afe/
http://autobuild.buildroot.net/results/6f7dcafde693f06dfc88c922c5f8dd70ae2e30b5/
http://autobuild.buildroot.net/results/a2e95784d32c8842f6947801fd0d8c48f68b84e2/
http://autobuild.buildroot.net/results/f69ae4c9eee27df43389ae76048fb4ddd5a3eca6/

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vboot-utils/0002-ssize-t.patch | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

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
