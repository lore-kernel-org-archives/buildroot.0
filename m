From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Jun 2013 23:08:38 +0200
Subject: [Buildroot] [git commit] xapp_luit: Add patch to fix building with
	recent gcc versions
Message-ID: <20130605211328.A92379A96A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99c016336e974727135a40b1ac86d8d14c4cdab6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=47792

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../x11r7/xapp_luit/xapp_luit-posix-openpt.patch   |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

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
