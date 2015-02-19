From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:04:26 +0100
Subject: [Buildroot] [git commit branch/next] gcc: 4.9.2: Add patch to
	remove a wrong header
Message-ID: <20150219212508.07B17801C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31b5509af5ab73189efa0561a387ed71e40cd176
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit adds a patch to gcc removing a unistd.h header include
in libgcc/config/nios2/linux-atomic.c

The file is built as part of GCC first stage (host-gcc-initial),
and so the header is not accesible. Given the header is not needed
it's fine to simply remove it.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../4.9.2/920-libgcc-remove-unistd-header.patch    |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

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
