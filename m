From: Rob Landley <rob@landley.net>
Date: Tue Jul 25 13:40:18 2006
Subject: [Buildroot] buildroot compilation error "extra tokens at end of
	#ident directive"
In-Reply-To: <bf61e79a0607251106n321c6f1dgf2c3187cef783163@mail.gmail.com>
References: <bf61e79a0607251106n321c6f1dgf2c3187cef783163@mail.gmail.com>
Message-ID: <200607251639.25663.rob@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 25 July 2006 2:06 pm, Drew Cohan wrote:
> CC modutils/insmod.o
> /home/pkuser/buildroot/build_i686/busybox/modutils/insmod.c:352:10: extra
> tokens at end of #ident directive
> /home/pkuser/buildroot/build_i686/busybox/modutils/insmod.c:515:10: extra
> tokens at end of #ident directive

Huh, that would be my problem.  (Rummages.)  svn 15743 should fix this, which 
should be in tonight's snapshot.

> The two offending lines in the source code are identical:
> 
> #ident "$Id: insmod.c,v 1.126 2004/12/26 09:13:32 vapier Exp $"
> #ident "$Id: insmod.c,v 1.126 2004/12/26 09:13:32 vapier Exp $"

They have been yanked.

I take it this is a gcc 4.1 issue?  (I've tested rather a lot with gcc 4.0, 
but only got a gcc 4.1 environment set up while I was at OLS, and have been 
too busy to play with it since I got back...)  Alas, -Werror is a bit harsh 
but it does catch the warnings early...

Let me know if you hit anything else in busybox.

Rob
-- 
Never bet against the cheap plastic solution.
