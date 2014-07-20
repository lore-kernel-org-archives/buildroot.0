From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jul 2014 10:26:11 +0200
Subject: [Buildroot] glib 2.40 on xtensa
In-Reply-To: <CAMo8Bf+SfLYex0+040254AgNVfRM542-hoHfY355oxaw7ZWcww@mail.gmail.com>
References: <20140719004023.4a71d4b8@free-electrons.com>
 <CAMo8BfKDFvct4=wDsFVObRMab9P-73LcMvJU2JaNozR=swbT2A@mail.gmail.com>
 <20140719113327.5393bf25@free-electrons.com>
 <CAMo8Bf+SfLYex0+040254AgNVfRM542-hoHfY355oxaw7ZWcww@mail.gmail.com>
Message-ID: <20140720102611.69817922@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Sun, 20 Jul 2014 04:17:53 +0400, Max Filippov wrote:

> > Argh. There's no NPTL support for:
> >
> >  - ARC (but I believe it's coming)
> >  - AVR32 (but we're deprecating this architecture, so we don't care)
> >  - Blackfin (and I don't think there's much hope to have NPTL one day,
> >    but glib is anyway disabled on !MMU platforms, so we don't care)
> >  - Xtensa (don't know)
> >  - i386 (because NPTL requires at least i486)
> >
> > Should we patch glib to make the support of the GCond stuff optional,
> > and hope not too many programs will use it? Or simply add the NPTL
> > dependency to glib, but that would mean a huge number of packages
> > suddenly become unavailable for some architectures.
> 
> There's a patch in glib mainline that implements GMutex natively on linux.
> It applies cleanly to glib-2.40 and with it xtensa builds successfully.
> I can post a buildroot patch with it.

Ah, thanks, sounds good!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
