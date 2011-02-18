From: Will Newton <will.newton@gmail.com>
Date: Fri, 18 Feb 2011 12:55:55 +0000
Subject: [Buildroot] [PATCH] toolchain/gcc/4.2.4: Add missing hunk to gcc
	4.2.4 libgcc patch.
Message-ID: <AANLkTik-ufaZx1XV=rrrzjnaukSsZT6w_0DUXnUjiPxB@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is required to build gcc 4.2.4 libgcc with dwarf2
unwinding support enabled.

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 .../gcc/4.2.4/1001-gcc-4.2.x-inhibit-libc.patch    |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/4.2.4/1001-gcc-4.2.x-inhibit-libc.patch
b/toolchain/gcc/4.2.4/1001-gcc-4.2.x-inhibit-libc.patch
index 9a7c909..6b7c4ee 100644
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
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-toolchain-gcc-4.2.4-Add-missing-hunk-to-gcc-4.2.4-li.patch
Type: text/x-patch
Size: 1270 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110218/7a962c79/attachment.bin>
