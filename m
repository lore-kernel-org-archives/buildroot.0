From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 22:30:41 +0200
Subject: [Buildroot] [PATCH 1/2] package/gpsd: bump version to 3.21
In-Reply-To: <20200818172119.GA48223@orolia.com>
References: <20200817132336.1110072-1-olivier.dautricourt@orolia.com>
 <20200818164919.498452cc@windsurf.home>
 <20200818172119.GA48223@orolia.com>
Message-ID: <20200818223041.485653f7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Olivier,

On Tue, 18 Aug 2020 19:21:19 +0200
Olivier Dautricourt <olivier.dautricourt@orolia.com> wrote:

> > > - removed unnecessary patch
> > > - removed obsolete gpsd options:
> > >       GPSD_CONTROLSEND  
> Option was just removed upstream (e720403069dd6ca)
> Reason given was: "It overlapped RECONFIGURE_ENABLE in strange ways".
> This was preventing gpsctl to configure receivers, but i guess this
> option is not relevant anymore.
> 
> > >       GPSD_RECONFIGURE  
> Replaced with -p (--passive) runtime option.
> This is to prevent gpsd to auto-configure receivers.
> 
> > >       GPSD_FIXED_PORT_SPEED  
> This option was already removed in 3.20.
> It is replaced with -s <speed> runtime option.
> FIXED_STOP_BITS was also replaced with -f <framing> opt but this was never
> included in the buildroot configuration anyway.

Then I think we need Config.in.legacy handling for the removal of those
3 options.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
