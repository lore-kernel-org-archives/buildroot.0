From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 26 Aug 2007 13:40:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070826204033.55EE3A6AB9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-26 13:40:31 -0700 (Sun, 26 Aug 2007)
New Revision: 19701

Log:
- use the correct type (__u_long is correct, __ulong_t is not typed)


Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch	2007-08-26 18:23:13 UTC (rev 19700)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch	2007-08-26 20:40:31 UTC (rev 19701)
@@ -84,7 +84,7 @@
 +                         fd,((__u_quad_t)offset >> MMAP2_PAGE_SHIFT));
 +#else
 +   return __syscall_mmap2(addr, len, prot, flags,
-+                          fd,((__ulong_t)offset >> MMAP2_PAGE_SHIFT));
++                          fd,((__u_long)offset >> MMAP2_PAGE_SHIFT));
 +#endif
  }
  
