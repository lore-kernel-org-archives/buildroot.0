From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 28 Aug 2006 04:39:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2
Message-ID: <20060828113905.98D5448693@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-08-28 04:39:05 -0700 (Mon, 28 Aug 2006)
New Revision: 15999

Log:
- add rope-index patch, updated for 4.2.0


Added:
   trunk/buildroot/toolchain/gcc/4.2/304-index_macro.patch


Changeset:
Added: trunk/buildroot/toolchain/gcc/4.2/304-index_macro.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2/304-index_macro.patch	2006-08-28 09:41:49 UTC (rev 15998)
+++ trunk/buildroot/toolchain/gcc/4.2/304-index_macro.patch	2006-08-28 11:39:05 UTC (rev 15999)
@@ -0,0 +1,24 @@
+--- gcc-4.1.0/libstdc++-v3/include/ext/rope.mps	2006-03-24 01:49:51 +0100
++++ gcc-4.1.0/libstdc++-v3/include/ext/rope	2006-03-24 01:49:37 +0100
+@@ -59,6 +59,9 @@
+ #include <bits/allocator.h>
+ #include <ext/hash_fun.h>
+ 
++/* cope w/ index defined as macro, SuSv3 proposal */
++#undef index
++
+ # ifdef __GC
+ #   define __GC_CONST const
+ # else
+--- gcc-4.1.0/libstdc++-v3/include/ext/ropeimpl.h.mps	2006-03-24 01:50:04 +0100
++++ gcc-4.1.0/libstdc++-v3/include/ext/ropeimpl.h	2006-03-24 01:50:28 +0100
+@@ -53,6 +53,9 @@
+ #include <ext/memory> // For uninitialized_copy_n
+ #include <ext/numeric> // For power
+ 
++/* cope w/ index defined as macro, SuSv3 proposal */
++#undef index
++
+ _GLIBCXX_BEGIN_NAMESPACE(__gnu_cxx)
+
+   using std::size_t;
