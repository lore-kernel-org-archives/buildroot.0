From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Aug 2017 14:23:23 +0200
Subject: [Buildroot] [PATCH] gdb: add fix for gdb 7.12 and gdb 8.0 build
 on noMMU platforms
In-Reply-To: <ff2def1e-0ac7-4d73-2083-f67ca110b280@mind.be>
References: <20170803071548.2876-1-thomas.petazzoni@free-electrons.com>
 <ff2def1e-0ac7-4d73-2083-f67ca110b280@mind.be>
Message-ID: <20170810142323.2ea80af0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Aug 2017 11:25:27 +0200, Arnout Vandecappelle wrote:

> > Fixes:
> > 
> > ../nat/linux-ptrace.c: In function 'int linux_fork_to_function(gdb_byte*, int (*)(void*))':
> > ../nat/linux-ptrace.c:273:29: error: invalid conversion from 'void*' to 'gdb_byte* {aka unsigned char*}' [-fpermissive]
> >        child_stack = xmalloc (STACK_SIZE * 4);
> > 
> > The patch has already been merged upstream, as of commit
> > ffce45d2243e5f52f411e314fc4e1a69f431a81f, and will therefore be part
> > of future gdb releases.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  
> 
>  Since this is an upstream patch, and the additional issue reported by Romain is
> something different, I applied to master, thanks.
> 
>  BTW, in another thread Thomas P. requested that a build fix which doesn't have
> an accompanying autobuild failure should have a defconfig to reproduce :-).

Right, will do next time. You should have dropped my patch, I could
have done a respin with a defconfig included in the commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
