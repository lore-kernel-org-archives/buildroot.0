From: Steve Bennett <sablists@earthlink.net>
Date: Mon, 27 Jul 2009 16:34:13 -0400
Subject: [Buildroot] Bug 171 - vm86.c error: IF_MASK undeclared
Message-ID: <98531B0C-B641-406E-A66F-04C837AF6A90@earthlink.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=171

I just ran into this problem, and worked around it by updating the  
patch file (below) so it points to the right files, and putting it in  
my package/x11r7/xserver_xorg-server folder.

That said, I was wondering if there's a different fix, some package  
or header I'm missing or something, since it seems like a fairly old  
problem.

-->Steve Bennett

File xserver_xorg-server-1.5-ifmask-fix.patch:

--- xserver_xorg-server-1.5.2.old/hw/kdrive/vesa/vm86.h	2008-10-02  
17:01:25.000000000 -0400
+++ xserver_xorg-server-1.5.2/hw/kdrive/vesa/vm86.h	2009-07-27  
15:51:21.000000000 -0400
@@ -67,6 +67,13 @@
  #include "os.h"
  #endif

+#ifndef IF_MASK
+#define IF_MASK X86_EFLAGS_IF
+#endif
+#ifndef IOPL_MASK
+#define IOPL_MASK X86_EFLAGS_IOPL
+#endif
+
  typedef unsigned char	U8;
  typedef unsigned short	U16;
  typedef unsigned int	U32;
