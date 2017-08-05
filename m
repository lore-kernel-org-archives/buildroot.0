From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Aug 2017 14:23:42 +0200
Subject: [Buildroot] [PATCH] gdb: add fix for gdb 7.12 and gdb 8.0 build
 on noMMU platforms
In-Reply-To: <4a2a10bc-9516-ddb6-b9b6-9c67038a8339@smile.fr>
References: <20170803071548.2876-1-thomas.petazzoni@free-electrons.com>
 <4a2a10bc-9516-ddb6-b9b6-9c67038a8339@smile.fr>
Message-ID: <20170805142342.027e1232@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 4 Aug 2017 22:43:26 +0200, Romain Naour wrote:

> > ../nat/linux-ptrace.c: In function 'int linux_fork_to_function(gdb_byte*, int (*)(void*))':
> > ../nat/linux-ptrace.c:273:29: error: invalid conversion from 'void*' to 'gdb_byte* {aka unsigned char*}' [-fpermissive]
> >        child_stack = xmalloc (STACK_SIZE * 4);
> > 
> > The patch has already been merged upstream, as of commit
> > ffce45d2243e5f52f411e314fc4e1a69f431a81f, and will therefore be part
> > of future gdb releases.  
> 
> What's the arch/config are you using?

This was happening on m68k Coldfire, if i remember correctly.

> It's seems no toolchain able to build gdb on noMMU case are present in the
> autobuilder.

We have a m68k Coldfire configuration in the autobuilders. However, the
pre-built toolchain is built without BR2_PTHREAD_DEBUG, and therefore
the target gdb is never built because it depends on
BR2_TOOLCHAIN_HAS_THREADS_DEBUG.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
