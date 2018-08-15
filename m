From: Christopher McCrory <chrismcc@gmail.com>
Date: Wed, 15 Aug 2018 04:57:21 -0700
Subject: [Buildroot] [RFC PATCH 1/2] scancpan: support more licenses
In-Reply-To: <20180814133337.5b9338b0@windsurf>
References: <20180813131135.32651-1-chrismcc@gmail.com>
 <20180813131135.32651-2-chrismcc@gmail.com>
 <20180814133337.5b9338b0@windsurf>
Message-ID: <CALURroT5KwN8tbGpub7puTZrEUUi7OmHHCeeOG79wGWpQgdxrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello

On Tue, Aug 14, 2018 at 4:33 AM, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Christopher,
>
> So, taking Arnout/Yann feedback into account.
>
> On Mon, 13 Aug 2018 06:11:34 -0700, Christopher McCrory wrote:
>
> > diff --git a/utils/scancpan b/utils/scancpan
> > index da8e7b91ac..2070e2a233 100755
> > --- a/utils/scancpan
> > +++ b/utils/scancpan
> > @@ -692,8 +692,19 @@ while (my ($distname, $dist) = each %dist) {
> >                      : $dist->{license};
> >          # BR requires license name as in http://spdx.org/licenses/
> >          $license =~ s|apache_2_0|Apache-2.0|;
> > +        $license =~ s|apache_1_1|Apache-1.1|;
> > +        $license =~ s|apache|Apache-2.0|;
>
> In this case, scancpan should not conclude that Apache-2.0 is used,
> because "apache" is not specific enough. Instead, it should emit a
> warning.
>
>
I looked at CPAN/Meta/Converter.pm that is used to generate the META.json
files, it contains

*  apache      => 'apache_2_0',  # clearly stated as 2.0

But I'm going with you and warn



> >          $license =~ s|artistic_2|Artistic-2.0|;
> > +        $license =~ s|artistic|Artistic-1.0|;
> > +        $license =~ s|lgpl_2_1|LGPL-2.1|;
> > +        $license =~ s|lgpl_3_0|LGPL-3.0|;
> > +        $license =~ s|lgpl|LGPL-2.1|;
>
> Same.
>
>
yea


> > +        $license =~ s|bsd|BSD|;
>
> Same.
>
>
In one of the perl bits that generate the META.json files it adds the URL

https://opensource.org/licenses/bsd-license.php

which is the BSD 2 clause version.  But a google search with

site:metacpan.org 'LICENCE: bsd'

finds a mixture of two and three clause versions


I'll gen up another submission with these fixes.



Best regards,
>
> Thomas Petazzoni
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180815/80f622e9/attachment.html>
