From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 19 May 2015 13:49:46 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150519100045.44f1b3a4@free-electrons.com>
References: <20150519063012.E7D2A100C5F@stock.ovh.net>
 <20150519100045.44f1b3a4@free-electrons.com>
Message-ID: <1432043386.4108.23.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2015-05-19 at 10:00 +0200, Thomas Petazzoni wrote:
> >          arc |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/e781d4ce27ce17067b2e5e298e1e8ba9add41371/
> 
> Compiler problem:
> 
> /tmp/ccQkdXjH.s: Assembler messages:
> /tmp/ccQkdXjH.s: Error: unaligned opcodes detected in executable segment
> make[2]: *** [.obj/release-shared-emb-generic/qxquerytokenizer.o] Error 1
> 
> Alexey, can you have a look? Thanks!

Well this is sort of expected failure. Even though I have never tried
building vanilla Qt for ARC, but as it turned out that doesn't work.

But we've been sitting for a while on Qt4 patches that enable building
for and running on ARC. And now decision has been made to finally submit
those pretty simple patches upstream and in parallel (until patches are
accepted and the next minor release of Qt 4.x is cut.. if ever) add
patches in Buildroot so people may happily build and run Qt on ARC.

I'll send patches shortly.

As for Qt5:
 [1] It requires tools with NPTL which (I really hope) will be available
for ARC in few weeks, but until that time we may not worry about Qt5 for
ARC - it won't be built.

 [2] Once ARC toolchain with NPTL is in Buildroot we'll need to cook
something similar to what we've done for Qt4 and I hope it will really
be that same simple. But probably for starters we'll disable Qt5 for
ARC.

BTW if I'm not mistaken (and "git log" is my witness) it was you who
initially added Qt5 support in Buildroot, so I may assume you have some
experience with that animal and if so I would really like to ask you to
do my first external reviewer of Qt patch for ARC (for Qt4 now and Qt5
later).

Regards,
Alexey
