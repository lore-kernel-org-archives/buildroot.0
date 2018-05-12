From: ratbert90 <aduskett@gmail.com>
Date: Sat, 12 May 2018 01:22:49 +0000
Subject: [Buildroot] Tesla is using Buildroot
In-Reply-To: <20180511215508.GA28572@jaya>
References: <20180511172314.28ba9f80@windsurf.home>,
 <20180511215508.GA28572@jaya>
Message-ID: <BLUPR0601MB705720B009168FB33EC2CA5FB9E0@BLUPR0601MB705.namprd06.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is pretty neat! The main website should really have a prominent list of companies that use Buildroot.

Google/Tesla/GoPro etc etc. It would be good advertisement!

Adam

________________________________
From: buildroot <buildroot-bounces@busybox.net> on behalf of anisse at astier.eu <anisse@astier.eu>
Sent: Friday, May 11, 2018 5:55:08 PM
To: Thomas Petazzoni
Cc: Olof Johansson; buildroot at uclibc.org
Subject: Re: [Buildroot] Tesla is using Buildroot

Hi,

On Fri, May 11, 2018 at 05:23:14PM +0200, Thomas Petazzoni wrote:
> Hello,
>
> I met a few engineers from Tesla at the Embedded Linux Conference in
> March, who told me they are using Buildroot. Now that their tree is
> publicly available online, I can share this information.
>
> Their Buildroot tree is at:
>
>   https://github.com/teslamotors/buildroot
>
> Unfortunately, it looks a bit ugly in terms of commit history: just
> a few huge comments that mix tons of changes together. I was told the
> autopilot configurations are there for now, but infotainment
> configurations should be added in the near future.
>
> It's of course very nice to see Buildroot being used on board of those
> vehicles!
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com


I've had a quick look at what's inside. Here is what I found:
 - it seems based on buildroot 2016.05, with backports from more recent
   versions; but at its core it's still a 2016.05
 - there are a few packages tesla-{findutils, grep, bash, gzip, which, rsync}
   that are here with old versions to work around GPLv3
 - there's a tesla-verity package which seems to be a custom init that
   checks the validity of the verity metadata and interacts with
   firmware to check soc lock status before calling dmsetup.
 - there are a few packages that look like backports: python-dateutil,
   nanomsg, python-pytz, python-jsonschema
 - tesla-binutils is a "real" host binutils (non-cross)
 - there's tesla-libsystemd stub that builds a libsystemd with stubbed
   functions
 - it has its own parallel building infrastructure, using the loglinear
   tool, first introduced in google fiber's buildroot implementation
   https://gfiber.googlesource.com/buildroot/
 - many packages are patched to modify behaviour, customize build
   options: business as usual
 - probably many things I've missed


I've added Olof in cc.

Regards,

Anisse
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180512/83146a35/attachment.html>
