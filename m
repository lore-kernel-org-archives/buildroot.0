From: Arun Reddy <reddyac@gmail.com>
Date: Sun, 11 May 2008 20:24:19 -0700
Subject: [Buildroot] ARM build error with llseek.c
In-Reply-To: <326f33790805081813lff2c266wfc23c361119452df@mail.gmail.com>
References: <326f33790805081549v3afdc776u56cdeb8e57167782@mail.gmail.com>
	<1CF6EDDF0820924DA43C9A52FE7325950B4DA9C3@MI8NYCMAIL17.Mi8.com>
	<326f33790805081624g2daf1407v15e8e84ad1914b77@mail.gmail.com>
	<1CF6EDDF0820924DA43C9A52FE7325950B4DAA2E@MI8NYCMAIL17.Mi8.com>
	<326f33790805081812sc3b8d29v948f331f7fe84653@mail.gmail.com>
	<326f33790805081813lff2c266wfc23c361119452df@mail.gmail.com>
Message-ID: <326f33790805112024l75b6e2d5x41f4fb229b982274@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey everyone,

I was just curious if anyone had any more suggestions on this problem? I am
still finding myself stuck with it. Thank you.

On Thu, May 8, 2008 at 6:13 PM, Arun Reddy <reddyac@gmail.com> wrote:

> CC'd buildroot list
>
>
> On Thu, May 8, 2008 at 6:12 PM, Arun Reddy <reddyac@gmail.com> wrote:
>
> > Thank you for your help. If anyone would like to chime in on how to
> > define _syscall5 or just with dealing with this problem you would be helping
> > a lot!
> >
> >
> > On Thu, May 8, 2008 at 4:30 PM, hartleys <hartleys@visionengravers.com>
> > wrote:
> >
> > >  Unfortunately no... Like I said I have not yet tried to build a
> > > toolchain from source. Sorry
> > >
> > >  ------------------------------
> > > *From:* Arun Reddy [mailto:reddyac at gmail.com]
> > > *Sent:* Thursday, May 08, 2008 4:24 PM
> > > *To:* hartleys
> > > *Cc:* Buildroot List
> > > *Subject:* Re: [Buildroot] ARM build error with llseek.c
> > >
> > > Thanks for the information hartleys. Do you know how I can go about
> > > defining _syscall5? Will I need to go into uClibc's menuconfig and select it
> > > first?
> > >
> > > On Thu, May 8, 2008 at 4:11 PM, hartleys <hartleys@visionengravers.com>
> > > wrote:
> > >
> > > >  This is just a guess but...
> > > >
> > > > I'm still using a prebuilt external toolchain and haven't tried
> > > > building one from source yet so I'm not sure how to fix it. But, maybe this
> > > > information to help.
> > > >
> > > > It appears you have a problem with your toolchain. That line in
> > > > llseek.c should be invoving a uClibc macro (_syscall5) but it's not defined
> > > > so the compiler is dying on the syntax of the "function" _syscall.
> > > >
> > > > Just my two cents...
> > > >
> > > >
> > > >  ------------------------------
> > > > *From:* buildroot-bounces at uclibc.org [mailto:
> > > > buildroot-bounces at uclibc.org] *On Behalf Of *Arun Reddy
> > > > *Sent:* Thursday, May 08, 2008 3:49 PM
> > > > *To:* Buildroot List
> > > > *Subject:* [Buildroot] ARM build error with llseek.c
> > > >
> > > >   Hi everyone,
> > > >
> > > > I am continuing with my ARM build and I ran into a problem with
> > > > llseek.c:
> > > >
> > > > http://img211.imageshack.us/img211/6387/e2fsprogsph4.jpg
> > > >
> > > > I found that this problem was reported before:
> > > > http://bugs.busybox.net/view.php?id=1548
> > > >
> > > > and the solution seemed to involve enabling large file support in
> > > > buildroot's configuration. I did this, but still get the same error. Does
> > > > anyone know why LFS needs to be activated and in my case, why it doesn't
> > > > resolve this issue? Any help on this problem would be appreciated. Thank
> > > > you.
> > > >
> > > >
> > >
> >
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080511/4f43bd29/attachment.htm 
