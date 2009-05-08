From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 May 2009 12:37:36 +0200
Subject: [Buildroot] X11 and buildroot..
In-Reply-To: <20090508101307.GA18388@cbg.dyndns.org> (Steffen Schulz's message
	of "Fri\, 8 May 2009 12\:13\:07 +0200")
References: <20090506124243.GB2496@cbg.dyndns.org>
	<87y6tadzww.fsf@macbook.be.48ers.dk>
	<20090507082927.GB16268@cbg.dyndns.org>
	<20090508101307.GA18388@cbg.dyndns.org>
Message-ID: <87skjfanin.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steffen" == Steffen Schulz <pepe_ml@gmx.net> writes:

 Steffen> Okay, I did another attempt to compile xorg and selected a few more X
 Steffen> packages. Now it tries to build Mesa before getting to the missing
 Steffen> makedepend I had before. Interestingly, the problem seems to be the
 Steffen> similar.

 Steffen> When I manually add xutil_makedepend to the mesa dependencies and then
 Steffen> copy the makedepend binary to staging/usr/bin/, the next build attempt
 Steffen> yields:

 Steffen> /bin/sh: /home/pepe/repo/buildroot/buildroot/build_i686/staging_dir/usr/bin/makedepend:
 Steffen> No such file or directory

So mesa needs makedepend on the host. Running the one for the target
won't help. Do you have makedepend installed on your host?

 Steffen> So I removed makedepend and install it on the host instead. Now mesa
 Steffen> fails with 

 Steffen> [...]  -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING
 Steffen> -DHAVE_ALIAS -DHAVE_POSIX_MEMALIGN -DUSE_X86_ASM -DUSE_MMX_ASM
 Steffen> -DUSE_3DNOW_ASM -DUSE_SSE_ASM -fno-strict-aliasing gen_matypes.c -o gen_matypes
 Steffen> ./gen_matypes > matypes.h
 Steffen> /bin/sh: ./gen_matypes: No such file or directory

You didn't paste enough for us to see if gen_matypes gets compiled for
the host or the target, but from the error message it looks like it's
for the target (which is wrong).

I'm pretty sure I compiled mesa3d for arm not that long ago, so it
seems to be an x86 specific issue.

I'll take a look at it this weekend.

-- 
Bye, Peter Korsgaard
