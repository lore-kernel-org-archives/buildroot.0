From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 14:36:23 +0200
Subject: [Buildroot] [git commit] gcc: add missing NIOS-II patch after bump
	to 4.9.3
Message-ID: <20150808123744.2D5558164F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad0f85e57e0d89e7bc4eb6fc01345f4a4f952d27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When gcc 4.9.x was bumped from 4.9.2 to 4.9.3 in commit
2fed00ea1eaeca952f872120af79a46f39b0868c, patch
920-libgcc-remove-unistd-header.patch was removed with the argument
that it had been applied upstream.

However, it is not the case, and the patch continues to apply fine on
gcc 4.9.3, and is actually needed to make gcc build properly on
NIOS-II.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../4.9.3/920-libgcc-remove-unistd-header.patch    |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/gcc/4.9.3/920-libgcc-remove-unistd-header.patch b/package/gcc/4.9.3/920-libgcc-remove-unistd-header.patch
new file mode 100644
index 0000000..df5372b
--- /dev/null
+++ b/package/gcc/4.9.3/920-libgcc-remove-unistd-header.patch
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
