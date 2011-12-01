From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 1 Dec 2011 08:46:00 -0600
Subject: [Buildroot] [git commit] dropbear: bump to version 2011.54
In-Reply-To: <CAAXf6LVMmix+5RSbHDJKj09GGd_60Y6cBtSk2-+qODfOkvm2+g@mail.gmail.com>
References: <20111201085828.CEE7D8F626@busybox.osuosl.org>
 <20111201145224.197356c8@skate>
 <CAAXf6LVMmix+5RSbHDJKj09GGd_60Y6cBtSk2-+qODfOkvm2+g@mail.gmail.com>
Message-ID: <201112010846.03400.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu December 1 2011, Thomas De Schampheleire wrote:
> On Thu, Dec 1, 2011 at 2:52 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Le Thu, 1 Dec 2011 07:22:33 -0600,
> > "Michael S. Zick" <minimod@morethan.org> a ?crit :
> >
> >> Has the "DROPBEAR_SOURCE" line been accidentally dropped here?
> >> At "DROPBEAR_SITE" the package is named: dropbear-2011.54.tar.gz
> >> (or .tar.bz2)
> >
> > This <pkg>_SOURCE value is the default one:
> >
> > $(2)_BASE_NAME ?= ?$(1)-$$($(2)_VERSION)
> > $(2)_SOURCE ? ? ?= $$($(2)_BASE_NAME).tar.gz
> >
> > (from package/Makefile.package.in)
> 
> Just throwing the question out: should we adapt existing .mk files to
> remove lines that correspond to the default? This is such an example,
> and FOO_INSTALL_TARGET=YES is another one.
>

I would say yes, since people who are adding packages
might pick one of the ones with useless assignments as
their model and then useless assignments would never go
away (or Peter would have to tweak the new patches).

Mike
> Best regards,
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
