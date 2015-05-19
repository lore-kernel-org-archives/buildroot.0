From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 May 2015 17:48:44 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <1432043386.4108.23.camel@synopsys.com>
References: <20150519063012.E7D2A100C5F@stock.ovh.net>
 <20150519100045.44f1b3a4@free-electrons.com>
 <1432043386.4108.23.camel@synopsys.com>
Message-ID: <20150519174844.1ef6eb28@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey,

On Tue, 19 May 2015 13:49:46 +0000, Alexey Brodkin wrote:

> > /tmp/ccQkdXjH.s: Assembler messages:
> > /tmp/ccQkdXjH.s: Error: unaligned opcodes detected in executable segment
> > make[2]: *** [.obj/release-shared-emb-generic/qxquerytokenizer.o] Error 1
> > 
> > Alexey, can you have a look? Thanks!
> 
> Well this is sort of expected failure. Even though I have never tried
> building vanilla Qt for ARC, but as it turned out that doesn't work.
> 
> But we've been sitting for a while on Qt4 patches that enable building
> for and running on ARC. And now decision has been made to finally submit
> those pretty simple patches upstream and in parallel (until patches are
> accepted and the next minor release of Qt 4.x is cut.. if ever) add
> patches in Buildroot so people may happily build and run Qt on ARC.
> 
> I'll send patches shortly.

Great, that would be nice.

> 
> As for Qt5:
>  [1] It requires tools with NPTL which (I really hope) will be available
> for ARC in few weeks, but until that time we may not worry about Qt5 for
> ARC - it won't be built.

Yes, and since our Qt5 package depends on
BR2_TOOLCHAIN_HAS_THREADS_NPTL, Buildroot doesn't try to build it on
ARC, so we're fine.

>  [2] Once ARC toolchain with NPTL is in Buildroot we'll need to cook
> something similar to what we've done for Qt4 and I hope it will really
> be that same simple. But probably for starters we'll disable Qt5 for
> ARC.

That's already the case, see above.

> BTW if I'm not mistaken (and "git log" is my witness) it was you who
> initially added Qt5 support in Buildroot, so I may assume you have some
> experience with that animal and if so I would really like to ask you to
> do my first external reviewer of Qt patch for ARC (for Qt4 now and Qt5
> later).

Well, don't assume too much about my Qt5 knowledge. I've indeed done
the initial packaging, so I have a limited knowledge of the Qt5 build
system, but it doesn't go much beyond that. The rest of Qt5 remains
largely a thing I've never looked at. But I will be happy to look at
your patches. I think what we will be the most interested in is to make
sure that the effort to push them upstream is being done, but I know
you have a good track record of pushing ARC related fixes to the
relevant upstream projects, so I'm really not worried at all about this.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
