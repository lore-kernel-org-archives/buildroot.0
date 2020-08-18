From: Olivier Dautricourt <olivier.dautricourt@orolia.com>
Date: Tue, 18 Aug 2020 19:21:19 +0200
Subject: [Buildroot] [PATCH 1/2] package/gpsd: bump version to 3.21
In-Reply-To: <20200818164919.498452cc@windsurf.home>
References: <20200817132336.1110072-1-olivier.dautricourt@orolia.com>
 <20200818164919.498452cc@windsurf.home>
Message-ID: <20200818172119.GA48223@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 08/18/2020 16:49, Thomas Petazzoni wrote:
> 
> Hello,
> 
> Thanks for your patch.
> 
> On Mon, 17 Aug 2020 15:23:35 +0200
> Olivier Dautricourt <olivier.dautricourt@orolia.com> wrote:
> 
> > - removed unnecessary patch
> > - removed obsolete gpsd options:
> >       GPSD_CONTROLSEND
Option was just removed upstream (e720403069dd6ca)
Reason given was: "It overlapped RECONFIGURE_ENABLE in strange ways".
This was preventing gpsctl to configure receivers, but i guess this
option is not relevant anymore.

> >       GPSD_RECONFIGURE
Replaced with -p (--passive) runtime option.
This is to prevent gpsd to auto-configure receivers.

> >       GPSD_FIXED_PORT_SPEED
This option was already removed in 3.20.
It is replaced with -s <speed> runtime option.
FIXED_STOP_BITS was also replaced with -f <framing> opt but this was never
included in the buildroot configuration anyway.
> 
> Could you comment about what happened to those options? Why were they
> removed? Indeed, we can't just drop Buildroot options like that.
> Depending on what happened to the corresponding features in upstream
> gpsd, we might need to add legacy handling for those options in
> Config.in.legacy.
> 
> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

I just commented on the removal of those 3 options.

Regards,

-- 
Olivier Dautricourt
