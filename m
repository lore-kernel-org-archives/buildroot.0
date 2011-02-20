From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Feb 2011 23:32:49 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain/gcc/4.2.4: Add
	missing hunk to gcc 4.2.4 libgcc patch.
Message-ID: <20110220223307.2E7838F610@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=eabc25999d39a9ef9e151feaf80e7032fc5430b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch is required to build gcc 4.2.4 libgcc with dwarf2
unwinding support enabled.

Signed-off-by: Will Newton <will.newton@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gcc/4.2.4/1001-gcc-4.2.x-inhibit-libc.patch    |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/4.2.4/1001-gcc-4.2.x-inhibit-libc.patch b/toolchain/gcc/4.2.4/1001-gcc-4.2.x-inhibit-libc.patch
index 9a7c909..b039dfc 100644
--- a/toolchain/gcc/4.2.4/1001-gcc-4.2.x-inhibit-libc.patch
+++ b/toolchain/gcc/4.2.4/1001-gcc-4.2.x-inhibit-libc.patch
@@ -47,3 +47,20 @@
  alias (_Unwind_Find_FDE);
  #endif
 +#endif
+--- gcc-4.2.4/gcc/unwind-dw2-fde.c	2005-06-25 03:02:01.000000000 +0100
++++ gcc-4.2.4/gcc/unwind-dw2-fde.c	2010-08-12 10:43:24.221690613 +0100
+@@ -29,6 +29,8 @@
+ Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
+ 02110-1301, USA.  */
+
++#ifndef inhibit_libc
++
+ #ifndef _Unwind_Find_FDE
+ #include "tconfig.h"
+ #include "tsystem.h"
+@@ -1028,3 +1030,5 @@
+
+   return f;
+ }
++
++#endif
-- 
1.7.3.4
