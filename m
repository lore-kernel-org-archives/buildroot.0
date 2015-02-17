From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 17 Feb 2015 13:26:53 -0300
Subject: [Buildroot] [PATCH 1/6] gcc: 4.9.2: Add patch to remove a wrong
	header
In-Reply-To: <1424190418-883-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1424190418-883-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1424190418-883-2-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a patch to gcc removing a unistd.h header include
in libgcc/config/nios2/linux-atomic.c

The file is built as part of GCC first stage (host-gcc-initial),
and so the header is not accesible. Given the header is not needed
it's fine to simply remove it.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 package/gcc/4.9.2/920-libgcc-remove-unistd-header.patch | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 package/gcc/4.9.2/920-libgcc-remove-unistd-header.patch

diff --git a/package/gcc/4.9.2/920-libgcc-remove-unistd-header.patch b/package/gcc/4.9.2/920-libgcc-remove-unistd-header.patch
new file mode 100644
index 0000000..df5372b
--- /dev/null
+++ b/package/gcc/4.9.2/920-libgcc-remove-unistd-header.patch
@@ -0,0 +1,12 @@
+Upstream status: In progress
+
+--- a/libgcc/config/nios2/linux-atomic.c
++++ b/libgcc/config/nios2/linux-atomic.c
+@@ -20,7 +20,6 @@
+ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ <http://www.gnu.org/licenses/>.  */
+ 
+-#include <asm/unistd.h>
+ #define EFAULT  14
+ #define EBUSY   16
+ #define ENOSYS  38
-- 
2.3.0
