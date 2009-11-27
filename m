From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 27 Nov 2009 16:45:40 -0600
Subject: [Buildroot] Build jobbing
In-Reply-To: <200911271633.14780.minimod@morethan.org>
References: <200911271522.58858.minimod@morethan.org>
	<200911271616.16112.minimod@morethan.org>
	<200911271633.14780.minimod@morethan.org>
Message-ID: <200911271645.42184.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri November 27 2009, Michael S. Zick wrote:
> On Fri November 27 2009, Michael S. Zick wrote:
> > On Fri November 27 2009, Michael S. Zick wrote:
> > > On Fri November 27 2009, Peter Korsgaard wrote:
> > > > >>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:
> > > > 
> > > >  Michael> When Buildroot is tested, do you use anything other than: -j1?
> > > > 
> > > > Sure.
> > > > 
> > > >  Michael> I have been using -j5 to keep my quad-core out of the idle loop;
> > > >  Michael> but am beginning to suspect there is something not right about that.
> > > > 
> > > > Notice that you have to set BR2_JLEVEL under build options - The
> > > > toplevel make must NOT be run with -jN.
> > > > 
> > > 
> > > Yup, got that right.
> > > 
> > > Now using the repository head -
> > > 
> > > The cross-uClibc will not build with "gnu-hash" option unless the host binutils
> > > already support "gnu-hash" (??) - Easy, I just disable that and pretended I 
> > > didn't get the message.
> > > 
> > > ltrace does not build - just disabled it for now.
> > > mii-diag-2.11 does not build - just disable it for now.
> > > We already know about sstrip - I bug reported that one (I think).
> > > 
> > > nand_{erase,lock,unlock) in BB-1.15.2 does not build.
> > > 
> > 
> > nbd-server.c:267: Incompatible implicit declaration of built-in function "index"
> > Disabled, continuing.
> > 
> 
> startup-notification-0.9 does not build, no X11 development libraries found.
> (No libraries is correct, in that I did not intend to build anything X11-ish,
> it was the selection of startup-notification that should have been blocked.)
> 
> Oh,
> kexec will not build, forget why (I think that one was the "no such instruction" 
> in a *.S for MIPS) - will look into that one later.
> 
> Both disabled, continuing.
>

sylpheed-2.4.8 - fails to build due to no GTK+ 
Not having GTK+ is correct, but should have disabled sylpheed selection.

sysstat-9.0.5 - fails to build due to "undefined ref to libintl_gettext"
but both libintl and gettext where auto-selected to be built. (???)

Both disabled, continuing.

Mike
Mike
> Mike
> > Mike
> > > continuing...
> > > will go back and investigate those things *later*.
> > > 
> > > Mike
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> > > 
> > > 
> > 
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> > 
> > 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
