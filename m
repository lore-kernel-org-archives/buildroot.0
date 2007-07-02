From: Ken and Timi Cecka <ceckak@alumni.washington.edu>
Date: Mon, 02 Jul 2007 10:19:59 -0700 (PDT)
Subject: [Buildroot] Debugging across uClibc calls
In-Reply-To: <CF7E46FCFF66AD478BB72724345289EC279721@twx-exch01.twacs.local>
References: <Pine.LNX.4.64.0706281628150.7887@pitt>
	<CF7E46FCFF66AD478BB72724345289EC279721@twx-exch01.twacs.local>
Message-ID: <Pine.LNX.4.64.0707021012520.15124@pitt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michael,

Thanks for the suggestiron.  I had not been setting the 
solib-absolute-prefix, and doing so cleared up some error messages I was 
seeing in GDB, but did not resolve my primary issue.  I still can not step 
across C library calls.  However, I've found that I can simply set my 
cursor on the next line and do Continue Until Here (I'm using DDD) to get 
past it.  Would still be good to figure this out, but at least it's not 
holding me up.

Ken

On Fri, 29 Jun 2007, Benedict, Michael wrote:

> Ken,
> 	Are you setting solib-absolute-prefix in the host gdb session?
> It should be set to your target root directory.
> 	Cheers,
> 		Michael
> 
> buildroot-bounces at uclibc.org wrote:
> > Hi All,
> > 
> > I've got a PPC405 target up and running with a buildroot/uClibc linux
> > environment, and now I'm trying to debug an application.  I
> > can launch the
> > application using gdbserver and then connect to it using my
> > host gdb, and
> > everything is great as I step through the code... until I reach a C
> > library call.  Any time I try to step over one of these (e.g. print,
> > memcpy, etc),
> > I end up getting stuck in call___do_global_ctors_aux.
> > 
> > I did a little searching around on the web and the only thing
> > I could find
> > about this is that this symbol is related to runtime linking of shared
> > library functions.  That's fine and dandy, but how do I get
> > past it?  I'm
> > not trying to step into the call, just over it so I can
> > continue debugging
> > my high level code.
> > 
> > Any suggestions?
> > 
> > Thanks,
> > Ken
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> 
> 
> 
