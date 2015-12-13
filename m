From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 18:57:44 +0100
Subject: [Buildroot] [V4 2/3] perl-mail-spamassassin: new package
In-Reply-To: <CAB0FRsvGc-vVB0o9cATPAPaTG3B_aSWVPMV2MYX_vyKFio2Kiw@mail.gmail.com>
References: <1449411276-27492-1-git-send-email-francois.perrad@gadz.org>
 <1449411276-27492-3-git-send-email-francois.perrad@gadz.org>
 <20151213160055.68f009ef@free-electrons.com>
 <CAB0FRsvGc-vVB0o9cATPAPaTG3B_aSWVPMV2MYX_vyKFio2Kiw@mail.gmail.com>
Message-ID: <20151213185744.263016b5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois,

On Sun, 13 Dec 2015 17:12:32 +0100, Fran?ois Perrad wrote:

> > Also, since you're fixing several independent problems, what about
> > doing a single patch for each problem ?
> >
> > Do you think you could write the patches in a way that makes them
> > potentially acceptable upstream ?
> >
> 
> No way.

Why ? After all, everything that you did could be made conditional
under a CROSS_COMPILE boolean variable for example. Or the BUILD_SPAMC
variable could be made to work also on Linux and not only on Windows,
etc.

> >> +config BR2_PACKAGE_PERL_MAIL_SPAMASSASSIN_CONTACT_ADDRESS
> >> +     string "contact address"
> >> +     default "the administrator of that BR system"
> >
> > Do we really need a compile time option for this? Can't this be
> > configured at run-time in some configuration file?
> >
> 
> Yes, the string is subsituted in several scripts, not in single
> configuration file.

Argh :/

> > Shouldn't the default be an empty string rather than the "the
> > administrator of that BR system" ?
> 
> This is the default value from the SpamAssassin Makefile.PL, I just added "BR".

I think "the administrator of that BR system" is a pretty silly default
string, especially when what is wanted is an e-mail address or URL. So
either put contact at dummy.net, or http://dummy.net or something like
that.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
