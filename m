From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 12 Sep 2013 16:51:51 -0500
Subject: [Buildroot] [PATCH 2/3] Add support for BR2_EXTERNAL
In-Reply-To: <5232351D.3030703@mind.be>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378646129-4167-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF916AAFB6.8E78891C-ON86257BE3.000A49F0-86257BE3.000B5AF0@rockwellcollins.com>
 <52322C8E.7010501@mind.be>
 <OFD093CE04.A9291FB9-ON86257BE4.007504CF-86257BE4.00762929@rockwellcollins.com>
 <5232351D.3030703@mind.be>
Message-ID: <OFCA626374.83240A5A-ON86257BE4.0077C33E-86257BE4.00781ADF@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> wrote on 09/12/2013 04:41:49 PM:

> On 12/09/13 23:30, Ryan Barnett wrote:
> > Arnout Vandecappelle <arnout@mind.be> wrote on 09/12/2013 04:05:18 PM:
> >
> >  > On 11/09/13 04:03, rjbarnet at rockwellcollins.com wrote:
> >  > > Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on
> >  > > 09/08/2013 08:15:28 AM:
> >  > >
> >  > >  >
> >  > >  > Signed-off-by: Thomas Petazzoni 
<thomas.petazzoni@free-electrons.com>
> >  > >  > ---
> >  > >  >  Config.in   |  6 ++++--
> >  > >  >  Makefile    | 29 +++++++++++++++++++++++++----
> >  > >  >  docs/manual/manual.mk |  2 +-
> >  > >
> >  > > One idea that I have, is for the make file that is genreated for 
the an
> >  > > external output directory, if we could preserve the the value of
> >  > > BR2_EXTERNAL
> >  > > as follows.
> >  >
> >  >   Thomas's patch already does that, because BR2_EXTERNAL is stored 
in the
> >  > config file.
> >  >
> >
> > I don't believe it gets stored in the config since Config.in pulls
> > the variable in from the shell's or make's environment.
> >
> > +config BR2_EXTERNAL
> > +       string
> > +       option env="BR2_EXTERNAL"
> >
> > In order to utilize the BR2_EXTERNAL feature I must have BR2_EXTERNAL
> > either exported into my environment or be called as
> 
>   The Makefile exports it in the environment of the Kconfig targets. So 
> once it is in the .config, it will stay there. Try it and you'll see :-)

I have looked as I'm experiment with this and it definitely isn't there :) 

Also according to the documentation you need to define it every time :)

> >
> > 'make BR2_EXTERNAL=/some/path <target>'
> >
> >
> > When utilizing the BR2_EXTERNAL I usual want to use some defconfig 
from
> > my BR2_EXTERNAL so it adding it the makefile that is generated in your
> > build directory when specifying O= would be extermely useful as that
> > way I can switch shells and my definition of BR2_EXTERNAL would still
> > be present.
> >
> > 'make O=/build/path BR2_EXTERNAL=/path/to/external defconfig'
> 
>   In this particular case, you're not using the Makefile in the output 
> dir but only in the buildroot dir so it's not relevant.
> 
>   The only case where it would be relevant is when you have an existing 
> output directory, you remove the .config first, and then you do a
> make foo_defconfig. Seems a bit an unlikely scenario.
> 
>   Regards,
>   Arnout

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130912/1906f3f7/attachment.html>
