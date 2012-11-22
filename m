From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Nov 2012 13:56:47 +0100
Subject: [Buildroot] gdbserver for xtensa compilation error fix
In-Reply-To: <CAJH6qScXgb_N9dUizhoXjzZ2eYp50poNHhrk2SQK=OCPoGBXXg@mail.gmail.com>
References: <CAJH6qScXgb_N9dUizhoXjzZ2eYp50poNHhrk2SQK=OCPoGBXXg@mail.gmail.com>
Message-ID: <20121122135647.5a36ed29@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vadim Malenboim,

On Thu, 22 Nov 2012 14:42:32 +0200, Vadim Malenboim wrote:
> gdbserver compilation failed with :
> 
> rojects/xtensa-linux/JerryLinuxFP/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/linux-xtensa-low.c:137:5:
> error: 'PTRACE_GETXTREGS' undeclared here (not in a function)
> /projects/xtensa-linux/JerryLinuxFP/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/linux-xtensa-low.c:137:23:
> error: 'PTRACE_SETXTREGS' undeclared here (not in a function)
> make[1]: *** [linux-xtensa-low.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
> 
> fixed by modifying :
> 
> gdb/gdbserver/linux-xtensa-low.c line 26 :
> 
> from #include <sys/ptrace.h>
> to #include <asm/ptrace.h>

Thanks. This is already fix in Git by:
http://git.buildroot.net/buildroot/commit/?id=c28e15debff2078f4ef1b123e9a047a0cad2c18a

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
