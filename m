From: John Voltz <john.voltz@gmail.com>
Date: Sun, 11 May 2008 09:05:45 -0400
Subject: [Buildroot] Application execution fails (John Voltz)
In-Reply-To: <BAY107-W48974804239AEE2B1C2E559DD30@phx.gbl>
References: <mailman.1.1210359603.12379.buildroot@uclibc.org>
	<BAY107-W48974804239AEE2B1C2E559DD30@phx.gbl>
Message-ID: <46a136670805110605q2b504be7iaa02f88dd8bf5d6a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Try running your hello world program with strace. That may show you what's
going on. I know I've seen this problem before, but I can't remember what
causes it. Maybe someone else on the list knows?

John

On Fri, May 9, 2008 at 3:33 PM, Muktabh Anchlia <m_anchlia@hotmail.com>
wrote:

>
> Hi John,
> I still get the same error...
>
> *" I don't take sides, just the racing line "*
>
> >
> > Message: 1
> > Date: Fri, 9 May 2008 17:46:31 +0000
> > From: Muktabh Anchlia <m_anchlia@hotmail.com>
> > Subject: [Buildroot] Application execution fails
> > To: <buildroot@uclibc.org>
> > Message-ID: <BAY107-W3500673BC0EFE93C658FB49DD30@phx.gbl>
> > Content-Type: text/plain; charset="iso-8859-1"
> >
> >
> > Hello,
> > I compiled a cross tool chain for AMD geode processor using buildroot. I
> wanted to test the cross tools, so wrote a simple hello world application,
> exported the ...staging-dir/usr/bin/ path and compiled the C code using
> i686-linux-uclibc-gcc.
> >
> > When I run this program on the host machine, it gives me "bad ELF
> interpreter" as expected. But when I run it on the target, it gives me the
> following error
> > "syntax error: "(" unexpected"
> > I couldn't figure out where I am going wrong.
> > Any help would be appreciated.
> >
> > Thanks
> > Muktabh
> >
> > " I don't take sides, just the racing line "
> > -------------- next part --------------
> > An HTML attachment was scrubbed...
> > URL:
> http://busybox.net/lists/buildroot/attachments/20080509/8ff756a8/attachment.html
> >
> > ------------------------------
> >
> > Message: 2
> > Date: Fri, 9 May 2008 14:26:43 -0400
> > From: "John Voltz" <john.voltz@gmail.com>
> > Subject: Re: [Buildroot] Application execution fails
> > To: "Buildroot List" <buildroot@uclibc.org>
> > Message-ID:
> > <46a136670805091126t2047cf96gef83119ccd45ab13@mail.gmail.com>
> > Content-Type: text/plain; charset="iso-8859-1"
> >
> > try:
> >
> > /path/to/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc
> > -I/path/to/buildroot/build_i686/staging_dir/usr/include
> > -L/path/to/buildroot/build_i686/staging_dir/usr/lib -lc hello_world.c -o
> > hello_world
> >
> >
> >
> > On Fri, May 9, 2008 at 1:46 PM, Muktabh Anchlia <m_anchlia@hotmail.com>
> > wrote:
> >
> > > Hello,
> > > I compiled a cross tool chain for AMD geode processor using buildroot.
> I
> > > wanted to test the cross tools, so wrote a simple hello world
> application,
> > > exported the ...staging-dir/usr/bin/ path and compiled the C code
> using
> > > i686-linux-uclibc-gcc.
> > >
> > > When I run this program on the host machine, it gives me "bad ELF
> > > interpreter" as expected. But when I run it on the target, it gives me
> the
> > > following error
> > > "syntax error: "(" unexpected"
> > > I couldn't figure out where I am going wrong.
> > > Any help would be appreciated.
> > >
> > > Thanks
> > > Muktabh
> > >
> > > *" I don't take sides, just the racing line "*
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at uclibc.org
> > > http://busybox.net/mailman/listinfo/buildroot
> > >
> > -------------- next part --------------
> > An HTML attachment was scrubbed...
> > URL:
> http://busybox.net/lists/buildroot/attachments/20080509/d2673767/attachment-0001.htm
> >
> > ------------------------------
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
> > End of buildroot Digest, Vol 23, Issue 20
> > *****************************************
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080511/35e5a9fc/attachment-0001.htm 
