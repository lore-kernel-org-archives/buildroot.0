From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 28 Nov 2009 05:38:58 -0600
Subject: [Buildroot] Build jobbing
In-Reply-To: <200911280510.28749.minimod@morethan.org>
References: <200911271522.58858.minimod@morethan.org>
	<87y6lr3p2g.fsf@macbook.be.48ers.dk>
	<200911280510.28749.minimod@morethan.org>
Message-ID: <200911280539.00806.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat November 28 2009, Michael S. Zick wrote:
> On Sat November 28 2009, Peter Korsgaard wrote:
> > >>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:
> >
> 
> I'll go back through all of those today, one at a time, and post
> either patches or a better description of each problem.
> 

First off, what worked - -

My configuration menu patch to expose the "build a static busybox"
worked just as intended while doing a full, dynamic system build.

During the build of uClibc, both shared and static libraries need
to always be built -
That is because the library loader utilities need to be linked as
static executables so that the dynamic library system can be fixed
if (when) it breaks.

Perhaps we need a menu selection to drop the static libraries from the 
target fs image but they are required inside of the build system.

On the other hand, that might be considered a "site specific detail",
and just like splitting the fs image, should be left to post-buildroot
scripting by the buildroot user.

The "mips32-r2, tune=24kc, hard-float" without specifying *which*
hard-float type to gcc seems to be working (BB uses float in e2fsck).
Or perhaps I just got lucky with that one on this SoC (a Realtec RTD-1073).
Realtec licensed the 24kc-pro (hardware float) core back in 2004/2005.

After running the uClibc test suite, I'll try the Lua numerical test suite.
Lua only has one internal number type: Double. So if that works....

Mike
> I am gaining confidence that I have most (all?) of the cockpit
> errors out of my setup here.
> 
> Some of those things I know how to fix,
> Others, I needed the additional set of eyes and suggestions
> just like you provided.
> 
> Mike 
> > Hi,
> > 
> >  Michael> ltrace does not build - just disabled it for now.
> > 
> > It builds here:
> > 
> > build/ltrace-0.5/ltrace: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked (uses shared libs), not stripped
> > 
> > What exactly goes wrong?
> > 
> >  Michael> mii-diag-2.11 does not build - just disable it for now.
> > 
> > It builds here:
> > 
> > build/mii-diag-2.11/mii-diag: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked (uses shared libs), not stripped
> > 
> > What exactly goes wrong?
> > 
> >  Michael> nand_{erase,lock,unlock) in BB-1.15.2 does not build.
> > 
> > There's a busybox patch pending for building the flash stuff with
> > 2.6.31.x kernel headers. I'll do a bit more testing and commit.
> > 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
