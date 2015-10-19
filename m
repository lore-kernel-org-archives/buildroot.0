From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Oct 2015 22:53:10 +0200
Subject: [Buildroot] [PATCH 1/4] mkpimage: new host package
In-Reply-To: <CAGduivyRx81uOHiT=JVj2=1iUw9jCQhgxUbqAxBJR0Wu9GVVtg@mail.gmail.com>
References: <1445271894-22553-1-git-send-email-viktorin@rehivetech.com>
 <1445271894-22553-2-git-send-email-viktorin@rehivetech.com>
 <CAGduivyRx81uOHiT=JVj2=1iUw9jCQhgxUbqAxBJR0Wu9GVVtg@mail.gmail.com>
Message-ID: <20151019225310.5cf90a28@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, Jan,

On Mon, 19 Oct 2015 21:04:51 +0200, Maxime Hadjinlian wrote:

> > +ifndef HOSTGO
> > +HOSTGO := go
> > +HOSTGO := $(shell which $(HOSTGO) || type -p $(HOSTGO) || echo go)
> > +endif

Ouch, having to depend on Go for such a simple tool is indeed not very
nice :-/

> Even I don't use this tool anymore, after I reversed the code from Altera's
> own tool, they released the documentation for the SPL signing and the fine
> people at Barebox, created a small program (in C) that does exactly the
> same, which you can find there:
> http://git.pengutronix.de/?p=barebox.git;a=blob;f=scripts/socfpga_mkimage.c;h=1a7a66d98841e9f52c3ea49c651286aa1412c9a5;hb=HEAD
> 
> However, I don't know how you would integrate such a tool, having a special
> package ? Making U-Boot depends on Barebox sounds a bit crazy. But it would
> be lighter than having to grab the go compiler for such a simple program.

I agree. Unfortunately, downloading directly
http://git.pengutronix.de/?p=barebox.git;a=blob_plain;f=scripts/socfpga_mkimage.c;h=$(MKPIMAGE_VERSION);hb=HEAD
doesn't work because this URL contains ';' which our download
infrastructure doesn't like much.

However, this program is so simple that I would advocate taking the
makedevs route: simply integrate the program source code itself inside
Buildroot, in package/mkpimage/.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
