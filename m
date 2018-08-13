From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 23:57:16 +0200
Subject: [Buildroot] [PATCH 17/17] perl-termreadkey: new package
In-Reply-To: <20180811182749.20924-18-chrismcc@gmail.com>
References: <20180811182749.20924-1-chrismcc@gmail.com>
 <20180811182749.20924-18-chrismcc@gmail.com>
Message-ID: <20180813235716.070f77f0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Yann and Arnout, licensing question below.

On Sat, 11 Aug 2018 11:27:49 -0700, Christopher McCrory wrote:

> +PERL_TERMREADKEY_VERSION = 2.37
> +PERL_TERMREADKEY_SOURCE = TermReadKey-$(PERL_TERMREADKEY_VERSION).tar.gz
> +PERL_TERMREADKEY_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JS/JSTOWE
> +PERL_TERMREADKEY_LICENSE = Artistic or GPL-1.0+

This is not correct I believe.

The README file says this:

"""
 Term::ReadKey 2.36 - Change terminal modes, and perform non-blocking reads.

 Copyright (C) 1994-1999 Kenneth Albanowski.
               2001-2016 Jonathan Stowe and others

This package is dual licensed.  You can either choose to license it under
the original terms which were:

 Unlimited distribution and/or modification is allowed as long as this
 copyright notice remains intact.

Or the standard Perl terms:

  This module is free software; you can redistribute it and/or modify it
  under the terms of the Artistic License. For details, see the full
  text of the license in the file "Artistic" that should have been provided
  with the version of perl you are using.

  This program is distributed in the hope that it will be useful, but
  without any warranty; without even the implied warranty of merchantability
  or fitness for a particular purpose.
"""

So it is not under "Artistic or GPL-1.0+", but it is under "Artistic or
<some funky license>".

According to
http://docs.activestate.com/activeperl/5.22/perl/lib/Term/ReadKey.html,
the small "Unlimited distribution..." license was the only license of
this Perl module up to version 2.31, at which point the Artistic
license was added as an option.

I don't know how to SPDX-encode this weird license. Perhaps we should
simply not care, and say the license is just "Artistic" ? Yann ?
Arnout ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
