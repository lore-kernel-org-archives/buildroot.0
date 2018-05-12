From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 11 May 2018 22:42:45 -0300 (BRT)
Subject: [Buildroot] Tesla is using Buildroot
In-Reply-To: <BLUPR0601MB705720B009168FB33EC2CA5FB9E0@BLUPR0601MB705.namprd06.prod.outlook.com>
References: <20180511172314.28ba9f80@windsurf.home>
 <20180511215508.GA28572@jaya>
 <BLUPR0601MB705720B009168FB33EC2CA5FB9E0@BLUPR0601MB705.namprd06.prod.outlook.com>
Message-ID: <704976570.261553.1526089365924.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "ratbert90" <aduskett@gmail.com>
> To: anisse at astier.eu, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> Cc: "Olof Johansson" <olof@lixom.net>, buildroot at uclibc.org
> Sent: Friday, May 11, 2018 10:22:49 PM
> Subject: Re: [Buildroot] Tesla is using Buildroot

> This is pretty neat! The main website should really have a prominent list of
> companies that use Buildroot.

> Google/Tesla/GoPro etc etc. It would be good advertisement!

> Adam

> From: buildroot <buildroot-bounces@busybox.net> on behalf of anisse at astier.eu
> <anisse@astier.eu>
> Sent: Friday, May 11, 2018 5:55:08 PM
> To: Thomas Petazzoni
> Cc: Olof Johansson; buildroot at uclibc.org
> Subject: Re: [Buildroot] Tesla is using Buildroot
> Hi,

> On Fri, May 11, 2018 at 05:23:14PM +0200, Thomas Petazzoni wrote:
> > Hello,

> > I met a few engineers from Tesla at the Embedded Linux Conference in
> > March, who told me they are using Buildroot. Now that their tree is
> > publicly available online, I can share this information.

> > Their Buildroot tree is at:

>> [ https://github.com/teslamotors/buildroot |
> > https://github.com/teslamotors/buildroot ]

> > Unfortunately, it looks a bit ugly in terms of commit history: just
> > a few huge comments that mix tons of changes together. I was told the
> > autopilot configurations are there for now, but infotainment
> > configurations should be added in the near future.

> > It's of course very nice to see Buildroot being used on board of those
> > vehicles!

> > Best regards,

> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> > Embedded Linux and Kernel engineering
> > [ https://bootlin.com/ | https://bootlin.com ]

> I've had a quick look at what's inside. Here is what I found:
> - it seems based on buildroot 2016.05, with backports from more recent
> versions; but at its core it's still a 2016.05
> - there are a few packages tesla-{findutils, grep, bash, gzip, which, rsync}
> that are here with old versions to work around GPLv3

... which highlights the need for some mechanism to blacklist licenses
and warn the user in the configuration menu that a package cannot be
selected because of license restrictions.

> - there's a tesla-verity package which seems to be a custom init that
> checks the validity of the verity metadata and interacts with
> firmware to check soc lock status before calling dmsetup.
> - there are a few packages that look like backports: python-dateutil,
> nanomsg, python-pytz, python-jsonschema
> - tesla-binutils is a "real" host binutils (non-cross)
> - there's tesla-libsystemd stub that builds a libsystemd with stubbed
> functions

Makes me wonder why they don't use a BR2_EXTERNAL.

> - it has its own parallel building infrastructure, using the loglinear
> tool, first introduced in google fiber's buildroot implementation
> [ https://gfiber.googlesource.com/buildroot/ |
> https://gfiber.googlesource.com/buildroot/ ]
> - many packages are patched to modify behaviour, customize build
> options: business as usual
> - probably many things I've missed

> I've added Olof in cc.

> Regards,

> Anisse

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
