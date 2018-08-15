From: Christopher McCrory <chrismcc@gmail.com>
Date: Wed, 15 Aug 2018 04:24:27 -0700
Subject: [Buildroot] [PATCH 17/17] perl-termreadkey: new package
In-Reply-To: <20180814155337.GM7915@scaer>
References: <20180811182749.20924-1-chrismcc@gmail.com>
 <20180811182749.20924-18-chrismcc@gmail.com>
 <20180813235716.070f77f0@windsurf> <20180814155337.GM7915@scaer>
Message-ID: <CALURroQQrDa5m5=0BVYaW1zr2hEK9dNvoihqoQG1Om2adZhw6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello


On Tue, Aug 14, 2018 at 8:53 AM, Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Thomas, Christopher, All,
>
> On 2018-08-13 23:57 +0200, Thomas Petazzoni spake thusly:
> > Adding Yann and Arnout, licensing question below.
> > On Sat, 11 Aug 2018 11:27:49 -0700, Christopher McCrory wrote:
> > > +PERL_TERMREADKEY_VERSION = 2.37
> > > +PERL_TERMREADKEY_SOURCE = TermReadKey-$(PERL_
> TERMREADKEY_VERSION).tar.gz
> > > +PERL_TERMREADKEY_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JS/JSTOWE
> > > +PERL_TERMREADKEY_LICENSE = Artistic or GPL-1.0+
> >
> > This is not correct I believe.
>
> IANAL...
>
> Indeed it's not.
>
>

The current maintainer explains it here:

https://github.com/jonathanstowe/TermReadKey/issues/11







> > The README file says this:
> >
> > """
> >  Term::ReadKey 2.36 - Change terminal modes, and perform non-blocking
> reads.
> >
> >  Copyright (C) 1994-1999 Kenneth Albanowski.
> >                2001-2016 Jonathan Stowe and others
> >
> > This package is dual licensed.  You can either choose to license it under
> > the original terms which were:
> >
> >  Unlimited distribution and/or modification is allowed as long as this
> >  copyright notice remains intact.
> >
> > Or the standard Perl terms:
> >
> >   This module is free software; you can redistribute it and/or modify it
> >   under the terms of the Artistic License. For details, see the full
> >   text of the license in the file "Artistic" that should have been
> provided
> >   with the version of perl you are using.
> >
> >   This program is distributed in the hope that it will be useful, but
> >   without any warranty; without even the implied warranty of
> merchantability
> >   or fitness for a particular purpose.
> > """
> >
> > So it is not under "Artistic or GPL-1.0+", but it is under "Artistic or
> > <some funky license>".
> >
> > According to
> > http://docs.activestate.com/activeperl/5.22/perl/lib/Term/ReadKey.html,
> > the small "Unlimited distribution..." license was the only license of
> > this Perl module up to version 2.31, at which point the Artistic
> > license was added as an option.
> >
> > I don't know how to SPDX-encode this weird license. Perhaps we should
> > simply not care, and say the license is just "Artistic" ? Yann ?
> > Arnout ?
>
> According to the SPDX FAQ [0]:
>
>   * How does one handle [...] licenses not found in the SPDX License
>     List?
>
>     [...] one can add the license text to the SPDX file and define a new
>     license label. That license identifier is defined only for that
>     specific SPDX document. This is explained in Section 6 of the SPDX
>     Specification or see [1].
>
> However, we do not have our own SPDX document in Buildroot, so section 6
> does not apply.
>
> However, we already have similar situations, where we simply state
> something like:
>
>     FOO_LICENSE = Foo license
>
> So, I would state something similar here:
>
>     PERL_TERMREADKEY_LICENSE = Term::ReadKey license or Artistic-1.0-Perl
>
> Please double-check which versiopn of the Artistic license this is
> refering to (i.e. the docs says "see the full text of the license in the
> file "Artistic" that should have been provided with the version of perl
> you are using.", so I just used Artistic-1.0-Perl but I'm not sure...)
>
> Regards,
> Yann E. MORIN.
>
> [0] https://spdx.org/frequently-asked-questions-faq-0
> [1] https://spdx.org/spdx-specification-21-web-version#h.1v1yuxt
>
> --
> .-----------------.--------------------.------------------.-
> -------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
> '------------------------------^-------^------------------^-
> -------------------'
>



-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180815/35a473f3/attachment.html>
