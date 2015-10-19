From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 19 Oct 2015 23:12:21 +0200
Subject: [Buildroot] [PATCH 1/4] mkpimage: new host package
In-Reply-To: <20151019210610.GG3651@free.fr>
References: <1445271894-22553-1-git-send-email-viktorin@rehivetech.com>
 <1445271894-22553-2-git-send-email-viktorin@rehivetech.com>
 <CAGduivyRx81uOHiT=JVj2=1iUw9jCQhgxUbqAxBJR0Wu9GVVtg@mail.gmail.com>
 <20151019225310.5cf90a28@free-electrons.com> <20151019210610.GG3651@free.fr>
Message-ID: <CAGduivxMZixMLiWcT4UoCf_iQ8soA9zYKtJ2XrkxCn+9exS7Eg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 19, 2015 at 11:06 PM, Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Thomas, All,
>
> On 2015-10-19 22:53 +0200, Thomas Petazzoni spake thusly:
> > On Mon, 19 Oct 2015 21:04:51 +0200, Maxime Hadjinlian wrote:
> > > > +ifndef HOSTGO
> > > > +HOSTGO := go
> > > > +HOSTGO := $(shell which $(HOSTGO) || type -p $(HOSTGO) || echo go)
> > > > +endif
> >
> > Ouch, having to depend on Go for such a simple tool is indeed not very
> > nice :-/
>
> Or we can eventually look at the Go package that was submitted a while
> back, and to which I contributed:
>     https://patchwork.ozlabs.org/patch/502222/
>
> ;-)
>
> > > Even I don't use this tool anymore, after I reversed the code from
> Altera's
> > > own tool, they released the documentation for the SPL signing and the
> fine
> > > people at Barebox, created a small program (in C) that does exactly the
> > > same, which you can find there:
> > >
> http://git.pengutronix.de/?p=barebox.git;a=blob;f=scripts/socfpga_mkimage.c;h=1a7a66d98841e9f52c3ea49c651286aa1412c9a5;hb=HEAD
> > >
> > > However, I don't know how you would integrate such a tool, having a
> special
> > > package ? Making U-Boot depends on Barebox sounds a bit crazy. But it
> would
> > > be lighter than having to grab the go compiler for such a simple
> program.
> >
> > I agree. Unfortunately, downloading directly
> >
> http://git.pengutronix.de/?p=barebox.git;a=blob_plain;f=scripts/socfpga_mkimage.c;h=$(MKPIMAGE_VERSION);hb=HEAD
> > doesn't work because this URL contains ';' which our download
> > infrastructure doesn't like much.
> >
> > However, this program is so simple that I would advocate taking the
> > makedevs route: simply integrate the program source code itself inside
> > Buildroot, in package/mkpimage/.
>
> Yup, agreed.
>
Agreed too, I'll send the current package that I have that does just that.
Jan: I'll put you in CC so if you want to work with it/on it, feel free !

>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151019/b688f0d6/attachment.html>
