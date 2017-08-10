From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Aug 2017 11:25:27 +0200
Subject: [Buildroot] [PATCH] gdb: add fix for gdb 7.12 and gdb 8.0 build
 on noMMU platforms
In-Reply-To: <20170803071548.2876-1-thomas.petazzoni@free-electrons.com>
References: <20170803071548.2876-1-thomas.petazzoni@free-electrons.com>
Message-ID: <ff2def1e-0ac7-4d73-2083-f67ca110b280@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-08-17 09:15, Thomas Petazzoni wrote:
> This adds a patch to gdb 7.12 and gdb 8.x, which fixes the build on
> noMMU platforms. It is not needed for older versions of gdb, since
> it's related to the switch of gdb to C++ in the 7.12 release.
> 
> Fixes:
> 
> ../nat/linux-ptrace.c: In function 'int linux_fork_to_function(gdb_byte*, int (*)(void*))':
> ../nat/linux-ptrace.c:273:29: error: invalid conversion from 'void*' to 'gdb_byte* {aka unsigned char*}' [-fpermissive]
>        child_stack = xmalloc (STACK_SIZE * 4);
> 
> The patch has already been merged upstream, as of commit
> ffce45d2243e5f52f411e314fc4e1a69f431a81f, and will therefore be part
> of future gdb releases.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Since this is an upstream patch, and the additional issue reported by Romain is
something different, I applied to master, thanks.

 BTW, in another thread Thomas P. requested that a build fix which doesn't have
an accompanying autobuild failure should have a defconfig to reproduce :-).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
