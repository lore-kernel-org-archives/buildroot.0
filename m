From: Michael S. Zick <minimod@morethan.org>
Date: Sun, 29 Nov 2009 04:53:31 -0600
Subject: [Buildroot] BB update Was:  Build jobbing
In-Reply-To: <87iqct39zz.fsf@macbook.be.48ers.dk>
References: <200911271522.58858.minimod@morethan.org>
	<200911290331.03877.minimod@morethan.org>
	<87iqct39zz.fsf@macbook.be.48ers.dk>
Message-ID: <200911290453.34368.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun November 29 2009, Peter Korsgaard wrote:
> >>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:
> 
>  >> That's imho fairly clearly not about basic setjmp/longjmp support.
> 
>  Michael> Only when you are thinking about building a compiler, but if
>  Michael> instead you happen to be an applications programmer, who
>  Michael> doesn't know or care how the compiler works internally...
> 
> Then he probably shouldn't be changing stuff under toolchain options ;)
> 
>  Michael> I only now recognize why it seems clear to you - because I did live
>  Michael> on the gcc list once upon a time - not all of the buildroot users
>  Michael> have that background.
> 
> Actually I haven't done much gcc development. The
> BR2_GCC_USE_SJLJ_EXCEPTIONS option got added back in 2004 by Erik really
> in beginning of BR development. I don't know of anything needing it
> today.
> 

2004?  That explains that -
Back in 2004 there where three possibilities for stack unwind code in the
generated objects, the "third" - setjmp/longjmp, was a user specified
option for use on arch's that did not have either of the other two complete.

If Erik had put in all three, or
If Erik had put in a "use compiler default model" / "use setjmp-longjmp"
then that help message would have been comprehensible then *and* now.

> In general, we try to use sensible defaults - If you don't understand an
> option, just leave it at default.
> 

Ah, but I did - - -
Until I encountered an application that failed to generate a backtrace -
And then I re-read the help message with the "application code" viewpoint
rather than the "compiler generated objects" viewpoint.

*and* we should hold off on refining this help message until I get a chance
to see if it does effect the application's use of setjmp/longjmp - - -

I haven't had a chance to run yesterday's build yet.
Instead, I spent this morning's time registering with MTI and sucking their
technical reference library dry.  At least on the subject of the 24K family.
Everything short of the FPGA code to load onto my Xilinx development board
and "grow" (programically) my own core.

I am also now the licensed owner of an MTI routine that *will* ID this core.

My plan of attack:
Use a spreadsheet to produce a feature matrix -
Then populate that with the appropriate GCC options -
And I expect to end up with something that will need a mips-submenu.

That is just for the 24K family - -
Users of Buildroot, using other MIPS families can do their own feature 
matrix and edit the mips-submenu following the model I set.

Between the configuration menu/matrix and the runtime cpuid thingy -
I expect I can get this system to turn out something better than 1984 MIPS code.

Mike
