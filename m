From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 20 Aug 2018 05:12:22 -0700
Subject: [Buildroot] [PATCH 04/18] perl-time-parsedate: new package
In-Reply-To: <20180820135930.67c124db@windsurf>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-5-chrismcc@gmail.com>
 <20180820135930.67c124db@windsurf>
Message-ID: <CALURroRXJRkT3agrhjCniDUV608M06Tm+n_7ssFL=w2FiWpytg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 20, 2018 at 4:59 AM, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Mon, 20 Aug 2018 04:55:05 -0700, Christopher McCrory wrote:
>
> > +PERL_TIME_PARSEDATE_VERSION = 2015.103
> > +PERL_TIME_PARSEDATE_SOURCE = Time-ParseDate-$(PERL_TIME_
> PARSEDATE_VERSION).tar.gz
> > +PERL_TIME_PARSEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/
> M/MU/MUIR/modules
> > +PERL_TIME_PARSEDATE_LICENSE_FILES = README
> > +PERL_TIME_PARSEDATE_LICENSE = unknown
>
> Could you check with upstream what is the license ? An unknown license
> means you're not allow to redistribute it, which would be a bit
> annoying, no ?
>
> Here is what Debian says about the license:
>
>   https://metadata.ftp-master.debian.org/changelogs/main/
> libt/libtime-parsedate-perl/libtime-parsedate-perl_2015.103-2_copyright
>
> I.e:
>
>  License hereby granted for anyone to use, modify or redistribute this
> module
>  at their own risk. Please feed useful changes back to
> cpan at dave.sharnoff.org.
>
> So, "Time::ParseDate License" ?
>
>

It looks like I missed putting this in the cover leter
0013-perl-time-parsedate-add-license.patch has



-PERL_TIME_PARSEDATE_LICENSE = unknown
+# https://fedoraproject.org/wiki/Licensing/TPDL
+PERL_TIME_PARSEDATE_LICENSE = Public Domain

THe URL has:

This is a very short permissive license found in the perl module
Time::ParseDate. The request to "feed useful changes back" is interpreted
as a polite request, not a requirement. It is Free and GPL compatible.

Copyright (C) 1996-2010 David Muir Sharnoff. Copyright (C) 2011 Google, Inc.
License hereby granted for anyone to use, modify or redistribute this module
at their own risk. Please feed useful changes back to cpan at dave.sharnoff.org
.



If you want to change it locally to what you think is best before commiting
and ignore 0013 , I'm good with that.





> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>



-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180820/53120560/attachment.html>
