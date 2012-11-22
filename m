From: Vadim Malenboim <vadim@tangotec.com>
Date: Thu, 22 Nov 2012 14:42:32 +0200
Subject: [Buildroot] gdbserver for xtensa compilation error fix
Message-ID: <CAJH6qScXgb_N9dUizhoXjzZ2eYp50poNHhrk2SQK=OCPoGBXXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gdbserver compilation failed with :

rojects/xtensa-linux/JerryLinuxFP/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/linux-xtensa-low.c:137:5:
error: 'PTRACE_GETXTREGS' undeclared here (not in a function)
/projects/xtensa-linux/JerryLinuxFP/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/linux-xtensa-low.c:137:23:
error: 'PTRACE_SETXTREGS' undeclared here (not in a function)
make[1]: *** [linux-xtensa-low.o] Error 1
make[1]: *** Waiting for unfinished jobs....

fixed by modifying :

gdb/gdbserver/linux-xtensa-low.c line 26 :

from #include <sys/ptrace.h>
to #include <asm/ptrace.h>

-- 
     * Vadim Malenboim.*
      Low Level Software Engineer.

      Cellular : +972(544)925862
      E-Mail   : vadim at tangotec.com
      WEB     : www.tangotec.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121122/0a46712e/attachment.html>
