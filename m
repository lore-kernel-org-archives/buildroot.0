From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 27 Nov 2009 06:30:42 -0600
Subject: [Buildroot] Non-x86 support question
In-Reply-To: <87zl696ka0.fsf@macbook.be.48ers.dk>
References: <200911261521.32631.minimod@morethan.org>
	<87zl696ka0.fsf@macbook.be.48ers.dk>
Message-ID: <200911270630.54463.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu November 26 2009, Peter Korsgaard wrote:
> >>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:
> 
>  Michael> Just wondering, does buildroot get tested as a cross-compiler
>  Michael> building native toolchain?
> 
> The BR2_PACKAGE_GCC_TARGET? No, that isn't commonly used. That doesn't
> mean that it shouldn't work ofcourse.
> 
>  Michael> There is a similar bug posted, which I think refers to building
>  Michael> the foreign, native, compiler.
>  Michael> At least that is my own problem.  ;)
> 
>  Michael> In my case, gcc's configure is failing when it tries to test for
>  Michael> the presence of mpfr (which is present, and built) - - -
>  Michael> (No problem with gpm) 
> 
> Hmm, it worked for me last time I tried (some time this summer).
> 
>  Michael> I have captured the configure command being run and the test file,
>  Michael> then ran them "by hand" with -v the best I can figure out at
>  Michael> that point is:
> 
> Could you provide a bit more details? What goes wrong?
> 

One more note while waiting for me to document this in a true bug-report.

I considered handling gpm and mpf as "patches" to gcc - -
Since gcc will configure and build them if it finds them in its source tree.

I made up a gcc tarball along those lines and tried it - -
Same result - cross-compiler builds, native-compiler fails to configure
while testing for mpf header files (two or three missing and/or renamed symbols).

As a reminder: this is gcc-4.3.x targeting MIPS (32-R2, 24Kc, hard-float).
gcc-4.4.x is hopeless for MIPS at the moment, implements an ABI change for MIPS,
mostly in how structures are packed.

Mike 
