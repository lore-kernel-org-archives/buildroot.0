From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 13 Aug 2018 10:35:55 -0700
Subject: [Buildroot] [RFC PATCH 1/2] scancpan: support more licenses
In-Reply-To: <20180813185453.5b8bae4a@windsurf>
References: <20180813131135.32651-1-chrismcc@gmail.com>
 <20180813131135.32651-2-chrismcc@gmail.com>
 <20180813185453.5b8bae4a@windsurf>
Message-ID: <CALURroRRC9sPBLeAuv4=0XOwgGvnEZchKU03xxPtgn0Uheik3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 13, 2018 at 9:54 AM, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Mon, 13 Aug 2018 06:11:34 -0700, Christopher McCrory wrote:
>
> >          $license =~ s|apache_2_0|Apache-2.0|;
> > +        $license =~ s|apache_1_1|Apache-1.1|;
> > +        $license =~ s|apache|Apache-2.0|;
>
> So just "apache" always means it's Apache-2.0 ?
>
> >          $license =~ s|artistic_2|Artistic-2.0|;
> > +        $license =~ s|artistic|Artistic-1.0|;
> > +        $license =~ s|lgpl_2_1|LGPL-2.1|;
> > +        $license =~ s|lgpl_3_0|LGPL-3.0|;
> > +        $license =~ s|lgpl|LGPL-2.1|;
>
> Just "lgpl" always means it's LGPL-2.1 ?
>
> Apparently



> > +        $license =~ s|bsd|BSD|;
>
> "BSD" is not a license. There are several different BSD licenses.
> Though with just "bsd" as an initial information, there's not much you
> can do :-/
>
>
yea :(


AFAICT, this is the source from Base.pm


  my %licenses = (
    perl         => 'Perl_5',
    apache       => 'Apache_2_0',
    apache_1_1   => 'Apache_1_1',
    artistic     => 'Artistic_1',
    artistic_2   => 'Artistic_2',
    lgpl         => 'LGPL_2_1',
    lgpl2        => 'LGPL_2_1',
    lgpl3        => 'LGPL_3_0',
    bsd          => 'BSD',
    gpl          => 'GPL_1',
    gpl2         => 'GPL_2',
    gpl3         => 'GPL_3',
    mit          => 'MIT',
    mozilla      => 'Mozilla_1_1',
    restrictive  => 'Restricted',
    open_source  => undef,
    unrestricted => undef,
    unknown      => undef,
  );

 # TODO - would be nice to not have these here, since they're more
  # properly stored only in Software::License
  my %license_urls = (
    perl         => 'http://dev.perl.org/licenses/',
    apache       => 'http://apache.org/licenses/LICENSE-2.0',
    apache_1_1   => 'http://apache.org/licenses/LICENSE-1.1',
    artistic     => 'http://opensource.org/licenses/artistic-license.php',
    artistic_2   => 'http://opensource.org/licenses/artistic-license-2.0.php
',
    lgpl         => 'http://opensource.org/licenses/lgpl-license.php',
    lgpl2        => 'http://opensource.org/licenses/lgpl-2.1.php',
    lgpl3        => 'http://opensource.org/licenses/lgpl-3.0.html',
    bsd          => 'http://opensource.org/licenses/bsd-license.php',
    gpl          => 'http://opensource.org/licenses/gpl-license.php',
    gpl2         => 'http://opensource.org/licenses/gpl-2.0.php',
    gpl3         => 'http://opensource.org/licenses/gpl-3.0.html',
    mit          => 'http://opensource.org/licenses/mit-license.php',
    mozilla      => 'http://opensource.org/licenses/mozilla1.1.php',
    restrictive  => undef,
    open_source  => undef,
    unrestricted => undef,
    unknown      => undef,
  );






> Best regards,
>
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180813/739880ce/attachment.html>
