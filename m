From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Thu, 21 Feb 2013 01:55:49 +0100 (CET)
Subject: [Buildroot] libmad and AVR32 optimisations
In-Reply-To: <CAKcgs2wW-vj=1NENE0mLmaZjwD6z9MrhzVm4aScnuX1f7COToQ@mail.gmail.com>
References: <CAKcgs2zty=9pybVT7FwDMmSK0omc1x9tgwmDkgiMbixjFkv-oA@mail.gmail.com>
 <771436318.25518.1361402063381.JavaMail.root@advansee.com>
 <CAKcgs2wW-vj=1NENE0mLmaZjwD6z9MrhzVm4aScnuX1f7COToQ@mail.gmail.com>
Message-ID: <480571590.25796.1361408149135.JavaMail.root@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gilles,

Please always Cc the mailing list, use plain text (no HTML), and format your
answers using bottom posting:
http://en.wikipedia.org/wiki/Posting_style#Bottom-posting

On Thursday, February 21, 2013 12:41:12 AM, Gilles Talis wrote:
> Dear Benoit,

> Thanks for your answer.
> This was my initial thought: fix the package options. I agree with you that
> it is easier.
> But then I realized that it might be cleaner to fix the patch itself.

> Still my question remains: is it worth it? Who, beside autobuilder, will
> actually use such a configuration (build libmad on AVR32 without
> architecture-specific optimizations).

It is up to BuildRoot maintainers to decide. But I have already used this patch
on AVR32, and the performance is too low without it to be able to do interesting
things in parallel, so I don't think that any AVR32 user would be interested in
libmad without enabling these optmizations, all the more the audio quality with
these optimizations is still excellent.

It's not like on ARM for which some settings produce distorted audio with some
MP3s, so here all the settings make sense.

> Thanks
> Gilles.

> 2013/2/20 Beno?t Th?baudeau < benoit.thebaudeau@advansee.com >

> > Dear Gilles,
> 

> > On Wednesday, February 20, 2013 11:58:29 PM, Gilles Talis wrote:
> 
> > > All,
> 

> > > There is small issue in the AVR32 optimization patch [1]. This is root
> > > cause
> 
> > > for autobuild failures: e01f5a5484299dce1797966445f3972583c67b22 and
> 
> > > 7ed0563fbbfc19c93ec5be35d3b6a95e496b4c5d.
> 

> > > Reason is that some fixed-point math routines are implemented in
> 
> > > architecture-specific files. If "architecture-specific optimizations"
> > > option
> 
> > > is disabled from the build configuration, these routines are not
> > > compiled,
> 
> > > but libmad is built with references to these functions though.
> 

> > > My question is: is this issue worth fixing? I assume that libmad users
> > > will
> 
> > > usually enable all possible architecture-specific optimizations.
> 

> > > Thanks
> 
> > > Gilles.
> 

> > > [1] package/libmad/libmad-0.15.1b-optimization.patch.avr32
> 

> > This patch was clearly made for specific libmad settings. Rather than
> > fixing
> > it,
> 
> > it would be easier to simply add a "depends on !BR2_avr32" to the config
> > options
> 
> > that fail on AVR32.

Best regards,
Beno?t
