From: Michael S. Zick <minimod@morethan.org>
Date: Sun, 29 Nov 2009 03:31:01 -0600
Subject: [Buildroot] BB update Was:  Build jobbing
In-Reply-To: <87my253d8o.fsf@macbook.be.48ers.dk>
References: <200911271522.58858.minimod@morethan.org>
	<200911290302.13984.minimod@morethan.org>
	<87my253d8o.fsf@macbook.be.48ers.dk>
Message-ID: <200911290331.03877.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun November 29 2009, Peter Korsgaard wrote:
> >>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:
> 
> Hi,
> 
>  Michael> Well, then the text in the menu must be mis-leading. . .
>  Michael> it must be refering to generation/use of setjmp/longjmp
>  Michael> somewhere other than in the target applications compiled.
> 
> config BR2_GCC_USE_SJLJ_EXCEPTIONS
>         bool "Enable setjmp/longjmp exceptions?"
>         help
>           For some platforms, the 

            internal 

>           stack unwinding 

            that gcc generates for stack traces and debugging info

>           works perfectly, 
>           while other platforms must use setjmp/longjmp exceptions for
>           proper stack unwinding during exception handling.  

            This does not effect the use of setjmp/longjmp in applications
            compiled by gcc.

>           Most people can leave this set to n.
> 
> That's imho fairly clearly not about basic setjmp/longjmp support.
> 

Only when you are thinking about building a compiler, but if instead you
happen to be an applications programmer, who doesn't know or care how
the compiler works internally...

I only now recognize why it seems clear to you - because I did live
on the gcc list once upon a time - not all of the buildroot users
have that background.

>  Michael> The most recent build has the option enabled, will see if
>  Michael> it makes a difference.
> 
>  Michael> I did not test yesterday's build because of local work rules:
>  Michael> 1) No shift longer than 18 hours;
>  Michael> 2) A minimum of 4 hours off between shifts.
> 
> ;)
> 

Mike
