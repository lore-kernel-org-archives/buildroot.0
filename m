From: Markos Chandras <markos.chandras@gmail.com>
Date: Wed, 5 Jun 2013 16:40:06 +0100
Subject: [Buildroot] [PATCH] xapp_luit: Add patch to fix building with
	recent gcc versions
Message-ID: <1370446806-18826-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

Upstream bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=47792

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/x11r7/xapp_luit/xapp_luit-posix-openpt.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/x11r7/xapp_luit/xapp_luit-posix-openpt.patch

diff --git a/package/x11r7/xapp_luit/xapp_luit-posix-openpt.patch b/package/x11r7/xapp_luit/xapp_luit-posix-openpt.patch
new file mode 100644
index 0000000..c8ff8e4
--- /dev/null
+++ b/package/x11r7/xapp_luit/xapp_luit-posix-openpt.patch
@@ -0,0 +1,19 @@
+Suggested workaround to build with recent gcc versions
+
+Upstream bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=47792
+
+Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
+
+Index: xapp_luit-1.1.1/sys.c
+===================================================================
+--- xapp_luit-1.1.1.orig/sys.c
++++ xapp_luit-1.1.1/sys.c
+@@ -20,6 +20,8 @@ OUT OF OR IN CONNECTION WITH THE SOFTWAR
+ THE SOFTWARE.
+ */
+ 
++#define _XOPEN_SOURCE 600
++
+ #ifdef HAVE_CONFIG_H
+ # include "config.h"
+ #endif
-- 
1.8.2.1
